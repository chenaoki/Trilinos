# Install script for directory: /home/tomii/simenv/trilinos/packages/anasazi/src

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

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Anasazi")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/home/tomii/simenv/trilinos/build/packages/anasazi/src/libanasazi.a")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Anasazi")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Anasazi")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE FILES
    "/home/tomii/simenv/trilinos/build/packages/anasazi/src/Anasazi_config.h"
    "/home/tomii/simenv/trilinos/build/packages/anasazi/src/Anasazi_DLLExportMacro.h"
    "/home/tomii/simenv/trilinos/packages/anasazi/src/AnasaziBasicEigenproblem.hpp"
    "/home/tomii/simenv/trilinos/packages/anasazi/src/AnasaziBasicOrthoManager.hpp"
    "/home/tomii/simenv/trilinos/packages/anasazi/src/AnasaziBasicOutputManager.hpp"
    "/home/tomii/simenv/trilinos/packages/anasazi/src/AnasaziBasicSort.hpp"
    "/home/tomii/simenv/trilinos/packages/anasazi/src/AnasaziBlockDavidson.hpp"
    "/home/tomii/simenv/trilinos/packages/anasazi/src/AnasaziBlockDavidsonSolMgr.hpp"
    "/home/tomii/simenv/trilinos/packages/anasazi/src/AnasaziBlockKrylovSchur.hpp"
    "/home/tomii/simenv/trilinos/packages/anasazi/src/AnasaziBlockKrylovSchurSolMgr.hpp"
    "/home/tomii/simenv/trilinos/packages/anasazi/src/AnasaziConfigDefs.hpp"
    "/home/tomii/simenv/trilinos/packages/anasazi/src/AnasaziEigenproblem.hpp"
    "/home/tomii/simenv/trilinos/packages/anasazi/src/AnasaziEigensolver.hpp"
    "/home/tomii/simenv/trilinos/packages/anasazi/src/AnasaziEigensolverDecl.hpp"
    "/home/tomii/simenv/trilinos/packages/anasazi/src/AnasaziLOBPCG.hpp"
    "/home/tomii/simenv/trilinos/packages/anasazi/src/AnasaziLOBPCGSolMgr.hpp"
    "/home/tomii/simenv/trilinos/packages/anasazi/src/AnasaziGeneralizedDavidson.hpp"
    "/home/tomii/simenv/trilinos/packages/anasazi/src/AnasaziGeneralizedDavidsonSolMgr.hpp"
    "/home/tomii/simenv/trilinos/packages/anasazi/src/AnasaziGenOrthoManager.hpp"
    "/home/tomii/simenv/trilinos/packages/anasazi/src/AnasaziHelperTraits.hpp"
    "/home/tomii/simenv/trilinos/packages/anasazi/src/AnasaziICGSOrthoManager.hpp"
    "/home/tomii/simenv/trilinos/packages/anasazi/src/AnasaziIRTR.hpp"
    "/home/tomii/simenv/trilinos/packages/anasazi/src/AnasaziMatOrthoManager.hpp"
    "/home/tomii/simenv/trilinos/packages/anasazi/src/AnasaziMultiVec.hpp"
    "/home/tomii/simenv/trilinos/packages/anasazi/src/AnasaziMultiVecTraits.hpp"
    "/home/tomii/simenv/trilinos/packages/anasazi/src/AnasaziOperator.hpp"
    "/home/tomii/simenv/trilinos/packages/anasazi/src/AnasaziOperatorTraits.hpp"
    "/home/tomii/simenv/trilinos/packages/anasazi/src/AnasaziOrthoManager.hpp"
    "/home/tomii/simenv/trilinos/packages/anasazi/src/AnasaziOutputManager.hpp"
    "/home/tomii/simenv/trilinos/packages/anasazi/src/AnasaziRTRBase.hpp"
    "/home/tomii/simenv/trilinos/packages/anasazi/src/AnasaziRTRSolMgr.hpp"
    "/home/tomii/simenv/trilinos/packages/anasazi/src/AnasaziSimpleLOBPCGSolMgr.hpp"
    "/home/tomii/simenv/trilinos/packages/anasazi/src/AnasaziSIRTR.hpp"
    "/home/tomii/simenv/trilinos/packages/anasazi/src/AnasaziSolverManager.hpp"
    "/home/tomii/simenv/trilinos/packages/anasazi/src/AnasaziSortManager.hpp"
    "/home/tomii/simenv/trilinos/packages/anasazi/src/AnasaziSolverUtils.hpp"
    "/home/tomii/simenv/trilinos/packages/anasazi/src/AnasaziStatusTest.hpp"
    "/home/tomii/simenv/trilinos/packages/anasazi/src/AnasaziStatusTestDecl.hpp"
    "/home/tomii/simenv/trilinos/packages/anasazi/src/AnasaziStatusTestCombo.hpp"
    "/home/tomii/simenv/trilinos/packages/anasazi/src/AnasaziStatusTestMaxIters.hpp"
    "/home/tomii/simenv/trilinos/packages/anasazi/src/AnasaziStatusTestWithOrdering.hpp"
    "/home/tomii/simenv/trilinos/packages/anasazi/src/AnasaziStatusTestOutput.hpp"
    "/home/tomii/simenv/trilinos/packages/anasazi/src/AnasaziStatusTestResNorm.hpp"
    "/home/tomii/simenv/trilinos/packages/anasazi/src/AnasaziStubTsqrAdapter.hpp"
    "/home/tomii/simenv/trilinos/packages/anasazi/src/AnasaziSVQBOrthoManager.hpp"
    "/home/tomii/simenv/trilinos/packages/anasazi/src/AnasaziTypes.hpp"
    "/home/tomii/simenv/trilinos/packages/anasazi/src/AnasaziTraceMinBase.hpp"
    "/home/tomii/simenv/trilinos/packages/anasazi/src/AnasaziTraceMin.hpp"
    "/home/tomii/simenv/trilinos/packages/anasazi/src/AnasaziTraceMinDavidson.hpp"
    "/home/tomii/simenv/trilinos/packages/anasazi/src/AnasaziTraceMinBaseSolMgr.hpp"
    "/home/tomii/simenv/trilinos/packages/anasazi/src/AnasaziTraceMinSolMgr.hpp"
    "/home/tomii/simenv/trilinos/packages/anasazi/src/AnasaziTraceMinDavidsonSolMgr.hpp"
    "/home/tomii/simenv/trilinos/packages/anasazi/src/AnasaziMinres.hpp"
    "/home/tomii/simenv/trilinos/packages/anasazi/src/AnasaziSaddleContainer.hpp"
    "/home/tomii/simenv/trilinos/packages/anasazi/src/AnasaziSaddleOperator.hpp"
    "/home/tomii/simenv/trilinos/packages/anasazi/src/AnasaziTraceMinRitzOp.hpp"
    "/home/tomii/simenv/trilinos/packages/anasazi/src/AnasaziTraceMinTypes.hpp"
    "/home/tomii/simenv/trilinos/packages/anasazi/src/AnasaziStatusTestSpecTrans.hpp"
    "/home/tomii/simenv/trilinos/packages/anasazi/src/AnasaziMVOPTester.hpp"
    "/home/tomii/simenv/trilinos/packages/anasazi/src/../thyra/src/AnasaziThyraAdapter.hpp"
    "/home/tomii/simenv/trilinos/packages/anasazi/src/../thyra/src/AnasaziThyraDebugAdapter.hpp"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Anasazi")

