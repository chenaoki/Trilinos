# Install script for directory: /home/tomii/simenv/trilinos

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

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Trilinos")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE FILES "/home/tomii/simenv/trilinos/build/./Trilinos_version.h")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Trilinos")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/Trilinos" TYPE FILE RENAME "TrilinosConfig.cmake" FILES "/home/tomii/simenv/trilinos/build/TrilinosConfig_install.cmake")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE RENAME "Makefile.export.Trilinos" FILES "/home/tomii/simenv/trilinos/build/Makefile.export.Trilinos_install")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/Trilinos" TYPE FILE FILES "/home/tomii/simenv/trilinos/build/TrilinosConfigVersion.cmake")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE FILES "/home/tomii/simenv/trilinos/build/TrilinosConfig.cmake")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  INCLUDE("/home/tomii/simenv/trilinos/build/commonTools/gtest/cmake_install.cmake")
  INCLUDE("/home/tomii/simenv/trilinos/build/packages/ThreadPool/cmake_install.cmake")
  INCLUDE("/home/tomii/simenv/trilinos/build/packages/kokkos/cmake_install.cmake")
  INCLUDE("/home/tomii/simenv/trilinos/build/packages/teuchos/cmake_install.cmake")
  INCLUDE("/home/tomii/simenv/trilinos/build/packages/rtop/cmake_install.cmake")
  INCLUDE("/home/tomii/simenv/trilinos/build/packages/epetra/cmake_install.cmake")
  INCLUDE("/home/tomii/simenv/trilinos/build/packages/zoltan/cmake_install.cmake")
  INCLUDE("/home/tomii/simenv/trilinos/build/packages/triutils/cmake_install.cmake")
  INCLUDE("/home/tomii/simenv/trilinos/build/packages/tpetra/cmake_install.cmake")
  INCLUDE("/home/tomii/simenv/trilinos/build/packages/epetraext/cmake_install.cmake")
  INCLUDE("/home/tomii/simenv/trilinos/build/packages/thyra/cmake_install.cmake")
  INCLUDE("/home/tomii/simenv/trilinos/build/packages/aztecoo/cmake_install.cmake")
  INCLUDE("/home/tomii/simenv/trilinos/build/packages/amesos/cmake_install.cmake")
  INCLUDE("/home/tomii/simenv/trilinos/build/packages/ifpack/cmake_install.cmake")
  INCLUDE("/home/tomii/simenv/trilinos/build/packages/ml/cmake_install.cmake")
  INCLUDE("/home/tomii/simenv/trilinos/build/packages/belos/cmake_install.cmake")
  INCLUDE("/home/tomii/simenv/trilinos/build/packages/anasazi/cmake_install.cmake")

ENDIF(NOT CMAKE_INSTALL_LOCAL_ONLY)

IF(CMAKE_INSTALL_COMPONENT)
  SET(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
ELSE(CMAKE_INSTALL_COMPONENT)
  SET(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
ENDIF(CMAKE_INSTALL_COMPONENT)

FILE(WRITE "/home/tomii/simenv/trilinos/build/${CMAKE_INSTALL_MANIFEST}" "")
FOREACH(file ${CMAKE_INSTALL_MANIFEST_FILES})
  FILE(APPEND "/home/tomii/simenv/trilinos/build/${CMAKE_INSTALL_MANIFEST}" "${file}\n")
ENDFOREACH(file)
