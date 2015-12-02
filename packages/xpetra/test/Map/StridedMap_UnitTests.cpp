// @HEADER
//
// ***********************************************************************
//
//             Xpetra: A linear algebra interface package
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
//
// ***********************************************************************
//
// @HEADER
#include <Teuchos_UnitTestHarness.hpp>
#include <Teuchos_Array.hpp>
#include <Teuchos_Tuple.hpp>
#include <Teuchos_CommHelpers.hpp>

#include "Teuchos_as.hpp"

#include "Xpetra_ConfigDefs.hpp"
#include "Xpetra_DefaultPlatform.hpp"
#include "Xpetra_StridedMap.hpp"

#ifdef HAVE_XPETRA_TPETRA
#include "Tpetra_ConfigDefs.hpp" //TODO
#include "Tpetra_DefaultPlatform.hpp" //TODO
#endif

namespace {
  using Teuchos::Array;
  using Teuchos::as;
  using Teuchos::RCP;
  using Teuchos::arcp;
  using Teuchos::rcp;
  using Teuchos::outArg;
  using Teuchos::Tuple;
  using Teuchos::tuple;
  using Xpetra::global_size_t;
  using Xpetra::DefaultPlatform;
  using std::sort;
  using std::find;
  using Teuchos::broadcast;
  using Teuchos::OrdinalTraits;
  using Teuchos::Comm;

  bool testMpi = true;
  double errorTolSlack = 1e+1;
  std::string clplib = "Epetra";

  TEUCHOS_STATIC_SETUP()
  {
    Teuchos::CommandLineProcessor &clp = Teuchos::UnitTestRepository::getCLP();
    clp.addOutputSetupOptions(true);
    clp.setOption(
        "test-mpi", "test-serial", &testMpi,
        "Test MPI (if available) or force test of serial.  In a serial build,"
        " this option is ignored and a serial comm is always used." );
    clp.setOption(
        "error-tol-slack", &errorTolSlack,
        "Slack off of machine epsilon used to check test results" );
    clp.setOption("linAlgebra", &clplib,
        "Epetra/Tpetra");
  }

  RCP<const Comm<int> > getDefaultComm()
  {
    if (testMpi) {
      return DefaultPlatform::getDefaultPlatform().getComm();
    }
    return rcp(new Teuchos::SerialComm<int>());
  }

  //
  // UNIT TESTS
  //

  ////
  TEUCHOS_UNIT_TEST_TEMPLATE_2_DECL( StridedMap, Constructor1, LO, GO )
  {
    typedef Xpetra::StridedMap<LO,GO> M;

    // test constructor for Xpetra::StridedMaps
    // indexBase = 0

    Xpetra::UnderlyingLib lib = Xpetra::UseEpetra;
    if (clplib == "Tpetra")
      lib = Xpetra::UseTpetra;

    // create a comm
    RCP<const Comm<int> > comm = getDefaultComm();
    const int numImages = comm->getSize();
    // constructor calls: (num global elements, index base)
    global_size_t numGlobalElements = 10 * numImages;
    std::vector<size_t> stridedInfo(1,1);
    M map(lib, numGlobalElements, 0,stridedInfo, comm);
    TEST_EQUALITY_CONST( map.getFixedBlockSize(), 1 );
    TEST_EQUALITY_CONST( map.isStrided(), false );
    TEST_EQUALITY_CONST( map.isBlocked(), false );

    stridedInfo.clear();
    stridedInfo.push_back(2);
    stridedInfo.push_back(1);
    M map2(lib, 99, 0,stridedInfo, comm);
    TEST_EQUALITY_CONST( map2.getFixedBlockSize(), 3 );
    TEST_EQUALITY_CONST( map2.isStrided(), true );
    TEST_EQUALITY_CONST( map2.isBlocked(), true );

    stridedInfo.clear();
    stridedInfo.push_back(2);
    M map3(lib, 100, 0,stridedInfo, comm);
    TEST_EQUALITY_CONST( map3.getFixedBlockSize(), 2 );
    TEST_EQUALITY_CONST( map3.isStrided(), false );
    TEST_EQUALITY_CONST( map3.isBlocked(), true );
  }

