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
//
// ***********************************************************************
//
// @HEADER
#ifndef MUELU_HIERARCHYHELPERS_DEF_HPP
#define MUELU_HIERARCHYHELPERS_DEF_HPP

#include <Xpetra_Matrix.hpp>
#include <Xpetra_Operator.hpp>

#include "MueLu_HierarchyHelpers_decl.hpp"
#include "MueLu_HierarchyManager.hpp"
#include "MueLu_SmootherBase.hpp"
#include "MueLu_SmootherFactory.hpp"
#include "MueLu_FactoryManager.hpp"

//TODO/FIXME: DeclareInput(, **this**) cannot be used here

namespace MueLu {

  template <class Scalar, class LocalOrdinal, class GlobalOrdinal, class Node>
  TopRAPFactory<Scalar, LocalOrdinal, GlobalOrdinal, Node>::TopRAPFactory(RCP<const FactoryManagerBase> parentFactoryManager) :
    PFact_ (parentFactoryManager->GetFactory("P")),
    RFact_ (parentFactoryManager->GetFactory("R")),
    AcFact_(parentFactoryManager->GetFactory("A"))
  { }

  template <class Scalar, class LocalOrdinal, class GlobalOrdinal, class Node>
  TopRAPFactory<Scalar, LocalOrdinal, GlobalOrdinal, Node>::TopRAPFactory(RCP<const FactoryManagerBase> parentFactoryManagerFine, RCP<const FactoryManagerBase> parentFactoryManagerCoarse) :
    PFact_ (parentFactoryManagerCoarse->GetFactory("P")),
    RFact_ (parentFactoryManagerCoarse->GetFactory("R")),
    AcFact_(parentFactoryManagerCoarse->GetFactory("A"))
  { }

  template <class Scalar, class LocalOrdinal, class GlobalOrdinal, class Node>
  TopRAPFactory<Scalar, LocalOrdinal, GlobalOrdinal, Node>::~TopRAPFactory() { }

  template <class Scalar, class LocalOrdinal, class GlobalOrdinal, class Node>
  void TopRAPFactory<Scalar, LocalOrdinal, GlobalOrdinal, Node>::DeclareInput(Level & fineLevel, Level & coarseLevel) const {
    if (PFact_  != Teuchos::null)                                       coarseLevel.DeclareInput("P", PFact_.get());
    if (RFact_  != Teuchos::null)                                       coarseLevel.DeclareInput("R", RFact_.get());
    if ((AcFact_ != Teuchos::null) && (AcFact_ != NoFactory::getRCP())) coarseLevel.DeclareInput("A", AcFact_.get());
  }

  template <class Scalar, class LocalOrdinal, class GlobalOrdinal, class Node>
  void TopRAPFactory<Scalar, LocalOrdinal, GlobalOrdinal, Node>::Build(Level & fineLevel, Level & coarseLevel) const {
    if ((PFact_ != Teuchos::null) && (PFact_ != NoFactory::getRCP())) {
      RCP<Operator> oP = coarseLevel.Get<RCP<Operator> >("P", PFact_.get());
      RCP<Matrix>    P = rcp_dynamic_cast<Matrix>(oP);
      if (!P.is_null()) coarseLevel.Set("P",  P, NoFactory::get());
      else              coarseLevel.Set("P", oP, NoFactory::get());
      coarseLevel.AddKeepFlag   ("P", NoFactory::get(), MueLu::Final);    // FIXME2: Order of Remove/Add matter (data removed otherwise). Should do something about this
      coarseLevel.RemoveKeepFlag("P", NoFactory::get(), MueLu::UserData); // FIXME: This is a hack, I should change behavior of Level::Set() instead. FIXME3: Should not be removed if flag was there already

    }

    if ((RFact_ != Teuchos::null) && (RFact_ != NoFactory::getRCP()) ) {
      RCP<Operator> oR = coarseLevel.Get<RCP<Operator> >("R", RFact_.get());
      RCP<Matrix>    R = rcp_dynamic_cast<Matrix>(oR);
      if (!R.is_null()) coarseLevel.Set("R",  R, NoFactory::get());
      else              coarseLevel.Set("R", oR, NoFactory::get());
      coarseLevel.AddKeepFlag   ("R", NoFactory::get(), MueLu::Final);
      coarseLevel.RemoveKeepFlag("R", NoFactory::get(), MueLu::UserData); // FIXME: This is a hack
    }

    if ((AcFact_ != Teuchos::null) && (AcFact_ != NoFactory::getRCP())) {
      RCP<Operator> oA = coarseLevel.Get<RCP<Operator> >("A", AcFact_.get());
      RCP<Matrix>    A = rcp_dynamic_cast<Matrix>(oA);
      if (!A.is_null()) coarseLevel.Set("A",  A, NoFactory::get());
      else              coarseLevel.Set("A", oA, NoFactory::get());
      coarseLevel.AddKeepFlag   ("A", NoFactory::get(), MueLu::Final);
      coarseLevel.RemoveKeepFlag("A", NoFactory::get(), MueLu::UserData); // FIXME: This is a hack
    }
  }

