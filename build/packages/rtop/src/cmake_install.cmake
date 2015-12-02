# Install script for directory: /home/tomii/simenv/trilinos/packages/rtop/src

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

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "RTOp")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/home/tomii/simenv/trilinos/build/packages/rtop/src/librtop.a")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "RTOp")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "RTOp")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE FILES
    "/home/tomii/simenv/trilinos/packages/rtop/src/RTOpPack_version.hpp"
    "/home/tomii/simenv/trilinos/packages/rtop/src/RTOp_ConfigDefs.hpp"
    "/home/tomii/simenv/trilinos/packages/rtop/src/interfaces/RTOpPack_RTOpT_decl.hpp"
    "/home/tomii/simenv/trilinos/packages/rtop/src/interfaces/RTOpPack_RTOpT_def.hpp"
    "/home/tomii/simenv/trilinos/packages/rtop/src/interfaces/RTOpPack_Types.hpp"
    "/home/tomii/simenv/trilinos/packages/rtop/src/support/RTOpPack_RTOpTHelpers_def.hpp"
    "/home/tomii/simenv/trilinos/packages/rtop/src/support/RTOpPack_SparseSubVectorT.hpp"
    "/home/tomii/simenv/trilinos/packages/rtop/src/support/RTOpPack_RTOpServerDecl.hpp"
    "/home/tomii/simenv/trilinos/packages/rtop/src/support/RTOpPack_RTOpSubRangeDecorator_decl.hpp"
    "/home/tomii/simenv/trilinos/packages/rtop/src/support/RTOpPack_SPMD_apply_op_decl.hpp"
    "/home/tomii/simenv/trilinos/packages/rtop/src/support/RTOpPack_RTOpTHelpers_decl.hpp"
    "/home/tomii/simenv/trilinos/packages/rtop/src/support/RTOpPack_SPMD_apply_op_def.hpp"
    "/home/tomii/simenv/trilinos/packages/rtop/src/support/RTOpPack_RTOpServer.hpp"
    "/home/tomii/simenv/trilinos/packages/rtop/src/support/RTOpPack_TOpUnaryFuncPtr.hpp"
    "/home/tomii/simenv/trilinos/packages/rtop/src/support/RTOpPack_TOpUnaryFuncPtrDecl.hpp"
    "/home/tomii/simenv/trilinos/packages/rtop/src/support/RTOpPack_RTOpSubRangeDecorator_def.hpp"
    "/home/tomii/simenv/trilinos/packages/rtop/src/support/RTOp_parallel_helpers.h"
    "/home/tomii/simenv/trilinos/packages/rtop/src/ops_lib/RTOpPack_ROpCountNanInf.hpp"
    "/home/tomii/simenv/trilinos/packages/rtop/src/ops_lib/RTOpPack_TOpEleWiseProdUpdate.hpp"
    "/home/tomii/simenv/trilinos/packages/rtop/src/ops_lib/RTOpPack_TOpRandomize.hpp"
    "/home/tomii/simenv/trilinos/packages/rtop/src/ops_lib/RTOpPack_TOpSetElement.hpp"
    "/home/tomii/simenv/trilinos/packages/rtop/src/ops_lib/RTOpPack_ROpNorm1.hpp"
    "/home/tomii/simenv/trilinos/packages/rtop/src/ops_lib/RTOpPack_ROpWeightedNorm2.hpp"
    "/home/tomii/simenv/trilinos/packages/rtop/src/ops_lib/RTOpPack_TOpAssignScalar.hpp"
    "/home/tomii/simenv/trilinos/packages/rtop/src/ops_lib/RTOpPack_TOpEleWiseProd.hpp"
    "/home/tomii/simenv/trilinos/packages/rtop/src/ops_lib/RTOpPack_TOpEleWiseScale.hpp"
    "/home/tomii/simenv/trilinos/packages/rtop/src/ops_lib/RTOpPack_TOpAddScalar.hpp"
    "/home/tomii/simenv/trilinos/packages/rtop/src/ops_lib/RTOpPack_ROpNormInf.hpp"
    "/home/tomii/simenv/trilinos/packages/rtop/src/ops_lib/RTOpPack_TOpLinearCombination_def.hpp"
    "/home/tomii/simenv/trilinos/packages/rtop/src/ops_lib/RTOpPack_ROpNorm2.hpp"
    "/home/tomii/simenv/trilinos/packages/rtop/src/ops_lib/RTOpPack_ROpMinIndex.hpp"
    "/home/tomii/simenv/trilinos/packages/rtop/src/ops_lib/RTOpPack_ROpMin.hpp"
    "/home/tomii/simenv/trilinos/packages/rtop/src/ops_lib/RTOpPack_TOpEleWiseDivide.hpp"
    "/home/tomii/simenv/trilinos/packages/rtop/src/ops_lib/RTOpPack_ROpMaxIndex.hpp"
    "/home/tomii/simenv/trilinos/packages/rtop/src/ops_lib/RTOpPack_TOpAbs.hpp"
    "/home/tomii/simenv/trilinos/packages/rtop/src/ops_lib/RTOpPack_ROpMax.hpp"
    "/home/tomii/simenv/trilinos/packages/rtop/src/ops_lib/RTOpPack_TOpAssignVectors.hpp"
    "/home/tomii/simenv/trilinos/packages/rtop/src/ops_lib/RTOpPack_ROpMinIndexGreaterThanBound.hpp"
    "/home/tomii/simenv/trilinos/packages/rtop/src/ops_lib/RTOpPack_TOpSetAssendingValues.hpp"
    "/home/tomii/simenv/trilinos/packages/rtop/src/ops_lib/RTOpPack_ROpSum.hpp"
    "/home/tomii/simenv/trilinos/packages/rtop/src/ops_lib/RTOpPack_TOpSetSubVector_def.hpp"
    "/home/tomii/simenv/trilinos/packages/rtop/src/ops_lib/RTOpPack_TOpReciprocal.hpp"
    "/home/tomii/simenv/trilinos/packages/rtop/src/ops_lib/RTOpPack_ROpDotProd.hpp"
    "/home/tomii/simenv/trilinos/packages/rtop/src/ops_lib/RTOpPack_ROpMaxIndexLessThanBound.hpp"
    "/home/tomii/simenv/trilinos/packages/rtop/src/ops_lib/RTOpPack_TOpEleWiseConjProd.hpp"
    "/home/tomii/simenv/trilinos/packages/rtop/src/ops_lib/RTOpPack_ROpGetSubVector_def.hpp"
    "/home/tomii/simenv/trilinos/packages/rtop/src/ops_lib/RTOpPack_TOpAXPY.hpp"
    "/home/tomii/simenv/trilinos/packages/rtop/src/ops_lib/RTOpPack_TOpScaleVector.hpp"
    "/home/tomii/simenv/trilinos/packages/rtop/src/ops_lib/RTOpPack_TOpLinearCombination_decl.hpp"
    "/home/tomii/simenv/trilinos/packages/rtop/src/ops_lib/RTOpPack_TOpSetSubVector.hpp"
    "/home/tomii/simenv/trilinos/packages/rtop/src/ops_lib/RTOpPack_ROpGetSubVector_decl.hpp"
    "/home/tomii/simenv/trilinos/packages/rtop/src/ops_lib/RTOpPack_ROpGetElement.hpp"
    "/home/tomii/simenv/trilinos/packages/rtop/src/lapack/RTOpPack_LapackWrappers.hpp"
    "/home/tomii/simenv/trilinos/build/packages/rtop/src/RTOpPack_RTOpTHelpers.hpp"
    "/home/tomii/simenv/trilinos/build/packages/rtop/src/RTOpPack_TOpLinearCombination.hpp"
    "/home/tomii/simenv/trilinos/build/packages/rtop/src/RTOpPack_RTOpSubRangeDecorator.hpp"
    "/home/tomii/simenv/trilinos/build/packages/rtop/src/RTOpPack_RTOpT.hpp"
    "/home/tomii/simenv/trilinos/build/packages/rtop/src/RTOpPack_SPMD_apply_op.hpp"
    "/home/tomii/simenv/trilinos/build/packages/rtop/src/RTOpPack_ROpGetSubVector.hpp"
    "/home/tomii/simenv/trilinos/build/packages/rtop/src/RTOp_Config.h"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "RTOp")