  ////
  TEUCHOS_UNIT_TEST_TEMPLATE_2_DECL( StridedMap, Constructor2, LO, GO )
  {
    typedef Xpetra::StridedMap<LO,GO> M;

    // test constructor for Xpetra::StridedMaps
    // indexBase = 0

    Xpetra::UnderlyingLib lib = Xpetra::UseEpetra;
    if (clplib == "Tpetra")
      lib = Xpetra::UseTpetra;

    // create a comm
    RCP<const Comm<int> > comm = getDefaultComm();
    const int numImages = comm->getSize();
    // constructor calls: (num global elements, index base)
    global_size_t numGlobalElements = 10 * numImages;
    size_t numLocalElements = 10;
    std::vector<size_t> stridedInfo(1,1);

    M map(lib, numGlobalElements, numLocalElements, 0, stridedInfo, comm);
    TEST_EQUALITY_CONST( map.getFixedBlockSize(), 1 );
    TEST_EQUALITY_CONST( map.isStrided(), false );
    TEST_EQUALITY_CONST( map.isBlocked(), false );

    numGlobalElements = 33 * numImages;
    numLocalElements = 33;
    stridedInfo.clear();
    stridedInfo.push_back(2);
    stridedInfo.push_back(1);

    M map2(lib, numGlobalElements, numLocalElements, 0, stridedInfo, comm);
    TEST_EQUALITY_CONST( map2.getFixedBlockSize(), 3 );
    TEST_EQUALITY_CONST( map2.isStrided(), true );
    TEST_EQUALITY_CONST( map2.isBlocked(), true );

    numGlobalElements = 20 * numImages;
    numLocalElements = 20;
    stridedInfo.clear();
    stridedInfo.push_back(2);
    M map3(lib, numGlobalElements, numLocalElements, 0, stridedInfo, comm);
    TEST_EQUALITY_CONST( map3.getFixedBlockSize(), 2 );
    TEST_EQUALITY_CONST( map3.isStrided(), false );
    TEST_EQUALITY_CONST( map3.isBlocked(), true );
  }

  ////
  TEUCHOS_UNIT_TEST_TEMPLATE_2_DECL( StridedMap, Constructor3, LO, GO )
  {
    typedef Xpetra::StridedMap<LO,GO> M;

    // test constructor for Xpetra::StridedMaps
    // indexBase = 1111

    Xpetra::UnderlyingLib lib = Xpetra::UseEpetra;
    if (clplib == "Tpetra")
      lib = Xpetra::UseTpetra;

    // create a comm
    RCP<const Comm<int> > comm = getDefaultComm();
    const int numImages = comm->getSize();
    // constructor calls: (num global elements, index base)
    GO indexBase = 1111;
    global_size_t numGlobalElements = 10 * numImages;
    size_t numLocalElements = 10;
    std::vector<size_t> stridedInfo(1,1);

    M map(lib, numGlobalElements, numLocalElements, indexBase, stridedInfo, comm);
    TEST_EQUALITY_CONST( map.getFixedBlockSize(), 1 );
    TEST_EQUALITY_CONST( map.isStrided(), false );
    TEST_EQUALITY_CONST( map.isBlocked(), false );
    TEST_EQUALITY_CONST( map.getIndexBase(), indexBase );
    TEST_EQUALITY_CONST( map.getMinAllGlobalIndex(), indexBase);
    TEST_EQUALITY_CONST( map.getMaxAllGlobalIndex(), indexBase + Teuchos::as<GO>(numGlobalElements) - 1);

    numGlobalElements = 33 * numImages;
    numLocalElements = 33;
    stridedInfo.clear();
    stridedInfo.push_back(2);
    stridedInfo.push_back(1);

    M map2(lib, numGlobalElements, numLocalElements, indexBase, stridedInfo, comm);
    TEST_EQUALITY_CONST( map2.getFixedBlockSize(), 3 );
    TEST_EQUALITY_CONST( map2.isStrided(), true );
    TEST_EQUALITY_CONST( map2.isBlocked(), true );
    TEST_EQUALITY_CONST( map2.getIndexBase(), indexBase );
    TEST_EQUALITY_CONST( map2.getMinAllGlobalIndex(), indexBase);
    TEST_EQUALITY_CONST( map2.getMaxAllGlobalIndex(), indexBase + Teuchos::as<GO>(numGlobalElements) - 1);

    numGlobalElements = 20 * numImages;
    numLocalElements = 20;
    stridedInfo.clear();
    stridedInfo.push_back(2);
    M map3(lib, numGlobalElements, numLocalElements, indexBase, stridedInfo, comm);
    TEST_EQUALITY_CONST( map3.getFixedBlockSize(), 2 );
    TEST_EQUALITY_CONST( map3.isStrided(), false );
    TEST_EQUALITY_CONST( map3.isBlocked(), true );
    TEST_EQUALITY_CONST( map3.getIndexBase(), indexBase );
    TEST_EQUALITY_CONST( map3.getMinAllGlobalIndex(), indexBase);
    TEST_EQUALITY_CONST( map3.getMaxAllGlobalIndex(), indexBase + Teuchos::as<GO>(numGlobalElements) - 1);
  }

