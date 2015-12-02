# Install script for directory: /home/tomii/simenv/trilinos/packages/zoltan/src

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

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Zoltan")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/home/tomii/simenv/trilinos/build/packages/zoltan/src/libzoltan.a")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Zoltan")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Zoltan")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE FILES
    "/home/tomii/simenv/trilinos/build/packages/zoltan/src/Zoltan_config.h"
    "/home/tomii/simenv/trilinos/packages/zoltan/src/include/lbi_const.h"
    "/home/tomii/simenv/trilinos/packages/zoltan/src/include/zoltan_align.h"
    "/home/tomii/simenv/trilinos/packages/zoltan/src/include/zoltan_cpp.h"
    "/home/tomii/simenv/trilinos/packages/zoltan/src/include/zoltan.h"
    "/home/tomii/simenv/trilinos/packages/zoltan/src/include/zoltan_types.h"
    "/home/tomii/simenv/trilinos/packages/zoltan/src/include/zoltan_comm.h"
    "/home/tomii/simenv/trilinos/packages/zoltan/src/include/zoltan_comm_cpp.h"
    "/home/tomii/simenv/trilinos/packages/zoltan/src/include/zoltan_timer_cpp.h"
    "/home/tomii/simenv/trilinos/packages/zoltan/src/include/zoltan_timer.h"
    "/home/tomii/simenv/trilinos/packages/zoltan/src/include/zoltan_dd.h"
    "/home/tomii/simenv/trilinos/packages/zoltan/src/include/zoltan_dd_cpp.h"
    "/home/tomii/simenv/trilinos/packages/zoltan/src/include/zoltan_mem.h"
    "/home/tomii/simenv/trilinos/packages/zoltan/src/include/zoltan_eval.h"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Zoltan")

