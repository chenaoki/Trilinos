# Install script for directory: /home/tomii/simenv/trilinos/packages/aztecoo/src

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

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "AztecOO")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/home/tomii/simenv/trilinos/build/packages/aztecoo/src/libaztecoo.a")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "AztecOO")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "AztecOO")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE FILES
    "/home/tomii/simenv/trilinos/build/packages/aztecoo/src/AztecOO_config.h"
    "/home/tomii/simenv/trilinos/packages/aztecoo/src/az_aztec_defs.h"
    "/home/tomii/simenv/trilinos/packages/aztecoo/src/az_aztecf.h"
    "/home/tomii/simenv/trilinos/packages/aztecoo/src/az_aztec.h"
    "/home/tomii/simenv/trilinos/packages/aztecoo/src/az_f77func.h"
    "/home/tomii/simenv/trilinos/packages/aztecoo/src/az_y12m_wrappers.h"
    "/home/tomii/simenv/trilinos/packages/aztecoo/src/az_blas_wrappers.h"
    "/home/tomii/simenv/trilinos/packages/aztecoo/src/az_lapack_wrappers.h"
    "/home/tomii/simenv/trilinos/packages/aztecoo/src/AztecOO.h"
    "/home/tomii/simenv/trilinos/packages/aztecoo/src/AztecOO_string_maps.h"
    "/home/tomii/simenv/trilinos/packages/aztecoo/src/AztecOO_Operator.h"
    "/home/tomii/simenv/trilinos/packages/aztecoo/src/Epetra_MsrMatrix.h"
    "/home/tomii/simenv/trilinos/packages/aztecoo/src/Aztec2Petra.h"
    "/home/tomii/simenv/trilinos/packages/aztecoo/src/AZOO_iterate.h"
    "/home/tomii/simenv/trilinos/packages/aztecoo/src/AZOO_printf.h"
    "/home/tomii/simenv/trilinos/packages/aztecoo/src/AztecOO_Scaling.h"
    "/home/tomii/simenv/trilinos/packages/aztecoo/src/AztecOO_StatusTest.h"
    "/home/tomii/simenv/trilinos/packages/aztecoo/src/AztecOO_StatusType.h"
    "/home/tomii/simenv/trilinos/packages/aztecoo/src/AztecOO_StatusTestCombo.h"
    "/home/tomii/simenv/trilinos/packages/aztecoo/src/AztecOO_StatusTestMaxIters.h"
    "/home/tomii/simenv/trilinos/packages/aztecoo/src/AztecOO_StatusTestResNorm.h"
    "/home/tomii/simenv/trilinos/packages/aztecoo/src/AztecOO_ConditionNumber.h"
    "/home/tomii/simenv/trilinos/packages/aztecoo/src/AztecOO_ConfigDefs.h"
    "/home/tomii/simenv/trilinos/packages/aztecoo/src/AztecOO_Version.h"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "AztecOO")