  ////
  TEUCHOS_UNIT_TEST_TEMPLATE_2_DECL( StridedMap, StridedPartConstructor1, LO, GO )
  {
    typedef Xpetra::StridedMap<LO,GO> M;

    Xpetra::UnderlyingLib lib = Xpetra::UseEpetra;
    if (clplib == "Tpetra")
      lib = Xpetra::UseTpetra;

    // create a comm
    RCP<const Comm<int> > comm = getDefaultComm();
    const int numImages = comm->getSize();

    // constructor calls: (num global elements, index base)
    global_size_t numGlobalElements = 30 * numImages;
    size_t numLocalElements = 30;
    std::vector<size_t> stridedInfo;
    stridedInfo.push_back(2);
    stridedInfo.push_back(1);

    M map(lib, numGlobalElements, numLocalElements, 0,stridedInfo, comm, 0);
    TEST_EQUALITY_CONST( map.getFixedBlockSize(), 3 );
    TEST_EQUALITY_CONST( map.isStrided(), true );
    TEST_EQUALITY_CONST( map.isBlocked(), true );
    TEST_EQUALITY_CONST( map.getMinAllGlobalIndex(), 0 );
    TEST_EQUALITY_CONST( map.getMaxAllGlobalIndex(), Teuchos::as<GO>(numGlobalElements) - 2 );
    TEST_EQUALITY_CONST( map.isContiguous(), false);
    TEST_EQUALITY_CONST( map.getNodeNumElements() % 2 , 0);
    TEST_EQUALITY_CONST( map.getNodeNumElements(), numLocalElements / map.getFixedBlockSize() * stridedInfo[0] );

    M map2(lib, numGlobalElements, numLocalElements, 0,stridedInfo, comm, 1);
    TEST_EQUALITY_CONST( map2.getFixedBlockSize(), 3 );
    TEST_EQUALITY_CONST( map2.isStrided(), true );
    TEST_EQUALITY_CONST( map2.isBlocked(), true );
    TEST_EQUALITY_CONST( map2.getMinAllGlobalIndex(), 2 );
    TEST_EQUALITY_CONST( map2.getMaxAllGlobalIndex(), Teuchos::as<GO>(numGlobalElements) - 1 );
    TEST_EQUALITY_CONST( map2.isContiguous(), false);
    TEST_EQUALITY_CONST( map2.getNodeNumElements(), numLocalElements / map.getFixedBlockSize() * stridedInfo[1]);
  }

