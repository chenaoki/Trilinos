# Install script for directory: /home/tomii/simenv/trilinos/packages/belos/src

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

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Belos")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/home/tomii/simenv/trilinos/build/packages/belos/src/libbelos.a")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Belos")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Belos")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE FILES
    "/home/tomii/simenv/trilinos/build/packages/belos/src/Belos_config.h"
    "/home/tomii/simenv/trilinos/packages/belos/src/BelosBiCGStabIter.hpp"
    "/home/tomii/simenv/trilinos/packages/belos/src/BelosBiCGStabSolMgr.hpp"
    "/home/tomii/simenv/trilinos/packages/belos/src/BelosBlockCGIter.hpp"
    "/home/tomii/simenv/trilinos/packages/belos/src/BelosBlockCGSolMgr.hpp"
    "/home/tomii/simenv/trilinos/packages/belos/src/BelosBlockFGmresIter.hpp"
    "/home/tomii/simenv/trilinos/packages/belos/src/BelosBlockGmresIter.hpp"
    "/home/tomii/simenv/trilinos/packages/belos/src/BelosBlockGmresSolMgr.hpp"
    "/home/tomii/simenv/trilinos/packages/belos/src/BelosCGIteration.hpp"
    "/home/tomii/simenv/trilinos/packages/belos/src/BelosCGIter.hpp"
    "/home/tomii/simenv/trilinos/packages/belos/src/BelosConfigDefs.hpp"
    "/home/tomii/simenv/trilinos/packages/belos/src/BelosDGKSOrthoManager.hpp"
    "/home/tomii/simenv/trilinos/packages/belos/src/BelosFixedPointIter.hpp"
    "/home/tomii/simenv/trilinos/packages/belos/src/BelosFixedPointIteration.hpp"
    "/home/tomii/simenv/trilinos/packages/belos/src/BelosFixedPointSolMgr.hpp"
    "/home/tomii/simenv/trilinos/packages/belos/src/BelosGCRODRIter.hpp"
    "/home/tomii/simenv/trilinos/packages/belos/src/BelosGCRODRSolMgr.hpp"
    "/home/tomii/simenv/trilinos/packages/belos/src/BelosGmresIteration.hpp"
    "/home/tomii/simenv/trilinos/packages/belos/src/BelosGmresPolyOp.hpp"
    "/home/tomii/simenv/trilinos/packages/belos/src/BelosGmresPolySolMgr.hpp"
    "/home/tomii/simenv/trilinos/packages/belos/src/BelosICGSOrthoManager.hpp"
    "/home/tomii/simenv/trilinos/packages/belos/src/BelosIMGSOrthoManager.hpp"
    "/home/tomii/simenv/trilinos/packages/belos/src/BelosIteration.hpp"
    "/home/tomii/simenv/trilinos/packages/belos/src/BelosLinearProblem.hpp"
    "/home/tomii/simenv/trilinos/packages/belos/src/BelosLSQRIter.hpp"
    "/home/tomii/simenv/trilinos/packages/belos/src/BelosLSQRIteration.hpp"
    "/home/tomii/simenv/trilinos/packages/belos/src/BelosLSQRSolMgr.hpp"
    "/home/tomii/simenv/trilinos/packages/belos/src/BelosLSQRStatusTest.hpp"
    "/home/tomii/simenv/trilinos/packages/belos/src/BelosMatOrthoManager.hpp"
    "/home/tomii/simenv/trilinos/packages/belos/src/BelosMinresIteration.hpp"
    "/home/tomii/simenv/trilinos/packages/belos/src/BelosMinresIter.hpp"
    "/home/tomii/simenv/trilinos/packages/belos/src/BelosMinresSolMgr.hpp"
    "/home/tomii/simenv/trilinos/packages/belos/src/BelosMultiVec.hpp"
    "/home/tomii/simenv/trilinos/packages/belos/src/BelosMultiVecTraits.hpp"
    "/home/tomii/simenv/trilinos/packages/belos/src/BelosMVOPTester.hpp"
    "/home/tomii/simenv/trilinos/packages/belos/src/BelosOperator.hpp"
    "/home/tomii/simenv/trilinos/packages/belos/src/BelosOperatorTraits.hpp"
    "/home/tomii/simenv/trilinos/packages/belos/src/BelosOrthoManagerFactory.hpp"
    "/home/tomii/simenv/trilinos/packages/belos/src/BelosOrthoManager.hpp"
    "/home/tomii/simenv/trilinos/packages/belos/src/BelosOrthoManagerTest.hpp"
    "/home/tomii/simenv/trilinos/packages/belos/src/BelosOutputManager.hpp"
    "/home/tomii/simenv/trilinos/packages/belos/src/BelosPCPGIter.hpp"
    "/home/tomii/simenv/trilinos/packages/belos/src/BelosPCPGSolMgr.hpp"
    "/home/tomii/simenv/trilinos/packages/belos/src/BelosPseudoBlockCGIter.hpp"
    "/home/tomii/simenv/trilinos/packages/belos/src/BelosPseudoBlockCGSolMgr.hpp"
    "/home/tomii/simenv/trilinos/packages/belos/src/BelosPseudoBlockGmresIter.hpp"
    "/home/tomii/simenv/trilinos/packages/belos/src/BelosPseudoBlockGmresSolMgr.hpp"
    "/home/tomii/simenv/trilinos/packages/belos/src/BelosPseudoBlockStochasticCGIter.hpp"
    "/home/tomii/simenv/trilinos/packages/belos/src/BelosPseudoBlockStochasticCGSolMgr.hpp"
    "/home/tomii/simenv/trilinos/packages/belos/src/BelosRCGIter.hpp"
    "/home/tomii/simenv/trilinos/packages/belos/src/BelosRCGSolMgr.hpp"
    "/home/tomii/simenv/trilinos/packages/belos/src/BelosSimpleOrthoManager.hpp"
    "/home/tomii/simenv/trilinos/packages/belos/src/BelosSolverManager.hpp"
    "/home/tomii/simenv/trilinos/packages/belos/src/BelosSolverFactory.hpp"
    "/home/tomii/simenv/trilinos/packages/belos/src/BelosStatusTestCombo.hpp"
    "/home/tomii/simenv/trilinos/packages/belos/src/BelosStatusTestFactory.hpp"
    "/home/tomii/simenv/trilinos/packages/belos/src/BelosStatusTestGeneralOutput.hpp"
    "/home/tomii/simenv/trilinos/packages/belos/src/BelosStatusTestGenResNorm.hpp"
    "/home/tomii/simenv/trilinos/packages/belos/src/BelosStatusTest.hpp"
    "/home/tomii/simenv/trilinos/packages/belos/src/BelosStatusTestImpResNorm.hpp"
    "/home/tomii/simenv/trilinos/packages/belos/src/BelosStatusTestMaxIters.hpp"
    "/home/tomii/simenv/trilinos/packages/belos/src/BelosStatusTestOutputFactory.hpp"
    "/home/tomii/simenv/trilinos/packages/belos/src/BelosStatusTestOutput.hpp"
    "/home/tomii/simenv/trilinos/packages/belos/src/BelosStatusTestResNorm.hpp"
    "/home/tomii/simenv/trilinos/packages/belos/src/BelosStatusTestResNormOutput.hpp"
    "/home/tomii/simenv/trilinos/packages/belos/src/BelosStochasticCGIteration.hpp"
    "/home/tomii/simenv/trilinos/packages/belos/src/BelosStubTsqrAdapter.hpp"
    "/home/tomii/simenv/trilinos/packages/belos/src/BelosTFQMRIter.hpp"
    "/home/tomii/simenv/trilinos/packages/belos/src/BelosTFQMRSolMgr.hpp"
    "/home/tomii/simenv/trilinos/packages/belos/src/BelosPseudoBlockTFQMRIter.hpp"
    "/home/tomii/simenv/trilinos/packages/belos/src/BelosPseudoBlockTFQMRSolMgr.hpp"
    "/home/tomii/simenv/trilinos/packages/belos/src/BelosTypes.hpp"
    "/home/tomii/simenv/trilinos/packages/belos/src/Belos_Details_LinearSolver.hpp"
    "/home/tomii/simenv/trilinos/packages/belos/src/Belos_Details_LinearSolverFactory.hpp"
    "/home/tomii/simenv/trilinos/packages/belos/src/Belos_Details_registerLinearSolverFactory.hpp"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Belos")

