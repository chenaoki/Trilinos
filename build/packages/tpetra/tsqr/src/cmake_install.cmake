# Install script for directory: /home/tomii/simenv/trilinos/packages/tpetra/tsqr/src

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

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "TpetraTSQR")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/home/tomii/simenv/trilinos/build/packages/tpetra/tsqr/src/libkokkostsqr.a")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "TpetraTSQR")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "TpetraTSQR")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE FILES
    "/home/tomii/simenv/trilinos/build/packages/tpetra/tsqr/src/TpetraTSQR_config.h"
    "/home/tomii/simenv/trilinos/packages/tpetra/tsqr/src/Tsqr_Random_MatrixGenerator.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/tsqr/src/Tsqr_ConfigDefs.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/tsqr/src/Tsqr_SequentialTsqr.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/tsqr/src/Tsqr_DistTsqrHelper.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/tsqr/src/Tsqr_DistTsqr.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/tsqr/src/Tsqr_Matrix.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/tsqr/src/Tsqr_TsqrTest.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/tsqr/src/Tsqr_LocalVerify.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/tsqr/src/Tsqr_MatView.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/tsqr/src/Tsqr_TeuchosMessenger.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/tsqr/src/Tsqr_CombineTest.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/tsqr/src/Tsqr_TestUtils.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/tsqr/src/Tsqr_MessengerBase.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/tsqr/src/Tsqr_CombineBenchmarker.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/tsqr/src/Tsqr_printGlobalMatrix.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/tsqr/src/Tsqr_TestSetup.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/tsqr/src/Tsqr_StatTimeMonitor.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/tsqr/src/Tsqr_TbbTest.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/tsqr/src/Tsqr_RMessenger.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/tsqr/src/Tsqr_DistTsqrRB.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/tsqr/src/Tsqr_CombineDefault.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/tsqr/src/Tsqr_TrivialTimer.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/tsqr/src/Tsqr.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/tsqr/src/TsqrAdaptor.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/tsqr/src/TsqrCommFactory.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/tsqr/src/Tsqr_FullTsqrTest.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/tsqr/src/Tsqr_Mgs.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/tsqr/src/Tsqr_Random_NormalGenerator.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/tsqr/src/Tsqr_CacheBlocker.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/tsqr/src/Tsqr_CombineNative.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/tsqr/src/Tsqr_CacheBlockingStrategy.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/tsqr/src/Tsqr_KokkosNodeTsqr.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/tsqr/src/Tsqr_NodeTsqr.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/tsqr/src/Tsqr_GlobalTimeStats.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/tsqr/src/Tsqr_TimeStats.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/tsqr/src/Tsqr_NodeTsqrFactory.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/tsqr/src/TsqrFactory_SequentialTsqr.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/tsqr/src/Tsqr_ParTest.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/tsqr/src/Tsqr_nodeTestProblem.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/tsqr/src/Tsqr_SequentialCholeskyQR.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/tsqr/src/Tsqr_generateStack.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/tsqr/src/Tsqr_MgsTest.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/tsqr/src/TsqrFactory_TbbTsqr.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/tsqr/src/Tsqr_ApplyType.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/tsqr/src/Tsqr_Combine.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/tsqr/src/Tsqr_GlobalVerify.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/tsqr/src/Tsqr_CombineBenchmark.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/tsqr/src/Tsqr_KokkosNodeTsqrTest.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/tsqr/src/TsqrFactory.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/tsqr/src/Tsqr_Util.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/tsqr/src/Tsqr_Random_GlobalMatrix.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/tsqr/src/Tsqr_SeqTest.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/tsqr/src/Tsqr_verifyTimerConcept.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/tsqr/src/Tsqr_TrivialMessenger.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/tsqr/src/TsqrTypeAdaptor.hpp"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "TpetraTSQR")