  ////
  TEUCHOS_UNIT_TEST_TEMPLATE_2_DECL( StridedMap, StridedPartConstructor2, LO, GO )
  {
    typedef Xpetra::StridedMap<LO,GO> M;

    Xpetra::UnderlyingLib lib = Xpetra::UseEpetra;
    if (clplib == "Tpetra")
      lib = Xpetra::UseTpetra;

    // create a comm
    RCP<const Comm<int> > comm = getDefaultComm();
    const int numImages = comm->getSize();

    // constructor calls: (num global elements, index base)
    global_size_t numGlobalElements = 120 * numImages;
    size_t numLocalElements = 120;
    std::vector<size_t> stridedInfo;
    stridedInfo.push_back(3);
    stridedInfo.push_back(4);
    stridedInfo.push_back(5);

    M map(lib, numGlobalElements, 0,stridedInfo, comm, 0);
    TEST_EQUALITY_CONST( map.getFixedBlockSize(), 12 );
    TEST_EQUALITY_CONST( map.isStrided(), true );
    TEST_EQUALITY_CONST( map.isBlocked(), true );
    TEST_EQUALITY_CONST( map.getMinAllGlobalIndex(), 0 );
    TEST_EQUALITY_CONST( map.getMaxAllGlobalIndex(), Teuchos::as<GO>(numGlobalElements) - 10 );
    TEST_EQUALITY_CONST( map.isContiguous(), false);
    TEST_EQUALITY_CONST( map.getNodeNumElements() % 3 , 0);
    TEST_EQUALITY_CONST( map.getNodeNumElements(), numLocalElements / map.getFixedBlockSize() * stridedInfo[0] );

    M map2(lib, numGlobalElements, 0,stridedInfo, comm, 1);
    TEST_EQUALITY_CONST( map2.getFixedBlockSize(), 12 );
    TEST_EQUALITY_CONST( map2.isStrided(), true );
    TEST_EQUALITY_CONST( map2.isBlocked(), true );
    TEST_EQUALITY_CONST( map2.getMinAllGlobalIndex(), 3 );
    TEST_EQUALITY_CONST( map2.getMaxAllGlobalIndex(), Teuchos::as<GO>(numGlobalElements) - 6 );
    TEST_EQUALITY_CONST( map2.isContiguous(), false);
    TEST_EQUALITY_CONST( map2.getNodeNumElements() % 4 , 0);
    TEST_EQUALITY_CONST( map2.getNodeNumElements(), numLocalElements / map.getFixedBlockSize() * stridedInfo[1]);

    M map3(lib, numGlobalElements, 0,stridedInfo, comm, 2);
    TEST_EQUALITY_CONST( map3.getFixedBlockSize(), 12 );
    TEST_EQUALITY_CONST( map3.isStrided(), true );
    TEST_EQUALITY_CONST( map3.isBlocked(), true );
    TEST_EQUALITY_CONST( map3.getMinAllGlobalIndex(), 7 );
    TEST_EQUALITY_CONST( map3.getMaxAllGlobalIndex(), Teuchos::as<GO>(numGlobalElements) - 1 );
    TEST_EQUALITY_CONST( map3.isContiguous(), false);
    TEST_EQUALITY_CONST( map3.getNodeNumElements() % 5 , 0);
    TEST_EQUALITY_CONST( map3.getNodeNumElements(), numLocalElements / map.getFixedBlockSize() * stridedInfo[2]);
  }

  TEUCHOS_UNIT_TEST_TEMPLATE_2_DECL( StridedMap, StridedPartConstructor3, LO, GO )
  {
    typedef Xpetra::StridedMap<LO,GO> M;

    Xpetra::UnderlyingLib lib = Xpetra::UseEpetra;
    if (clplib == "Tpetra")
      lib = Xpetra::UseTpetra;

    // indexBase = 1111

    // create a comm
    RCP<const Comm<int> > comm = getDefaultComm();
    const int numImages = comm->getSize();
    GO indexBase = 1111;

    // constructor calls: (num global elements, index base)
    global_size_t numGlobalElements = 120 * numImages;
    size_t numLocalElements = 120;
    std::vector<size_t> stridedInfo;
    stridedInfo.push_back(3);
    stridedInfo.push_back(4);
    stridedInfo.push_back(5);

    M map(lib, numGlobalElements, indexBase ,stridedInfo, comm, 0);
    TEST_EQUALITY_CONST( map.getFixedBlockSize(), 12 );
    TEST_EQUALITY_CONST( map.isStrided(), true );
    TEST_EQUALITY_CONST( map.isBlocked(), true );
    TEST_EQUALITY_CONST( map.getMinAllGlobalIndex(), indexBase );
    TEST_EQUALITY_CONST( map.getMaxAllGlobalIndex(), Teuchos::as<GO>(numGlobalElements) + indexBase - 10 );
    TEST_EQUALITY_CONST( map.isContiguous(), false);
    TEST_EQUALITY_CONST( map.getNodeNumElements() % 3 , 0);
    TEST_EQUALITY_CONST( map.getNodeNumElements(), numLocalElements / map.getFixedBlockSize() * stridedInfo[0] );

    M map2(lib, numGlobalElements, indexBase ,stridedInfo, comm, 1);
    TEST_EQUALITY_CONST( map2.getFixedBlockSize(), 12 );
    TEST_EQUALITY_CONST( map2.isStrided(), true );
    TEST_EQUALITY_CONST( map2.isBlocked(), true );
    TEST_EQUALITY_CONST( map2.getMinAllGlobalIndex(), 3 + indexBase );
    TEST_EQUALITY_CONST( map2.getMaxAllGlobalIndex(), Teuchos::as<GO>(numGlobalElements) + indexBase - 6 );
    TEST_EQUALITY_CONST( map2.isContiguous(), false);
    TEST_EQUALITY_CONST( map2.getNodeNumElements() % 4 , 0);
    TEST_EQUALITY_CONST( map2.getNodeNumElements(), numLocalElements / map.getFixedBlockSize() * stridedInfo[1]);

    M map3(lib, numGlobalElements, indexBase ,stridedInfo, comm, 2);
    TEST_EQUALITY_CONST( map3.getFixedBlockSize(), 12 );
    TEST_EQUALITY_CONST( map3.isStrided(), true );
    TEST_EQUALITY_CONST( map3.isBlocked(), true );
    TEST_EQUALITY_CONST( map3.getMinAllGlobalIndex(), 7 + indexBase);
    TEST_EQUALITY_CONST( map3.getMaxAllGlobalIndex(), Teuchos::as<GO>(numGlobalElements) + indexBase - 1 );
    TEST_EQUALITY_CONST( map3.isContiguous(), false);
    TEST_EQUALITY_CONST( map3.getNodeNumElements() % 5 , 0);
    TEST_EQUALITY_CONST( map3.getNodeNumElements(), numLocalElements / map.getFixedBlockSize() * stridedInfo[2]);
  }

