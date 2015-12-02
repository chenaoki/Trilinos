// @HEADER
//
// ***********************************************************************
//
//        MueLu: A package for multigrid based preconditioning
//                  Copyright 2012 Sandia Corporation
//
// Under the terms of Contract DE-AC04-94AL85000 with Sandia Corporation,
// the U.S. Government retains certain rights in this software.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are
// met:
//
// 1. Redistributions of source code must retain the above copyright
// notice, this list of conditions and the following disclaimer.
//
// 2. Redistributions in binary form must reproduce the above copyright
// notice, this list of conditions and the following disclaimer in the
// documentation and/or other materials provided with the distribution.
//
// 3. Neither the name of the Corporation nor the names of the
// contributors may be used to endorse or promote products derived from
// this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY SANDIA CORPORATION "AS IS" AND ANY
// EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
// PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL SANDIA CORPORATION OR THE
// CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
// EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
// PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
// PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
// LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
// NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//
// Questions? Contact
//                    Jonathan Hu       (jhu@sandia.gov)
//                    Andrey Prokopenko (aprokop@sandia.gov)
//                    Ray Tuminaro      (rstumin@sandia.gov)
//                    Tobias Wiesner    (tawiesn@sandia.gov)
//
// ***********************************************************************
//
// @HEADER
#include <iostream>
#include <sstream>
#include <string>
#include <fstream>

#include <Xpetra_MultiVectorFactory.hpp>

// Teuchos
#include <Teuchos_StandardCatchMacros.hpp>

// Galeri
#include <Galeri_XpetraParameters.hpp>
#include <Galeri_XpetraProblemFactory.hpp>
#include <Galeri_XpetraUtils.hpp>
#include <Galeri_XpetraMaps.hpp>
//

#include <MueLu.hpp>
#include <MueLu_Level.hpp>
#include <MueLu_BaseClass.hpp>
#include <MueLu_ParameterListInterpreter.hpp> // TODO: move into MueLu.hpp

#include <MueLu_Utilities.hpp>

#include <MueLu_UseDefaultTypes.hpp>
#include <MueLu_MutuallyExclusiveTime.hpp>

#ifdef HAVE_MUELU_BELOS
#include <BelosConfigDefs.hpp>
#include <BelosLinearProblem.hpp>
#include <BelosBlockCGSolMgr.hpp>
#include <BelosBlockGmresSolMgr.hpp>
#include <BelosXpetraAdapter.hpp>     // => This header defines Belos::XpetraOp
#include <BelosMueLuAdapter.hpp>      // => This header defines Belos::MueLuOp
#endif

