# Install script for directory: /home/tomii/simenv/trilinos/packages/kokkos/containers/src

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

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/../install/include/impl" TYPE FILE FILES
    "/home/tomii/simenv/trilinos/packages/kokkos/containers/src/impl/Kokkos_Bitset_impl.hpp"
    "/home/tomii/simenv/trilinos/packages/kokkos/containers/src/impl/Kokkos_Functional_impl.hpp"
    "/home/tomii/simenv/trilinos/packages/kokkos/containers/src/impl/Kokkos_StaticCrsGraph_factory.hpp"
    "/home/tomii/simenv/trilinos/packages/kokkos/containers/src/impl/Kokkos_UnorderedMap_impl.hpp"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "KokkosContainers")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/home/tomii/simenv/trilinos/build/packages/kokkos/containers/src/libkokkoscontainers.a")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "KokkosContainers")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "KokkosContainers")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE FILES
    "/home/tomii/simenv/trilinos/packages/kokkos/containers/src/Kokkos_StaticCrsGraph.hpp"
    "/home/tomii/simenv/trilinos/packages/kokkos/containers/src/Kokkos_Bitset.hpp"
    "/home/tomii/simenv/trilinos/packages/kokkos/containers/src/Kokkos_SegmentedView.hpp"
    "/home/tomii/simenv/trilinos/packages/kokkos/containers/src/Kokkos_Vector.hpp"
    "/home/tomii/simenv/trilinos/packages/kokkos/containers/src/Kokkos_Functional.hpp"
    "/home/tomii/simenv/trilinos/packages/kokkos/containers/src/Kokkos_DualView.hpp"
    "/home/tomii/simenv/trilinos/packages/kokkos/containers/src/Kokkos_UnorderedMap.hpp"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "KokkosContainers")