  ////
  TEUCHOS_UNIT_TEST_TEMPLATE_2_DECL( StridedMap, StridedPartConstructorWithOffset, LO, GO )
  {
    typedef Xpetra::StridedMap<LO,GO> M;

    Xpetra::UnderlyingLib lib = Xpetra::UseEpetra;
    if (clplib == "Tpetra")
      lib = Xpetra::UseTpetra;

    // create a comm
    RCP<const Comm<int> > comm = getDefaultComm();
    const int numImages = comm->getSize();

    GO offset = 111;

    // constructor calls: (num global elements, index base)
    global_size_t numGlobalElements = 120 * numImages;
    size_t numLocalElements = 120;
    std::vector<size_t> stridedInfo;
    stridedInfo.push_back(3);
    stridedInfo.push_back(4);
    stridedInfo.push_back(5);

    M map(lib, numGlobalElements, 0,stridedInfo, comm, 0, offset);
    TEST_EQUALITY_CONST( map.getFixedBlockSize(), 12 );
    TEST_EQUALITY_CONST( map.isStrided(), true );
    TEST_EQUALITY_CONST( map.isBlocked(), true );
    TEST_EQUALITY_CONST( map.getMinAllGlobalIndex(), offset );
    TEST_EQUALITY_CONST( map.getMaxAllGlobalIndex(), offset + Teuchos::as<GO>(numGlobalElements) - 10 );
    TEST_EQUALITY_CONST( map.isContiguous(), false);
    TEST_EQUALITY_CONST( map.getNodeNumElements() % 3 , 0);
    TEST_EQUALITY_CONST( map.getNodeNumElements(), numLocalElements / map.getFixedBlockSize() * stridedInfo[0] );

    M map2(lib, numGlobalElements, 0,stridedInfo, comm, 1, offset);
    TEST_EQUALITY_CONST( map2.getFixedBlockSize(), 12 );
    TEST_EQUALITY_CONST( map2.isStrided(), true );
    TEST_EQUALITY_CONST( map2.isBlocked(), true );
    TEST_EQUALITY_CONST( map2.getMinAllGlobalIndex(), offset + 3 );
    TEST_EQUALITY_CONST( map2.getMaxAllGlobalIndex(), offset + Teuchos::as<GO>(numGlobalElements) - 6 );
    TEST_EQUALITY_CONST( map2.isContiguous(), false);
    TEST_EQUALITY_CONST( map2.getNodeNumElements() % 4 , 0);
    TEST_EQUALITY_CONST( map2.getNodeNumElements(), numLocalElements / map.getFixedBlockSize() * stridedInfo[1]);

    M map3(lib, numGlobalElements, 0,stridedInfo, comm, 2, offset);
    TEST_EQUALITY_CONST( map3.getFixedBlockSize(), 12 );
    TEST_EQUALITY_CONST( map3.isStrided(), true );
    TEST_EQUALITY_CONST( map3.isBlocked(), true );
    TEST_EQUALITY_CONST( map3.getMinAllGlobalIndex(), offset + 7 );
    TEST_EQUALITY_CONST( map3.getMaxAllGlobalIndex(), offset + Teuchos::as<GO>(numGlobalElements) - 1 );
    TEST_EQUALITY_CONST( map3.isContiguous(), false);
    TEST_EQUALITY_CONST( map3.getNodeNumElements() % 5 , 0);
    TEST_EQUALITY_CONST( map3.getNodeNumElements(), numLocalElements / map.getFixedBlockSize() * stridedInfo[2]);
  }

