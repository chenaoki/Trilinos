# Install script for directory: /home/tomii/simenv/trilinos/packages/tpetra/kernels/src

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

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "TpetraKernels")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/home/tomii/simenv/trilinos/build/packages/tpetra/kernels/src/libtpetrakernels.a")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "TpetraKernels")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "TpetraKernels")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE FILES
    "/home/tomii/simenv/trilinos/packages/tpetra/kernels/src/Kokkos_Sparse_trsv.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/kernels/src/Kokkos_Sparse_CrsMatrix.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/kernels/src/Kokkos_Sparse_MV.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/kernels/src/Kokkos_CrsMatrix_CuSparse.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/kernels/src/Kokkos_CrsMatrix.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/kernels/src/Kokkos_MV.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/kernels/src/Kokkos_Sparse.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/kernels/src/Kokkos_InnerProductSpaceTraits.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/kernels/src/Kokkos_Blas1_MV.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/kernels/src/Kokkos_Blas1.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/kernels/src/Kokkos_ArithTraits.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/kernels/src/Kokkos_CrsMatrix_MKL.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/kernels/src/impl/Kokkos_Blas1_MV_impl_update.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/kernels/src/impl/Kokkos_Blas1_MV_impl_recip.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/kernels/src/impl/Kokkos_Blas1_MV_impl_nrmInf.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/kernels/src/impl/Kokkos_Blas1_MV_impl_dot.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/kernels/src/impl/Kokkos_Blas1_MV_impl_nrm2w.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/kernels/src/impl/Kokkos_Blas1_impl.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/kernels/src/impl/Kokkos_Blas1_MV_impl_nrm2.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/kernels/src/impl/Kokkos_Sparse_impl_add.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/kernels/src/impl/Kokkos_Sparse_impl_trsm.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/kernels/src/impl/Kokkos_Sparse_impl_sor.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/kernels/src/impl/Kokkos_Sparse_impl_spmv.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/kernels/src/impl/Kokkos_Blas1_MV_impl_fill.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/kernels/src/impl/Kokkos_Blas1_MV_impl_scal.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/kernels/src/impl/Kokkos_Blas1_MV_impl_axpby.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/kernels/src/impl/Kokkos_Blas1_MV_impl_sum.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/kernels/src/impl/Kokkos_Blas1_MV_impl_mult.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/kernels/src/impl/Kokkos_Blas1_MV_impl_nrm1.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/kernels/src/impl/Kokkos_Blas1_MV_impl_abs.hpp"
    "/home/tomii/simenv/trilinos/build/packages/tpetra/kernels/src/TpetraKernels_config.h"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "TpetraKernels")

