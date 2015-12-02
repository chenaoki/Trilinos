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
# CMake variable for use by Trilinos/TpetraKernels clients.
#
# Do not edit: This file was generated automatically by CMake.
#
##############################################################################


# Include guard
IF (TpetraKernels_CONFIG_INCLUDED)
  RETURN()
ENDIF()
SET(TpetraKernels_CONFIG_INCLUDED TRUE)

# Make sure CMAKE_CURRENT_LIST_DIR is usable
IF (NOT DEFINED CMAKE_CURRENT_LIST_DIR)
  GET_FILENAME_COMPONENT(_THIS_SCRIPT_PATH ${CMAKE_CURRENT_LIST_FILE} PATH)
  SET(CMAKE_CURRENT_LIST_DIR ${_THIS_SCRIPT_PATH})
ENDIF()


## ---------------------------------------------------------------------------
## Compilers used by Trilinos/TpetraKernels build
## ---------------------------------------------------------------------------

SET(TpetraKernels_CXX_COMPILER "/usr/bin/mpicxx")

SET(TpetraKernels_C_COMPILER "/usr/bin/mpicc")

SET(TpetraKernels_FORTRAN_COMPILER "/usr/bin/mpif90")


## ---------------------------------------------------------------------------
## Compiler flags used by Trilinos/TpetraKernels build
## ---------------------------------------------------------------------------

## Set compiler flags, including those determined by build type
SET(TpetraKernels_CXX_FLAGS " -std=c++11 -O3")

SET(TpetraKernels_C_FLAGS " -O3")

SET(TpetraKernels_FORTRAN_FLAGS " -O3")

## Extra link flags (e.g., specification of fortran libraries)
SET(TpetraKernels_EXTRA_LD_FLAGS "-lpthread")

## This is the command-line entry used for setting rpaths. In a build
## with static libraries it will be empty.
SET(TpetraKernels_SHARED_LIB_RPATH_COMMAND "")
SET(TpetraKernels_BUILD_SHARED_LIBS "OFF")

SET(TpetraKernels_LINKER /usr/bin/ld)
SET(TpetraKernels_AR /usr/bin/ar)

## ---------------------------------------------------------------------------
## Set library specifications and paths
## ---------------------------------------------------------------------------

## List of package include dirs
SET(TpetraKernels_INCLUDE_DIRS "/home/tomii/simenv/trilinos/build;/home/tomii/simenv/trilinos/build/packages/tpetra/kernels/src;/home/tomii/simenv/trilinos/packages/tpetra/kernels/src;/home/tomii/simenv/trilinos/packages/tpetra/kernels/src/impl;/home/tomii/simenv/trilinos/packages/teuchos/comm/src;/home/tomii/simenv/trilinos/packages/teuchos/parameterlist/src;/home/tomii/simenv/trilinos/build/packages/teuchos/core/src;/home/tomii/simenv/trilinos/packages/teuchos/core/src;/home/tomii/simenv/trilinos/build/packages/kokkos/core/src;/home/tomii/simenv/trilinos/packages/kokkos/core/src;/home/tomii/simenv/trilinos/build/packages/kokkos/containers/src;/home/tomii/simenv/trilinos/packages/kokkos/containers/src")

## List of package library paths
SET(TpetraKernels_LIBRARY_DIRS "/home/tomii/simenv/trilinos/build/packages/tpetra/kernels/src;/home/tomii/simenv/trilinos/build/packages/teuchos/comm/src;/home/tomii/simenv/trilinos/build/packages/teuchos/parameterlist/src;/home/tomii/simenv/trilinos/build/packages/teuchos/core/src;/home/tomii/simenv/trilinos/build/packages/kokkos/core/src;/home/tomii/simenv/trilinos/build/packages/kokkos/containers/src")

## List of package libraries
SET(TpetraKernels_LIBRARIES "tpetrakernels;teuchoscomm;teuchosparameterlist;teuchoscore;kokkoscontainers;kokkoscore")

## Specification of directories for TPL headers
SET(TpetraKernels_TPL_INCLUDE_DIRS "")

## Specification of directories for TPL libraries
SET(TpetraKernels_TPL_LIBRARY_DIRS "")

## List of required TPLs
SET(TpetraKernels_TPL_LIBRARIES "")

## ---------------------------------------------------------------------------
## MPI specific variables
##   These variables are provided to make it easier to get the mpi libraries
##   and includes on systems that do not use the mpi wrappers for compiling
## ---------------------------------------------------------------------------

SET(TpetraKernels_MPI_LIBRARIES "")
SET(TpetraKernels_MPI_LIBRARY_DIRS "")
SET(TpetraKernels_MPI_INCLUDE_DIRS "")
SET(TpetraKernels_MPI_EXEC "/usr/bin/mpiexec")
SET(TpetraKernels_MPI_EXEC_MAX_NUMPROCS "4")
SET(TpetraKernels_MPI_EXEC_NUMPROCS_FLAG "-np")

## ---------------------------------------------------------------------------
## Set useful general variables
## ---------------------------------------------------------------------------

## The packages enabled for this project
SET(TpetraKernels_PACKAGE_LIST "TpetraKernels;TeuchosComm;TeuchosParameterList;TeuchosCore;KokkosContainers;KokkosCore")

## The TPLs enabled for this project
SET(TpetraKernels_TPL_LIST "MPI;Pthread")


INCLUDE("/home/tomii/simenv/trilinos/build/packages/teuchos/comm/TeuchosCommConfig.cmake")
INCLUDE("/home/tomii/simenv/trilinos/build/packages/teuchos/parameterlist/TeuchosParameterListConfig.cmake")
INCLUDE("/home/tomii/simenv/trilinos/build/packages/teuchos/core/TeuchosCoreConfig.cmake")
INCLUDE("/home/tomii/simenv/trilinos/build/packages/kokkos/containers/KokkosContainersConfig.cmake")
INCLUDE("/home/tomii/simenv/trilinos/build/packages/kokkos/core/KokkosCoreConfig.cmake")