  ////
  TEUCHOS_UNIT_TEST_TEMPLATE_2_DECL( StridedMap, StridedPartConstructorOffsetPlusIndexBase, LO, GO )
  {
    typedef Xpetra::StridedMap<LO,GO> M;

    Xpetra::UnderlyingLib lib = Xpetra::UseEpetra;
    if (clplib == "Tpetra")
      lib = Xpetra::UseTpetra;

    // create a comm
    RCP<const Comm<int> > comm = getDefaultComm();
    const int numImages = comm->getSize();

    GO offset = 111;
    GO indexBase = 89;

    // constructor calls: (num global elements, index base)
    global_size_t numGlobalElements = 120 * numImages;
    size_t numLocalElements = 120;
    std::vector<size_t> stridedInfo;
    stridedInfo.push_back(3);
    stridedInfo.push_back(4);
    stridedInfo.push_back(5);

    M map(lib, numGlobalElements, indexBase, stridedInfo, comm, 0, offset);
    TEST_EQUALITY_CONST( map.getFixedBlockSize(), 12 );
    TEST_EQUALITY_CONST( map.isStrided(), true );
    TEST_EQUALITY_CONST( map.isBlocked(), true );
    TEST_EQUALITY_CONST( map.getMinAllGlobalIndex(), indexBase + offset );
    TEST_EQUALITY_CONST( map.getMaxAllGlobalIndex(), indexBase + offset + Teuchos::as<GO>(numGlobalElements) - 10 );
    TEST_EQUALITY_CONST( map.isContiguous(), false);
    TEST_EQUALITY_CONST( map.getNodeNumElements() % 3 , 0);
    TEST_EQUALITY_CONST( map.getNodeNumElements(), numLocalElements / map.getFixedBlockSize() * stridedInfo[0] );

    M map2(lib, numGlobalElements, indexBase ,stridedInfo, comm, 1, offset);
    TEST_EQUALITY_CONST( map2.getFixedBlockSize(), 12 );
    TEST_EQUALITY_CONST( map2.isStrided(), true );
    TEST_EQUALITY_CONST( map2.isBlocked(), true );
    TEST_EQUALITY_CONST( map2.getMinAllGlobalIndex(), indexBase + offset + 3 );
    TEST_EQUALITY_CONST( map2.getMaxAllGlobalIndex(), indexBase + offset + Teuchos::as<GO>(numGlobalElements) - 6 );
    TEST_EQUALITY_CONST( map2.isContiguous(), false);
    TEST_EQUALITY_CONST( map2.getNodeNumElements() % 4 , 0);
    TEST_EQUALITY_CONST( map2.getNodeNumElements(), numLocalElements / map.getFixedBlockSize() * stridedInfo[1]);

    M map3(lib, numGlobalElements, indexBase ,stridedInfo, comm, 2, offset);
    TEST_EQUALITY_CONST( map3.getFixedBlockSize(), 12 );
    TEST_EQUALITY_CONST( map3.isStrided(), true );
    TEST_EQUALITY_CONST( map3.isBlocked(), true );
    TEST_EQUALITY_CONST( map3.getMinAllGlobalIndex(), indexBase + offset + 7 );
    TEST_EQUALITY_CONST( map3.getMaxAllGlobalIndex(), indexBase + offset + Teuchos::as<GO>(numGlobalElements) - 1 );
    TEST_EQUALITY_CONST( map3.isContiguous(), false);
    TEST_EQUALITY_CONST( map3.getNodeNumElements() % 5 , 0);
    TEST_EQUALITY_CONST( map3.getNodeNumElements(), numLocalElements / map.getFixedBlockSize() * stridedInfo[2]);
  }