  //
  //
  //

  template <class Scalar, class LocalOrdinal, class GlobalOrdinal, class Node>
  TopSmootherFactory<Scalar, LocalOrdinal, GlobalOrdinal, Node>::TopSmootherFactory(RCP<const FactoryManagerBase> parentFactoryManager, const std::string& varName) {
    TEUCHOS_TEST_FOR_EXCEPTION(varName != "CoarseSolver" && varName != "Smoother", Exceptions::RuntimeError, "varName should be either \"CoarseSolver\" or \"Smoother\"");

    if (varName == "CoarseSolver") {
      // For coarsest level, we only need one smoother/solver
      // If a user wants to do something weird there (like, solve coarsest system by using 2 forward
      // GS and 1 backward GS), one can use MergedSmoother
      RCP<const FactoryBase> coarseSolverFactory = parentFactoryManager->GetFactory("CoarseSolver");
      RCP<const SmootherFactory> coarseSmootherFactory = Teuchos::rcp_dynamic_cast<const SmootherFactory>(coarseSolverFactory);
      if (coarseSmootherFactory != Teuchos::null) {
        RCP<SmootherPrototype> preProto;
        RCP<SmootherPrototype> postProto;
        coarseSmootherFactory->GetSmootherPrototypes(preProto, postProto);

        if (preProto == postProto)
          preSmootherFact_  = parentFactoryManager->GetFactory("CoarseSolver");
        else {
          // check whether pre- and/or post-smoothing is desired on coarsest level
          if(preProto != Teuchos::null)
            preSmootherFact_  = parentFactoryManager->GetFactory("CoarseSolver");
          if(postProto != Teuchos::null)
            postSmootherFact_  = parentFactoryManager->GetFactory("CoarseSolver");
        }
      }
      else  // default handling: get default direct solver as presmoother on coarsest level
        preSmootherFact_  = parentFactoryManager->GetFactory("CoarseSolver");

    } else {
      preSmootherFact_  = parentFactoryManager->GetFactory("PreSmoother");
      postSmootherFact_ = parentFactoryManager->GetFactory("PostSmoother");
    }
  }

  template <class Scalar, class LocalOrdinal, class GlobalOrdinal, class Node>
  TopSmootherFactory<Scalar, LocalOrdinal, GlobalOrdinal, Node>::~TopSmootherFactory() { }

  template <class Scalar, class LocalOrdinal, class GlobalOrdinal, class Node>
  void TopSmootherFactory<Scalar, LocalOrdinal, GlobalOrdinal, Node>::DeclareInput(Level & level) const {
    if (preSmootherFact_  != Teuchos::null)
      level.DeclareInput("PreSmoother",  preSmootherFact_.get());
    if (postSmootherFact_ != Teuchos::null)
      level.DeclareInput("PostSmoother", postSmootherFact_.get());
  }

