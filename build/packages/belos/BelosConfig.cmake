# @HEADER
# ************************************************************************
#
#            TriBITS: Tribal Build, Integrate, and Test System
#                    Copyright 2013 Sandia Corporation
#
#
# Under the terms of Contract DE-AC04-94AL85000 with Sandia Corporation,
# the U.S. Government retains certain rights in this software.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are
# met:
#
# 1. Redistributions of source code must retain the above copyright
# notice, this list of conditions and the following disclaimer.
#
# 2. Redistributions in binary form must reproduce the above copyright
# notice, this list of conditions and the following disclaimer in the
# documentation and/or other materials provided with the distribution.
#
# 3. Neither the name of the Corporation nor the names of the
# contributors may be used to endorse or promote products derived from
# this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY SANDIA CORPORATION "AS IS" AND ANY
# EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
# PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL SANDIA CORPORATION OR THE
# CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
# EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
# PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
# LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
# NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
# SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
# ************************************************************************
# @HEADER

##############################################################################
#
# CMake variable for use by Trilinos/Belos clients.
#
# Do not edit: This file was generated automatically by CMake.
#
##############################################################################


# Include guard
IF (Belos_CONFIG_INCLUDED)
  RETURN()
ENDIF()
SET(Belos_CONFIG_INCLUDED TRUE)

# Make sure CMAKE_CURRENT_LIST_DIR is usable
IF (NOT DEFINED CMAKE_CURRENT_LIST_DIR)
  GET_FILENAME_COMPONENT(_THIS_SCRIPT_PATH ${CMAKE_CURRENT_LIST_FILE} PATH)
  SET(CMAKE_CURRENT_LIST_DIR ${_THIS_SCRIPT_PATH})
ENDIF()


## ---------------------------------------------------------------------------
## Compilers used by Trilinos/Belos build
## ---------------------------------------------------------------------------

SET(Belos_CXX_COMPILER "/usr/bin/mpicxx")

SET(Belos_C_COMPILER "/usr/bin/mpicc")

SET(Belos_FORTRAN_COMPILER "/usr/bin/mpif90")


## ---------------------------------------------------------------------------
## Compiler flags used by Trilinos/Belos build
## ---------------------------------------------------------------------------

## Set compiler flags, including those determined by build type
SET(Belos_CXX_FLAGS " -std=c++11 -O3")

SET(Belos_C_FLAGS " -O3")

SET(Belos_FORTRAN_FLAGS " -O3")

## Extra link flags (e.g., specification of fortran libraries)
SET(Belos_EXTRA_LD_FLAGS "-lpthread")

## This is the command-line entry used for setting rpaths. In a build
## with static libraries it will be empty.
SET(Belos_SHARED_LIB_RPATH_COMMAND "")
SET(Belos_BUILD_SHARED_LIBS "OFF")

SET(Belos_LINKER /usr/bin/ld)
SET(Belos_AR /usr/bin/ar)

## ---------------------------------------------------------------------------
## Set library specifications and paths
## ---------------------------------------------------------------------------

