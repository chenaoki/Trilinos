# Install script for directory: /home/tomii/simenv/trilinos/packages/teuchos/core/src

# Set the install prefix
IF(NOT DEFINED CMAKE_INSTALL_PREFIX)
  SET(CMAKE_INSTALL_PREFIX "../install")
ENDIF(NOT DEFINED CMAKE_INSTALL_PREFIX)
STRING(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
IF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  IF(BUILD_TYPE)
    STRING(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  ELSE(BUILD_TYPE)
    SET(CMAKE_INSTALL_CONFIG_NAME "RELEASE")
  ENDIF(BUILD_TYPE)
  MESSAGE(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
ENDIF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)

# Set the component getting installed.
IF(NOT CMAKE_INSTALL_COMPONENT)
  IF(COMPONENT)
    MESSAGE(STATUS "Install component: \"${COMPONENT}\"")
    SET(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  ELSE(COMPONENT)
    SET(CMAKE_INSTALL_COMPONENT)
  ENDIF(COMPONENT)
ENDIF(NOT CMAKE_INSTALL_COMPONENT)

# Install shared libraries without execute permission?
IF(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  SET(CMAKE_INSTALL_SO_NO_EXE "1")
ENDIF(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "TeuchosCore")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/home/tomii/simenv/trilinos/build/packages/teuchos/core/src/libteuchoscore.a")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "TeuchosCore")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "TeuchosCore")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE FILES
    "/home/tomii/simenv/trilinos/build/packages/teuchos/core/src/Teuchos_config.h"
    "/home/tomii/simenv/trilinos/build/packages/teuchos/core/src/TeuchosCore_config.h"
    "/home/tomii/simenv/trilinos/packages/teuchos/core/src/Teuchos_F77_wrappers.h"
    "/home/tomii/simenv/trilinos/packages/teuchos/core/src/Teuchos_DLLExportMacro.h"
    "/home/tomii/simenv/trilinos/packages/teuchos/core/src/Teuchos_StandardMemberCompositionMacros.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/core/src/Teuchos_Range1D.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/core/src/Teuchos_CommandLineProcessor.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/core/src/Teuchos_RCPDecl.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/core/src/Teuchos_Ptr.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/core/src/Teuchos_FilteredIterator.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/core/src/Teuchos_TwoDArray.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/core/src/Teuchos_ConstNonconstObjectContainer.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/core/src/Teuchos_AbstractFactory.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/core/src/Teuchos_GlobalMPISession.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/core/src/Teuchos_UnitTestBase.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/core/src/Teuchos_UnitTestHarness.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/core/src/Teuchos_RefCountPtr.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/core/src/Teuchos_any.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/core/src/Teuchos_FancyOStream.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/core/src/Teuchos_LabeledObject.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/core/src/Teuchos_VerboseObject.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/core/src/Teuchos_dyn_cast.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/core/src/Teuchos_as.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/core/src/Teuchos_TypeTraits.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/core/src/Teuchos_RCP.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/core/src/Teuchos_LocalTestingHelpers.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/core/src/Teuchos_CompileTimeAssert.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/core/src/Teuchos_stacktrace.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/core/src/Teuchos_StandardCompositionMacros.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/core/src/Teuchos_OrdinalTraits.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/core/src/Teuchos_ConfigDefs.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/core/src/Teuchos_Time.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/core/src/Teuchos_ArrayViewDecl.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/core/src/Teuchos_getConst.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/core/src/Teuchos_SimpleObjectDB.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/core/src/Teuchos_ArrayConversions.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/core/src/Teuchos_TestForException.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/core/src/Teuchos_StaticSetupMacro.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/core/src/Teuchos_oblackholestream.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/core/src/Teuchos_RCPStdSharedPtrConversions.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/core/src/Teuchos_basic_oblackholestream.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/core/src/Teuchos_ScalarTraits.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/core/src/Teuchos_StringIndexedOrderedValueObjectContainer.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/core/src/Teuchos_Details_Allocator.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/core/src/Teuchos_toString.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/core/src/Teuchos_Workspace.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/core/src/Teuchos_StrUtils.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/core/src/Teuchos_TypeNameTraits.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/core/src/Teuchos_ScalarTraitsCUDA.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/core/src/Teuchos_Array.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/core/src/Teuchos_ExplicitInstantiationHelpers.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/core/src/Teuchos_Describable.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/core/src/Teuchos_HashSet.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/core/src/Teuchos_PtrDecl.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/core/src/Teuchos_Hashtable.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/core/src/Teuchos_RefCountPtrDecl.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/core/src/Teuchos_AbstractFactoryStd.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/core/src/Teuchos_map.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/core/src/Teuchos_Utils.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/core/src/Teuchos_ConstTypeTraits.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/core/src/Teuchos_Version.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/core/src/Teuchos_TabularOutputter.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/core/src/Teuchos_UnitTestRepository.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/core/src/Teuchos_Assert.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/core/src/Teuchos_HashUtils.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/core/src/Teuchos_implicit_cast.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/core/src/Teuchos_ArrayRCP.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/core/src/Teuchos_ENull.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/core/src/Teuchos_NullIteratorTraits.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/core/src/Teuchos_Exceptions.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/core/src/Teuchos_TestingHelpers.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/core/src/Teuchos_SimpleObjectTable.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/core/src/Teuchos_RCPStdSharedPtrConversionsDecl.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/core/src/Teuchos_StandardCatchMacros.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/core/src/Teuchos_ArrayView.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/core/src/Teuchos_DebugDefaultAsserts.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/core/src/Teuchos_iostream_helpers.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/core/src/Teuchos_OpaqueWrapper.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/core/src/Teuchos_getRawPtr.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/core/src/Teuchos_VerbosityLevel.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/core/src/Teuchos_UnitTestHelpers.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/core/src/Teuchos_ScalarTraitsDecl.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/core/src/TeuchosCore_ConfigDefs.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/core/src/Teuchos_CWrapperSupport_Cpp.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/core/src/Teuchos_Tuple.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/core/src/Teuchos_RCPNode.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/core/src/Teuchos_ArrayRCPDecl.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/core/src/Teuchos_getBaseObjVoidPtr.hpp"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "TeuchosCore")