  template <class Scalar, class LocalOrdinal, class GlobalOrdinal, class Node>
  void TopSmootherFactory<Scalar, LocalOrdinal, GlobalOrdinal, Node>::Build(Level & level) const {
    if (preSmootherFact_.is_null() && postSmootherFact_.is_null())
      return;

    // NOTE 1: We need to set at least some keep flag for the smoothers, otherwise it is going to be removed as soon as all requests are released.
    // We choose to set the Final flag for the data. In addition, we allow this data to be retrieved by only using the name by the means
    // of using NoFactory. However, any data set with NoFactory gets UserData flag by default. We don't really want that flag, so we remove it.

    // NOTE 2: some smoother factories are tricky (see comments in MueLu::SmootherFactory
    // Sometimes, we don't know whether the factory is able to generate "PreSmoother" or "PostSmoother"
    // For the SmootherFactory, however, we are able to check that.

    if (!preSmootherFact_.is_null()) {
      // Checking for null is not sufficient, as SmootherFactory(null, something) does not generate "PreSmoother"
      bool isAble = true;
      RCP<const SmootherFactory> s = rcp_dynamic_cast<const SmootherFactory>(preSmootherFact_);
      if (!s.is_null()) {
        RCP<SmootherPrototype> pre, post;
        s->GetSmootherPrototypes(pre, post);
        if (pre.is_null())
          isAble = false;
      } else {
        // We assume that  if presmoother factory is not SmootherFactory, it *is* able to generate "PreSmoother"
      }

      if (isAble) {
        RCP<SmootherBase> Pre  = level.Get<RCP<SmootherBase> >("PreSmoother", preSmootherFact_.get());

        level.Set           ("PreSmoother", Pre, NoFactory::get());

        level.AddKeepFlag   ("PreSmoother", NoFactory::get(), MueLu::Final);
        level.RemoveKeepFlag("PreSmoother", NoFactory::get(), MueLu::UserData);
      }
    }

    if (!postSmootherFact_.is_null()) {
      // Checking for null is not sufficient, as SmootherFactory(something, null) does not generate "PostSmoother"
      bool isAble = true;
      RCP<const SmootherFactory> s = rcp_dynamic_cast<const SmootherFactory>(postSmootherFact_);
      if (!s.is_null()) {
        RCP<SmootherPrototype> pre, post;
        s->GetSmootherPrototypes(pre, post);
        if (post.is_null())
          isAble = false;
      } else {
        // We assume that  if presmoother factory is not SmootherFactory, it *is* able to generate "PreSmoother"
      }

      if (isAble) {
        RCP<SmootherBase> Post = level.Get<RCP<SmootherBase> >("PostSmoother", postSmootherFact_.get());

        level.Set           ("PostSmoother", Post, NoFactory::get());

        level.AddKeepFlag   ("PostSmoother", NoFactory::get(), MueLu::Final);
        level.RemoveKeepFlag("PostSmoother", NoFactory::get(), MueLu::UserData);
      }
    }
  }