## List of package include dirs
SET(Belos_INCLUDE_DIRS "/home/tomii/simenv/trilinos/build;/home/tomii/simenv/trilinos/build/packages/belos/tpetra/src;/home/tomii/simenv/trilinos/packages/belos/tpetra/src;/home/tomii/simenv/trilinos/build/packages/belos/epetra/src;/home/tomii/simenv/trilinos/packages/belos/epetra/src;/home/tomii/simenv/trilinos/build/packages/belos/src;/home/tomii/simenv/trilinos/packages/belos/src;/home/tomii/simenv/trilinos/packages/tpetra/core/ext;/home/tomii/simenv/trilinos/build/packages/tpetra/core/ext;/home/tomii/simenv/trilinos/packages/tpetra/core/inout;/home/tomii/simenv/trilinos/build/packages/tpetra/core/inout;/home/tomii/simenv/trilinos/packages/tpetra/core/src;/home/tomii/simenv/trilinos/packages/tpetra/core/src/kokkos_refactor;/home/tomii/simenv/trilinos/build/packages/tpetra/core/src;/home/tomii/simenv/trilinos/packages/tpetra/tsqr/src;/home/tomii/simenv/trilinos/build/packages/tpetra/tsqr/src;/home/tomii/simenv/trilinos/packages/tpetra/classic/LinAlg;/home/tomii/simenv/trilinos/packages/tpetra/classic/NodeAPI;/home/tomii/simenv/trilinos/build/packages/tpetra/classic/NodeAPI;/home/tomii/simenv/trilinos/build/packages/tpetra/classic/src;/home/tomii/simenv/trilinos/packages/tpetra/classic/src;/home/tomii/simenv/trilinos/build/packages/teuchos/kokkoscomm/src;/home/tomii/simenv/trilinos/packages/teuchos/kokkoscomm/src;/home/tomii/simenv/trilinos/build/packages/teuchos/kokkoscompat/src;/home/tomii/simenv/trilinos/packages/teuchos/kokkoscompat/src;/home/tomii/simenv/trilinos/packages/teuchos/parameterlist/src;/home/tomii/simenv/trilinos/build/packages/teuchos/core/src;/home/tomii/simenv/trilinos/packages/teuchos/core/src;/home/tomii/simenv/trilinos/build/packages/kokkos/core/src;/home/tomii/simenv/trilinos/packages/kokkos/core/src;/home/tomii/simenv/trilinos/packages/teuchos/comm/src;/home/tomii/simenv/trilinos/packages/teuchos/remainder/src;/home/tomii/simenv/trilinos/build/packages/teuchos/remainder/src;/home/tomii/simenv/trilinos/packages/teuchos/numerics/src;/usr/include;/home/tomii/simenv/trilinos/build/packages/tpetra/kernels/src;/home/tomii/simenv/trilinos/packages/tpetra/kernels/src;/home/tomii/simenv/trilinos/packages/tpetra/kernels/src/impl;/home/tomii/simenv/trilinos/build/packages/kokkos/containers/src;/home/tomii/simenv/trilinos/packages/kokkos/containers/src;/home/tomii/simenv/trilinos/build/packages/epetra/src;/home/tomii/simenv/trilinos/packages/epetra/src;/home/tomii/simenv/trilinos/build/packages/kokkos/algorithms/src;/home/tomii/simenv/trilinos/packages/kokkos/algorithms/src")

## List of package library paths
SET(Belos_LIBRARY_DIRS "/home/tomii/simenv/trilinos/build/packages/belos/tpetra/src;/home/tomii/simenv/trilinos/build/packages/belos/epetra/src;/home/tomii/simenv/trilinos/build/packages/belos/src;/home/tomii/simenv/trilinos/build/packages/tpetra/core/ext;/home/tomii/simenv/trilinos/build/packages/tpetra/core/inout;/home/tomii/simenv/trilinos/build/packages/tpetra/core/src;/home/tomii/simenv/trilinos/build/packages/tpetra/tsqr/src;/home/tomii/simenv/trilinos/build/packages/tpetra/classic/LinAlg;/home/tomii/simenv/trilinos/build/packages/tpetra/classic/NodeAPI;/home/tomii/simenv/trilinos/build/packages/tpetra/classic/src;/home/tomii/simenv/trilinos/build/packages/teuchos/kokkoscomm/src;/home/tomii/simenv/trilinos/build/packages/teuchos/kokkoscompat/src;/home/tomii/simenv/trilinos/build/packages/teuchos/parameterlist/src;/home/tomii/simenv/trilinos/build/packages/teuchos/core/src;/home/tomii/simenv/trilinos/build/packages/kokkos/core/src;/home/tomii/simenv/trilinos/build/packages/teuchos/comm/src;/home/tomii/simenv/trilinos/build/packages/teuchos/remainder/src;/home/tomii/simenv/trilinos/build/packages/teuchos/numerics/src;/home/tomii/simenv/trilinos/build/packages/tpetra/kernels/src;/home/tomii/simenv/trilinos/build/packages/kokkos/containers/src;/home/tomii/simenv/trilinos/build/packages/epetra/src;/home/tomii/simenv/trilinos/build/packages/kokkos/algorithms/src")

## List of package libraries
SET(Belos_LIBRARIES "belostpetra;belosepetra;belos;tpetraext;tpetrainout;tpetra;kokkostsqr;tpetrakernels;tpetraclassiclinalg;tpetraclassicnodeapi;tpetraclassic;epetra;teuchoskokkoscomm;teuchoskokkoscompat;teuchosremainder;teuchosnumerics;teuchoscomm;teuchosparameterlist;teuchoscore;kokkosalgorithms;kokkoscontainers;kokkoscore")