int main(int argc, char *argv[]) {
#include <MueLu_UseShortNames.hpp>

  using Teuchos::RCP; // reference count pointers
  using Teuchos::rcp;
  using Teuchos::TimeMonitor;

  // =========================================================================
  // MPI initialization using Teuchos
  // =========================================================================
  Teuchos::GlobalMPISession mpiSession(&argc, &argv, NULL);

  bool success = false;
  bool verbose = true;
  try {
    RCP< const Teuchos::Comm<int> > comm = Teuchos::DefaultComm<int>::getComm();

    // =========================================================================
    // Convenient definitions
    // =========================================================================
    SC zero = Teuchos::ScalarTraits<SC>::zero(), one = Teuchos::ScalarTraits<SC>::one();

    // Instead of checking each time for rank, create a rank 0 stream
    RCP<Teuchos::FancyOStream> fancy = Teuchos::fancyOStream(Teuchos::rcpFromRef(std::cout));
    Teuchos::FancyOStream& fancyout = *fancy;
    fancyout.setOutputToRootOnly(0);


    // =========================================================================
    // Parameters initialization
    // =========================================================================
    Teuchos::CommandLineProcessor clp(false);

    //GO nx = 100, ny = 100, nz = 100;
    //Galeri::Xpetra::Parameters<GO> matrixParameters(clp, nx, ny, nz, "Laplace2D"); // manage parameters of the test case
    Xpetra::Parameters             xpetraParameters(clp);                          // manage parameters of Xpetra

    std::string xmlFileName = "driver.xml";      clp.setOption("xml",                   &xmlFileName,     "read parameters from a file. Otherwise, this example uses by default 'scalingTest.xml'");
    int    amgAsPrecond     = 1;                 clp.setOption("precond",               &amgAsPrecond,     "apply multigrid as preconditioner");
    int    amgAsSolver      = 0;                 clp.setOption("fixPoint",              &amgAsSolver,      "apply multigrid as solver");
    bool   printTimings     = true;              clp.setOption("timings", "notimings",  &printTimings,     "print timings to screen");
    int    writeMatricesOPT = -2;                clp.setOption("write",                 &writeMatricesOPT, "write matrices to file (-1 means all; i>=0 means level i)");
    double tol              = 1e-6;             clp.setOption("tol",                   &tol,              "solver convergence tolerance");
    std::string krylovMethod = "gmres"; clp.setOption("krylov",                   &krylovMethod,     "outer Krylov method");
    int maxIts = 100; clp.setOption("maxits",           &maxIts,   "maximum number of Krylov iterations");
    int output = 1; clp.setOption("output",           &output,   "how often to print Krylov residual history");
    std::string matrixFileName = "crada1/crada_A.mm"; clp.setOption("matrixfile",            &matrixFileName,   "matrix market file containing matrix");
    std::string rhsFileName = "crada1/crada_b.mm";    clp.setOption("rhsfile",               &rhsFileName,      "matrix market file containing right-hand side");
    std::string nspFileName = "crada1/crada_ns.mm";   clp.setOption("nspfile",               &nspFileName,      "matrix market file containing fine level null space");
    std::string cooFileName = "crada1/crada_coordinates.mm"; clp.setOption("coordinatesfile",&cooFileName,      "matrix market file containing fine level coordinates");
    std::string spcFileName = "crada1/crada_special.mm"; clp.setOption("specialfile",        &spcFileName,      "matrix market file containing fine level special dofs");
    int nPDE = 3; clp.setOption("numpdes",           &nPDE,   "number of PDE equations");
    int nNspVectors = 3; clp.setOption("numnsp", &nNspVectors, "number of nullspace vectors. Only used if null space is read from file. Must be smaller or equal than the number of null space vectors read in from file.");
    std::string convType = "r0"; clp.setOption("convtype",                   &convType,     "convergence type (r0 or none)");

    switch (clp.parse(argc,argv)) {
      case Teuchos::CommandLineProcessor::PARSE_HELP_PRINTED:        return EXIT_SUCCESS; break;
      case Teuchos::CommandLineProcessor::PARSE_ERROR:
      case Teuchos::CommandLineProcessor::PARSE_UNRECOGNIZED_OPTION: return EXIT_FAILURE; break;
      case Teuchos::CommandLineProcessor::PARSE_SUCCESSFUL:                               break;
    }

    // =========================================================================
    // Problem construction
    // =========================================================================
    RCP<TimeMonitor> globalTimeMonitor = rcp(new TimeMonitor(*TimeMonitor::getNewTimer("MatrixRead: S - Global Time"))), tm;

    comm->barrier();
    tm = rcp(new TimeMonitor(*TimeMonitor::getNewTimer("Driver: 1 - Matrix Build")));

    RCP<Matrix> A = Teuchos::null;
    if (matrixFileName != "") {
      fancyout << "Read matrix from file " << matrixFileName << std::endl;
      A = Utils::Read(std::string(matrixFileName), xpetraParameters.GetLib(), comm);
    }
    RCP<const Map>   map = A->getRowMap();
    RCP<MultiVector> nullspace = MultiVectorFactory::Build(A->getDomainMap(),nPDE);
    A->SetFixedBlockSize(nPDE);
    fancyout << "#pdes = " << A->GetFixedBlockSize() << std::endl;

    if (nspFileName != "") {
      fancyout << "Read null space from file " << nspFileName << std::endl;
      nullspace = Utils2::ReadMultiVector(std::string(nspFileName), A->getRowMap());
      fancyout << "Found " << nullspace->getNumVectors() << " null space vectors" << std::endl;
      if (nNspVectors > Teuchos::as<int>(nullspace->getNumVectors())) {
        fancyout << "Set number of null space vectors from " << nNspVectors << " to " << nullspace->getNumVectors() << " as only " << nullspace->getNumVectors() << " are provided by " << nspFileName << std::endl;
        nNspVectors = nullspace->getNumVectors();
      }
      if (nNspVectors < 1) {
        fancyout << "Set number of null space vectors from " << nNspVectors << " to " << nullspace->getNumVectors() << ". Note: we need at least one null space vector!!!" << std::endl;
        nNspVectors = nullspace->getNumVectors();
      }
      if (nNspVectors < Teuchos::as<int>(nullspace->getNumVectors())) {
        RCP<MultiVector> temp = MultiVectorFactory::Build(A->getDomainMap(),nNspVectors);
        for(int j=0; j<nNspVectors; j++) {
          Teuchos::ArrayRCP<SC> tempData = temp->getDataNonConst(j);
          Teuchos::ArrayRCP<const SC> nsData   = nullspace->getData(j);
          for (int i=0; i<nsData.size(); ++i) {
            tempData[i] = nsData[i];
          }
        }
        nullspace = Teuchos::null;
        nullspace = temp;
      }
    } else {
      if (nPDE == 1)
        nullspace->putScalar( Teuchos::ScalarTraits<SC>::one() );
      else {
        for (int i=0; i<nPDE; ++i) {
          Teuchos::ArrayRCP<SC> nsData = nullspace->getDataNonConst(i);
          for (int j=0; j<nsData.size(); ++j) {
            GO gel = A->getDomainMap()->getGlobalElement(j) - A->getDomainMap()->getIndexBase();
            if ((gel-i) % nPDE == 0)
              nsData[j] = Teuchos::ScalarTraits<SC>::one();
          }
        }
      }
    }

    RCP<MultiVector> coordinates = Teuchos::null; //MultiVectorFactory::Build(A->getDomainMap(),1);
    if (cooFileName != "") {
      std::vector<GO> myGIDs (map->getNodeNumElements() / A->GetFixedBlockSize());
      // reconstruct map for coordinates
      for(LO r = 0; r < Teuchos::as<LO>(map->getNodeNumElements() / A->GetFixedBlockSize()); ++r) {
        GO gid = map->getGlobalElement(r * A->GetFixedBlockSize());
        myGIDs[r] = gid;
      }

      GO gCntGIDs  = 0;
      GO glCntGIDs = Teuchos::as<GlobalOrdinal>(myGIDs.size());
      MueLu_sumAll(comm,glCntGIDs,gCntGIDs);

      Teuchos::Array<GlobalOrdinal> eltList(myGIDs);
      RCP<const Map> myCoordMap = MapFactory::Build (xpetraParameters.GetLib(),gCntGIDs,eltList(),0,comm);

      fancyout << "Read fine level coordinates from file " << cooFileName << std::endl;
      coordinates = Utils2::ReadMultiVector(std::string(cooFileName), myCoordMap);
      fancyout << "Found " << nullspace->getNumVectors() << " null space vectors of length " << myCoordMap->getGlobalNumElements() << std::endl;
    }

    RCP<Map> mySpecialMap = Teuchos::null;
    if (spcFileName != "") {
      // read file on each processor and pick out the special dof numbers which belong to the current proc
      std::ifstream infile(spcFileName);
      std::string line;
      std::vector<GlobalOrdinal> mySpecialGids;
      GlobalOrdinal cnt = 0;   // count overall number of gids
      GlobalOrdinal mycnt = 0; // count only local gids
      while ( std::getline(infile, line)) {
        if(0 == line.find("%")) continue;
        if(0 == line.find(" ")) {
          cnt++;
          GlobalOrdinal gid;
          std::istringstream iss(line);
          iss >> gid;
          gid--; // note, that the matlab vector starts counting at 1 and not 0!
          if(map->isNodeGlobalElement(gid)) {
            mySpecialGids.push_back(gid);
            mycnt++;
          }
        }
      }

      Teuchos::Array<GlobalOrdinal> eltList(mySpecialGids);
      mySpecialMap = MapFactory::Build (xpetraParameters.GetLib(),cnt,eltList(),0,comm);

      // empty processors
      std::vector<size_t> lelePerProc(comm->getSize(),0);
      std::vector<size_t> gelePerProc(comm->getSize(),0);
      lelePerProc[comm->getRank()] = mySpecialMap->getNodeNumElements();
      Teuchos::reduceAll(*comm,Teuchos::REDUCE_MAX,comm->getSize(),&lelePerProc[0],&gelePerProc[0]);
      if(comm->getRank() == 0) {
        fancyout << "Distribution of " << cnt << " special dofs over processors:" << std::endl;
        fancyout << "Proc   #DOFs" << std::endl;
        for(int i=0; i<comm->getSize(); i++) {
         fancyout  << i << "      " << gelePerProc[i] << std::endl;
        }
      }
    }


    comm->barrier();
    tm = Teuchos::null;

    // =========================================================================
    // Preconditioner construction
    // =========================================================================
    comm->barrier();
    tm = rcp(new TimeMonitor(*TimeMonitor::getNewTimer("Driver: 1.5 - MueLu read XML")));
    ParameterListInterpreter mueLuFactory(xmlFileName, *comm);

    comm->barrier();
    tm = rcp(new TimeMonitor(*TimeMonitor::getNewTimer("Driver: 2 - MueLu Setup")));

    RCP<Hierarchy> H = mueLuFactory.CreateHierarchy();

    // By default, we use Extreme. However, typically the xml file contains verbosity parameter
    // which is used instead
    H->SetDefaultVerbLevel(MueLu::Extreme);

    H->GetLevel(0)->Set("A",           A);
    H->GetLevel(0)->Set("Nullspace",   nullspace);
    H->GetLevel(0)->Set("Coordinates", coordinates);
    if(mySpecialMap!=Teuchos::null) H->GetLevel(0)->Set("map SpecialMap", mySpecialMap);

    mueLuFactory.SetupHierarchy(*H);

    comm->barrier();
    tm = Teuchos::null;

    // Print out the hierarchy stats. We should not need this line, but for some reason the
    // print out in the hierarchy construction does not work.
    H->print(fancyout);

    // =========================================================================
    // System solution (Ax = b)
    // =========================================================================
    comm->barrier();
    tm = rcp (new TimeMonitor(*TimeMonitor::getNewTimer("Driver: 3 - LHS and RHS initialization")));

    RCP<Vector> X = VectorFactory::Build(map,1);
    RCP<MultiVector> B = VectorFactory::Build(map,1);

    if (rhsFileName != "")
      B = Utils2::ReadMultiVector(std::string(rhsFileName), A->getRowMap());
    else
    {
      // we set seed for reproducibility
      X->setSeed(846930886);
      bool useSameRandomGen = false;
      X->randomize(useSameRandomGen);
      A->apply(*X, *B, Teuchos::NO_TRANS, one, zero);

      Teuchos::Array<Teuchos::ScalarTraits<SC>::magnitudeType> norms(1);
      B->norm2(norms);
      //B->scale(1.0/norms[0]);
    }
    X->putScalar(zero);
    tm = Teuchos::null;

    if (writeMatricesOPT > -2)
      H->Write(writeMatricesOPT, writeMatricesOPT);

    comm->barrier();
    if (amgAsSolver) {
      tm = rcp (new TimeMonitor(*TimeMonitor::getNewTimer("Driver: 4 - Fixed Point Solve")));

      H->IsPreconditioner(false);
      Teuchos::Array<Teuchos::ScalarTraits<SC>::magnitudeType> norms(1);
      norms = Utils::ResidualNorm(*A,*X,*B);
      std::cout << "                iter:    0           residual = " << norms[0] << std::endl;
      for (int i=0; i< maxIts; ++i) {
        H->Iterate(*B, *X);
        norms = Utils::ResidualNorm(*A,*X,*B);
        std::cout << "                iter:    " << i+1 << "           residual = " << norms[0] << std::endl;
      }

    } else if (amgAsPrecond) {
#ifdef HAVE_MUELU_BELOS
      tm = rcp(new TimeMonitor(*TimeMonitor::getNewTimer("Driver: 5 - Belos Solve")));
      // Operator and Multivector type that will be used with Belos
      typedef MultiVector          MV;
      typedef Belos::OperatorT<MV> OP;
      H->IsPreconditioner(true);

      // Define Operator and Preconditioner
      Teuchos::RCP<OP> belosOp   = Teuchos::rcp(new Belos::XpetraOp<SC, LO, GO, NO>(A)); // Turns a Xpetra::Matrix object into a Belos operator
      Teuchos::RCP<OP> belosPrec = Teuchos::rcp(new Belos::MueLuOp<SC, LO, GO, NO>(H));  // Turns a MueLu::Hierarchy object into a Belos operator

      // Construct a Belos LinearProblem object
      RCP< Belos::LinearProblem<SC, MV, OP> > belosProblem = rcp(new Belos::LinearProblem<SC, MV, OP>(belosOp, X, B));
      belosProblem->setRightPrec(belosPrec);

      bool set = belosProblem->setProblem();
      if (set == false) {
        fancyout << "\nERROR:  Belos::LinearProblem failed to set up correctly!" << std::endl;
        return EXIT_FAILURE;
      }

      // Belos parameter list
      Teuchos::ParameterList belosList;
      belosList.set("Maximum Iterations",    maxIts); // Maximum number of iterations allowed
      belosList.set("Convergence Tolerance", tol);    // Relative convergence tolerance requested
      belosList.set("Verbosity",             Belos::Errors + Belos::Warnings + Belos::StatusTestDetails);
      belosList.set("Output Frequency",      output);
      belosList.set("Output Style",          Belos::Brief);
      //belosList.set("Orthogonalization",     "ICGS");
      if (convType == "none") {
        belosList.set("Explicit Residual Scaling",  "None");
        belosList.set("Implicit Residual Scaling",  "None");
      }

      // Create an iterative solver manager
      RCP< Belos::SolverManager<SC, MV, OP> > solver;
      if (krylovMethod == "cg") {
        solver = rcp(new Belos::BlockCGSolMgr<SC, MV, OP>(belosProblem, rcp(&belosList, false)));
      } else if (krylovMethod == "gmres") {
        solver = rcp(new Belos::BlockGmresSolMgr<SC, MV, OP>(belosProblem, rcp(&belosList, false)));
      } else {
        TEUCHOS_TEST_FOR_EXCEPTION(true, MueLu::Exceptions::RuntimeError, "Invalid Krylov method.  Options are \"cg\" or \" gmres\".");
      }

      // Perform solve
      Belos::ReturnType ret = Belos::Unconverged;
      try {
        ret = solver->solve();

        // Get the number of iterations for this solve.
        fancyout << "Number of iterations performed for this solve: " << solver->getNumIters() << std::endl;

      } catch(...) {
        fancyout << std::endl << "ERROR:  Belos threw an error! " << std::endl;
      }

      // Check convergence
      if (ret != Belos::Converged)
        fancyout << std::endl << "ERROR:  Belos did not converge! " << std::endl;
      else
        fancyout << std::endl << "SUCCESS:  Belos converged!" << std::endl;
#endif //ifdef HAVE_MUELU_BELOS
    }
    comm->barrier();
    tm = Teuchos::null;
    globalTimeMonitor = Teuchos::null;

    if (printTimings) {
      TimeMonitor::summarize(A->getRowMap()->getComm().ptr(), std::cout, false, true, false, Teuchos::Union, "", true);
      MueLu::MutuallyExclusiveTime<MueLu::BaseClass>::PrintParentChildPairs();
    }

    success = true;
  }
  TEUCHOS_STANDARD_CATCH_STATEMENTS(verbose, std::cerr, success);

  return ( success ? EXIT_SUCCESS : EXIT_FAILURE );
} //main