  // Adds the following non-serializable data (A,P,R,Nullspace,Coordinates) from level-specific sublist nonSerialList,
  // calling AddNewLevel as appropriate.
  template <class Scalar, class LocalOrdinal, class GlobalOrdinal, class Node>
  void HierarchyUtils<Scalar, LocalOrdinal, GlobalOrdinal, Node>::AddNonSerializableDataToHierarchy(HierarchyManager& HM, Hierarchy& H, const ParameterList& paramList) {
    for (ParameterList::ConstIterator it = paramList.begin(); it != paramList.end(); it++) {
      const std::string& levelName = it->first;

      // Check for mach of the form "level X" where X is a positive integer
      if (paramList.isSublist(levelName) && levelName.find("level ") == 0 && levelName.size() > 6) {
        int levelID = strtol(levelName.substr(6).c_str(), 0, 0);
        if (levelID > 0)
        {
          // Do enough level adding so we can be sure to add the data to the right place
          for (int i = H.GetNumLevels(); i <= levelID; i++)
            H.AddNewLevel();
        }
        RCP<Level> level = H.GetLevel(levelID);

        RCP<FactoryManager> M = Teuchos::rcp_dynamic_cast<FactoryManager>(HM.GetFactoryManager(levelID));
        TEUCHOS_TEST_FOR_EXCEPTION(M.is_null(), Exceptions::InvalidArgument, "MueLu::Utils::AddNonSerializableDataToHierarchy: cannot get FactoryManager");

        // Grab the level sublist & loop over parameters
        const ParameterList& levelList = paramList.sublist(levelName);
        for (ParameterList::ConstIterator it2 = levelList.begin(); it2 != levelList.end(); it2++) {
          const std::string& name = it2->first;
          TEUCHOS_TEST_FOR_EXCEPTION(name != "A" && name != "P" && name != "R" &&
                                     name != "Nullspace" && name != "Coordinates" &&
                                     !IsParamMuemexVariable(name), Exceptions::InvalidArgument,
                                     "MueLu::Utils::AddNonSerializableDataToHierarchy: parameter list contains unknown data type");

          if (name == "A") {
            level->Set(name, Teuchos::getValue<RCP<Matrix > > (it2->second),NoFactory::get());
            M->SetFactory(name, NoFactory::getRCP()); // TAW: not sure about this: be aware that this affects all levels
                                                      //      However, A is accessible through NoFactory anyway, so it should
                                                      //      be fine here.
          }
          else if( name == "P" || name == "R") {
            level->AddKeepFlag(name,NoFactory::get(),MueLu::UserData);
            level->Set(name, Teuchos::getValue<RCP<Matrix > >     (it2->second), M->GetFactory(name).get());
          }
          else if (name == "Nullspace")
          {
            level->AddKeepFlag(name,NoFactory::get(),MueLu::UserData);
            level->Set(name, Teuchos::getValue<RCP<MultiVector > >(it2->second), NoFactory::get());
            //M->SetFactory(name, NoFactory::getRCP()); // TAW: generally it is a bad idea to overwrite the factory manager data here
                                                        // One should do this only in very special cases
          }
          else if(name == "Coordinates") //Scalar of Coordinates MV is always double
          {
            level->AddKeepFlag(name,NoFactory::get(),MueLu::UserData);
            level->Set(name, Teuchos::getValue<RCP<Xpetra::MultiVector<double, LocalOrdinal, GlobalOrdinal, Node> > >(it2->second), NoFactory::get());
            //M->SetFactory(name, NoFactory::getRCP()); // TAW: generally it is a bad idea to overwrite the factory manager data here
          }
          #ifdef HAVE_MUELU_MATLAB
          else
          {
            //Custom variable for Muemex
            size_t typeNameStart = name.find_first_not_of(' ');
            size_t typeNameEnd = name.find(' ', typeNameStart);
            std::string typeName = name.substr(typeNameStart, typeNameEnd - typeNameStart);
            std::transform(typeName.begin(), typeName.end(), typeName.begin(), ::tolower);
            level->AddKeepFlag(name, NoFactory::get(), MueLu::UserData);
            if(typeName == "matrix")
              level->Set(name, Teuchos::getValue<RCP<Matrix> >(it2->second), NoFactory::get());
            else if(typeName == "multivector")
              level->Set(name, Teuchos::getValue<RCP<MultiVector> >(it2->second), NoFactory::get());
            else if(typeName == "map")
              level->Set(name, Teuchos::getValue<RCP<Xpetra::Map<LocalOrdinal, GlobalOrdinal, Node> > >(it2->second), NoFactory::get());
            else if(typeName == "ordinalvector")
              level->Set(name, Teuchos::getValue<RCP<Xpetra::Vector<LocalOrdinal, LocalOrdinal, GlobalOrdinal, Node> > >(it2->second), NoFactory::get());
            else if(typeName == "scalar")
              level->Set(name, Teuchos::getValue<Scalar>(it2->second), NoFactory::get());
            else if(typeName == "double")
              level->Set(name, Teuchos::getValue<double>(it2->second), NoFactory::get());
            else if(typeName == "complex")
              level->Set(name, Teuchos::getValue<std::complex<double> >(it2->second), NoFactory::get());
            else if(typeName == "int")
              level->Set(name, Teuchos::getValue<int>(it2->second), NoFactory::get());
            else if(typeName == "string")
              level->Set(name, Teuchos::getValue<std::string>(it2->second), NoFactory::get());
          }
          #endif
        }
      }
    }
  }

} // namespace MueLu

#define MUELU_HIERARCHY_HELPERS_SHORT
#endif // MUELU_HIERARCHYHELPERS_DEF_HPP