  //
  // INSTANTIATIONS
  //

  // Uncomment this for really fast development cycles but make sure to comment
  // it back again before checking in so that we can test all the types.
  // #define FAST_DEVELOPMENT_UNIT_TEST_BUILD


# ifdef FAST_DEVELOPMENT_UNIT_TEST_BUILD

#   define UNIT_TEST_GROUP_ORDINAL( LO, GO )                        \
      TEUCHOS_UNIT_TEST_TEMPLATE_3_INSTANT( StridedMap, Constructor1, LO, GO ) \
      TEUCHOS_UNIT_TEST_TEMPLATE_3_INSTANT( StridedMap, Constructor2, LO, GO ) \
      TEUCHOS_UNIT_TEST_TEMPLATE_3_INSTANT( StridedMap, Constructor3, LO, GO ) \
      TEUCHOS_UNIT_TEST_TEMPLATE_3_INSTANT( StridedMap, StridedPartConstructor1, LO, GO ) \
      TEUCHOS_UNIT_TEST_TEMPLATE_3_INSTANT( StridedMap, StridedPartConstructor2, LO, GO ) \
      TEUCHOS_UNIT_TEST_TEMPLATE_3_INSTANT( StridedMap, StridedPartConstructor3, LO, GO ) \
      TEUCHOS_UNIT_TEST_TEMPLATE_3_INSTANT( StridedMap, StridedPartConstructorWithOffset, LO, GO ) \
      TEUCHOS_UNIT_TEST_TEMPLATE_3_INSTANT( StridedMap, StridedPartConstructorOffsetPlusIndexBase, LO, GO )

    UNIT_TEST_GROUP_ORDINAL(int , int)

# else // not FAST_DEVELOPMENT_UNIT_TEST_BUILD

#   define UNIT_TEST_GROUP_ORDINAL( LO, GO )                        \
      TEUCHOS_UNIT_TEST_TEMPLATE_2_INSTANT( StridedMap, Constructor1, LO, GO ) \
      TEUCHOS_UNIT_TEST_TEMPLATE_2_INSTANT( StridedMap, Constructor2, LO, GO ) \
      TEUCHOS_UNIT_TEST_TEMPLATE_2_INSTANT( StridedMap, Constructor3, LO, GO ) \
      TEUCHOS_UNIT_TEST_TEMPLATE_2_INSTANT( StridedMap, StridedPartConstructor1, LO, GO ) \
      TEUCHOS_UNIT_TEST_TEMPLATE_2_INSTANT( StridedMap, StridedPartConstructor2, LO, GO ) \
      TEUCHOS_UNIT_TEST_TEMPLATE_2_INSTANT( StridedMap, StridedPartConstructor3, LO, GO ) \
      TEUCHOS_UNIT_TEST_TEMPLATE_2_INSTANT( StridedMap, StridedPartConstructorWithOffset, LO, GO ) \
      TEUCHOS_UNIT_TEST_TEMPLATE_2_INSTANT( StridedMap, StridedPartConstructorOffsetPlusIndexBase, LO, GO )

    // UNIT_TEST_GROUP_ORDINAL(char , int)

#ifndef XPETRA_TEST_USE_LONGLONG_GO
      UNIT_TEST_GROUP_ORDINAL(int , int)
#else
      typedef long long LongLongInt;
      UNIT_TEST_GROUP_ORDINAL(int , LongLongInt)
#endif
    // typedef short int ShortInt;
    // UNIT_TEST_GROUP_ORDINAL(ShortInt, int)

    // typedef long int LongInt;
    // UNIT_TEST_GROUP_ORDINAL(int , LongInt)

#   ifdef HAVE_XPETRA_INT_LONG_LONG
      // typedef long long int LongLongInt;
      // UNIT_TEST_GROUP_ORDINAL(char , LongLongInt)
      // UNIT_TEST_GROUP_ORDINAL(int , LongLongInt)
#   endif

# endif // FAST_DEVELOPMENT_UNIT_TEST_BUILD

}