## Specification of directories for TPL headers
SET(Belos_TPL_INCLUDE_DIRS "/usr/include;/usr/include")

## Specification of directories for TPL libraries
SET(Belos_TPL_LIBRARY_DIRS "")

## List of required TPLs
SET(Belos_TPL_LIBRARIES "/usr/lib/liblapack.so;/usr/lib/libblas.so")

## ---------------------------------------------------------------------------
## MPI specific variables
##   These variables are provided to make it easier to get the mpi libraries
##   and includes on systems that do not use the mpi wrappers for compiling
## ---------------------------------------------------------------------------

SET(Belos_MPI_LIBRARIES "")
SET(Belos_MPI_LIBRARY_DIRS "")
SET(Belos_MPI_INCLUDE_DIRS "")
SET(Belos_MPI_EXEC "/usr/bin/mpiexec")
SET(Belos_MPI_EXEC_MAX_NUMPROCS "4")
SET(Belos_MPI_EXEC_NUMPROCS_FLAG "-np")

## ---------------------------------------------------------------------------
## Set useful general variables
## ---------------------------------------------------------------------------

## The packages enabled for this project
SET(Belos_PACKAGE_LIST "Belos;Tpetra;TpetraCore;TpetraTSQR;TpetraKernels;TpetraClassic;Epetra;Teuchos;TeuchosKokkosComm;TeuchosKokkosCompat;TeuchosRemainder;TeuchosNumerics;TeuchosComm;TeuchosParameterList;TeuchosCore;KokkosAlgorithms;KokkosContainers;KokkosCore")

## The TPLs enabled for this project
SET(Belos_TPL_LIST "LAPACK;BLAS;MPI;Pthread")


INCLUDE("/home/tomii/simenv/trilinos/build/packages/tpetra/TpetraConfig.cmake")
INCLUDE("/home/tomii/simenv/trilinos/build/packages/tpetra/core/TpetraCoreConfig.cmake")
INCLUDE("/home/tomii/simenv/trilinos/build/packages/tpetra/tsqr/TpetraTSQRConfig.cmake")
INCLUDE("/home/tomii/simenv/trilinos/build/packages/tpetra/kernels/TpetraKernelsConfig.cmake")
INCLUDE("/home/tomii/simenv/trilinos/build/packages/tpetra/classic/TpetraClassicConfig.cmake")
INCLUDE("/home/tomii/simenv/trilinos/build/packages/epetra/EpetraConfig.cmake")
INCLUDE("/home/tomii/simenv/trilinos/build/packages/teuchos/TeuchosConfig.cmake")
INCLUDE("/home/tomii/simenv/trilinos/build/packages/teuchos/kokkoscomm/TeuchosKokkosCommConfig.cmake")
INCLUDE("/home/tomii/simenv/trilinos/build/packages/teuchos/kokkoscompat/TeuchosKokkosCompatConfig.cmake")
INCLUDE("/home/tomii/simenv/trilinos/build/packages/teuchos/remainder/TeuchosRemainderConfig.cmake")
INCLUDE("/home/tomii/simenv/trilinos/build/packages/teuchos/numerics/TeuchosNumericsConfig.cmake")
INCLUDE("/home/tomii/simenv/trilinos/build/packages/teuchos/comm/TeuchosCommConfig.cmake")
INCLUDE("/home/tomii/simenv/trilinos/build/packages/teuchos/parameterlist/TeuchosParameterListConfig.cmake")
INCLUDE("/home/tomii/simenv/trilinos/build/packages/teuchos/core/TeuchosCoreConfig.cmake")
INCLUDE("/home/tomii/simenv/trilinos/build/packages/kokkos/algorithms/KokkosAlgorithmsConfig.cmake")
INCLUDE("/home/tomii/simenv/trilinos/build/packages/kokkos/containers/KokkosContainersConfig.cmake")
INCLUDE("/home/tomii/simenv/trilinos/build/packages/kokkos/core/KokkosCoreConfig.cmake")
# Import Belos targets
INCLUDE("/home/tomii/simenv/trilinos/build/TrilinosTargets.cmake")
