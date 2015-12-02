# Install script for directory: /home/tomii/simenv/trilinos/packages/amesos/src

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

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Amesos")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/home/tomii/simenv/trilinos/build/packages/amesos/src/libamesos.a")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Amesos")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Amesos")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE FILES
    "/home/tomii/simenv/trilinos/build/packages/amesos/src/Amesos_config.h"
    "/home/tomii/simenv/trilinos/packages/amesos/src/Amesos_Umfpack.h"
    "/home/tomii/simenv/trilinos/packages/amesos/src/SuiteSparse/AMD/Include/amesos_amd.h"
    "/home/tomii/simenv/trilinos/packages/amesos/src/SuiteSparse/AMD/Include/amesos_amd_internal.h"
    "/home/tomii/simenv/trilinos/packages/amesos/src/SuiteSparse/COLAMD/Include/amesos_colamd.h"
    "/home/tomii/simenv/trilinos/packages/amesos/src/SuiteSparse/CHOLMOD/Include/amesos_cholmod_check.h"
    "/home/tomii/simenv/trilinos/packages/amesos/src/SuiteSparse/CHOLMOD/Include/amesos_cholmod_core.h"
    "/home/tomii/simenv/trilinos/packages/amesos/src/SuiteSparse/CHOLMOD/Include/amesos_cholmod.h"
    "/home/tomii/simenv/trilinos/packages/amesos/src/SuiteSparse/CHOLMOD/Include/amesos_cholmod_internal.h"
    "/home/tomii/simenv/trilinos/packages/amesos/src/SuiteSparse/CHOLMOD/Include/amesos_cholmod_io64.h"
    "/home/tomii/simenv/trilinos/packages/amesos/src/SuiteSparse/CHOLMOD/Include/amesos_cholmod_partition.h"
    "/home/tomii/simenv/trilinos/packages/amesos/src/SuiteSparse/UFconfig/amesos_UFconfig.h"
    "/home/tomii/simenv/trilinos/packages/amesos/src/SuiteSparse/KLU/Include/amesos_klu_decl.h"
    "/home/tomii/simenv/trilinos/packages/amesos/src/SuiteSparse/KLU/Include/amesos_klu_internal.h"
    "/home/tomii/simenv/trilinos/packages/amesos/src/SuiteSparse/KLU/Include/amesos_klu_version.h"
    "/home/tomii/simenv/trilinos/packages/amesos/src/SuiteSparse/BTF/Include/amesos_btf_decl.h"
    "/home/tomii/simenv/trilinos/packages/amesos/src/SuiteSparse/BTF/Include/amesos_btf_internal.h"
    "/home/tomii/simenv/trilinos/packages/amesos/src/Amesos_Klu.h"
    "/home/tomii/simenv/trilinos/packages/amesos/src/Amesos.h"
    "/home/tomii/simenv/trilinos/packages/amesos/src/Amesos_BaseSolver.h"
    "/home/tomii/simenv/trilinos/packages/amesos/src/Amesos_ComponentBaseSolver.h"
    "/home/tomii/simenv/trilinos/packages/amesos/src/Amesos_ConfigDefs.h"
    "/home/tomii/simenv/trilinos/packages/amesos/src/CrsMatrixTranspose.h"
    "/home/tomii/simenv/trilinos/packages/amesos/src/Amesos_NoCopiable.h"
    "/home/tomii/simenv/trilinos/packages/amesos/src/Amesos_Utils.h"
    "/home/tomii/simenv/trilinos/packages/amesos/src/Amesos_Time.h"
    "/home/tomii/simenv/trilinos/packages/amesos/src/Amesos_Control.h"
    "/home/tomii/simenv/trilinos/packages/amesos/src/Amesos_Support.h"
    "/home/tomii/simenv/trilinos/packages/amesos/src/Amesos_Status.h"
    "/home/tomii/simenv/trilinos/packages/amesos/src/Amesos_Scaling.h"
    "/home/tomii/simenv/trilinos/packages/amesos/src/Amesos_Reordering.h"
    "/home/tomii/simenv/trilinos/packages/amesos/src/Amesos_Lapack.h"
    "/home/tomii/simenv/trilinos/packages/amesos/src/Amesos_TestRowMatrix.h"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Amesos")

