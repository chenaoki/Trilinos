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
# CMake variable for use by Trilinos/ThyraCore clients.
#
# Do not edit: This file was generated automatically by CMake.
#
##############################################################################


# Include guard
IF (ThyraCore_CONFIG_INCLUDED)
  RETURN()
ENDIF()
SET(ThyraCore_CONFIG_INCLUDED TRUE)

# Make sure CMAKE_CURRENT_LIST_DIR is usable
IF (NOT DEFINED CMAKE_CURRENT_LIST_DIR)
  GET_FILENAME_COMPONENT(_THIS_SCRIPT_PATH ${CMAKE_CURRENT_LIST_FILE} PATH)
  SET(CMAKE_CURRENT_LIST_DIR ${_THIS_SCRIPT_PATH})
ENDIF()


## ---------------------------------------------------------------------------
## Compilers used by Trilinos/ThyraCore build
## ---------------------------------------------------------------------------

SET(ThyraCore_CXX_COMPILER "/usr/bin/mpicxx")

SET(ThyraCore_C_COMPILER "/usr/bin/mpicc")

SET(ThyraCore_FORTRAN_COMPILER "/usr/bin/mpif90")


## ---------------------------------------------------------------------------
## Compiler flags used by Trilinos/ThyraCore build
## ---------------------------------------------------------------------------

## Set compiler flags, including those determined by build type
SET(ThyraCore_CXX_FLAGS " -std=c++11 -O3")

SET(ThyraCore_C_FLAGS " -O3")

SET(ThyraCore_FORTRAN_FLAGS " -O3")

## Extra link flags (e.g., specification of fortran libraries)
SET(ThyraCore_EXTRA_LD_FLAGS "-lpthread")

## This is the command-line entry used for setting rpaths. In a build
## with static libraries it will be empty.
SET(ThyraCore_SHARED_LIB_RPATH_COMMAND "")
SET(ThyraCore_BUILD_SHARED_LIBS "OFF")

SET(ThyraCore_LINKER /usr/bin/ld)
SET(ThyraCore_AR /usr/bin/ar)

## ---------------------------------------------------------------------------
## Set library specifications and paths
## ---------------------------------------------------------------------------

## List of package include dirs
SET(ThyraCore_INCLUDE_DIRS "/home/tomii/simenv/trilinos/build;/home/tomii/simenv/trilinos/packages/thyra/core/src;/home/tomii/simenv/trilinos/packages/thyra/core/src/interfaces/operator_vector/fundamental;/home/tomii/simenv/trilinos/packages/thyra/core/src/interfaces/operator_vector/extended;/home/tomii/simenv/trilinos/packages/thyra/core/src/support/operator_vector/client_support;/home/tomii/simenv/trilinos/packages/thyra/core/src/support/operator_vector/adapter_support;/home/tomii/simenv/trilinos/packages/thyra/core/src/interfaces/operator_solve/fundamental;/home/tomii/simenv/trilinos/packages/thyra/core/src/interfaces/operator_solve/extended;/home/tomii/simenv/trilinos/packages/thyra/core/src/support/operator_solve/client_support;/home/tomii/simenv/trilinos/packages/thyra/core/src/interfaces/nonlinear/model_evaluator/fundamental;/home/tomii/simenv/trilinos/packages/thyra/core/src/support/nonlinear/model_evaluator/client_support;/home/tomii/simenv/trilinos/packages/thyra/core/src/interfaces/nonlinear/solvers/fundamental;/home/tomii/simenv/trilinos/packages/thyra/core/src/support/nonlinear/solvers/client_support;/home/tomii/simenv/trilinos/build/packages/thyra/core/src;/home/tomii/simenv/trilinos/packages/thyra/core/example/operator_vector;/home/tomii/simenv/trilinos/packages/rtop/src;/home/tomii/simenv/trilinos/packages/rtop/src/interfaces;/home/tomii/simenv/trilinos/packages/rtop/src/support;/home/tomii/simenv/trilinos/packages/rtop/src/ops_lib;/home/tomii/simenv/trilinos/packages/rtop/src/lapack;/home/tomii/simenv/trilinos/build/packages/rtop/src;/home/tomii/simenv/trilinos/build/packages/teuchos/kokkoscomm/src;/home/tomii/simenv/trilinos/packages/teuchos/kokkoscomm/src;/home/tomii/simenv/trilinos/build/packages/teuchos/kokkoscompat/src;/home/tomii/simenv/trilinos/packages/teuchos/kokkoscompat/src;/home/tomii/simenv/trilinos/packages/teuchos/parameterlist/src;/home/tomii/simenv/trilinos/build/packages/teuchos/core/src;/home/tomii/simenv/trilinos/packages/teuchos/core/src;/home/tomii/simenv/trilinos/build/packages/kokkos/core/src;/home/tomii/simenv/trilinos/packages/kokkos/core/src;/home/tomii/simenv/trilinos/packages/teuchos/comm/src;/home/tomii/simenv/trilinos/packages/teuchos/remainder/src;/home/tomii/simenv/trilinos/build/packages/teuchos/remainder/src;/home/tomii/simenv/trilinos/packages/teuchos/numerics/src;/usr/include")

## List of package library paths
SET(ThyraCore_LIBRARY_DIRS "/home/tomii/simenv/trilinos/build/packages/thyra/core/src;/home/tomii/simenv/trilinos/build/packages/rtop/src;/home/tomii/simenv/trilinos/build/packages/teuchos/kokkoscomm/src;/home/tomii/simenv/trilinos/build/packages/teuchos/kokkoscompat/src;/home/tomii/simenv/trilinos/build/packages/teuchos/parameterlist/src;/home/tomii/simenv/trilinos/build/packages/teuchos/core/src;/home/tomii/simenv/trilinos/build/packages/kokkos/core/src;/home/tomii/simenv/trilinos/build/packages/teuchos/comm/src;/home/tomii/simenv/trilinos/build/packages/teuchos/remainder/src;/home/tomii/simenv/trilinos/build/packages/teuchos/numerics/src")

## List of package libraries
SET(ThyraCore_LIBRARIES "thyracore;rtop;teuchoskokkoscomm;teuchoskokkoscompat;teuchosremainder;teuchosnumerics;teuchoscomm;teuchosparameterlist;teuchoscore;kokkoscore")

## Specification of directories for TPL headers
SET(ThyraCore_TPL_INCLUDE_DIRS "/usr/include;/usr/include")

## Specification of directories for TPL libraries
SET(ThyraCore_TPL_LIBRARY_DIRS "")

## List of required TPLs
SET(ThyraCore_TPL_LIBRARIES "/usr/lib/liblapack.so;/usr/lib/libblas.so")

## ---------------------------------------------------------------------------
## MPI specific variables
##   These variables are provided to make it easier to get the mpi libraries
##   and includes on systems that do not use the mpi wrappers for compiling
## ---------------------------------------------------------------------------

SET(ThyraCore_MPI_LIBRARIES "")
SET(ThyraCore_MPI_LIBRARY_DIRS "")
SET(ThyraCore_MPI_INCLUDE_DIRS "")
SET(ThyraCore_MPI_EXEC "/usr/bin/mpiexec")
SET(ThyraCore_MPI_EXEC_MAX_NUMPROCS "4")
SET(ThyraCore_MPI_EXEC_NUMPROCS_FLAG "-np")

## ---------------------------------------------------------------------------
## Set useful general variables
## ---------------------------------------------------------------------------

## The packages enabled for this project
SET(ThyraCore_PACKAGE_LIST "ThyraCore;RTOp;Teuchos;TeuchosKokkosComm;TeuchosKokkosCompat;TeuchosRemainder;TeuchosNumerics;TeuchosComm;TeuchosParameterList;TeuchosCore;KokkosCore")

## The TPLs enabled for this project
SET(ThyraCore_TPL_LIST "LAPACK;BLAS;MPI;Pthread")


INCLUDE("/home/tomii/simenv/trilinos/build/packages/rtop/RTOpConfig.cmake")
INCLUDE("/home/tomii/simenv/trilinos/build/packages/teuchos/TeuchosConfig.cmake")
INCLUDE("/home/tomii/simenv/trilinos/build/packages/teuchos/kokkoscomm/TeuchosKokkosCommConfig.cmake")
INCLUDE("/home/tomii/simenv/trilinos/build/packages/teuchos/kokkoscompat/TeuchosKokkosCompatConfig.cmake")
INCLUDE("/home/tomii/simenv/trilinos/build/packages/teuchos/remainder/TeuchosRemainderConfig.cmake")
INCLUDE("/home/tomii/simenv/trilinos/build/packages/teuchos/numerics/TeuchosNumericsConfig.cmake")
INCLUDE("/home/tomii/simenv/trilinos/build/packages/teuchos/comm/TeuchosCommConfig.cmake")
INCLUDE("/home/tomii/simenv/trilinos/build/packages/teuchos/parameterlist/TeuchosParameterListConfig.cmake")
INCLUDE("/home/tomii/simenv/trilinos/build/packages/teuchos/core/TeuchosCoreConfig.cmake")
INCLUDE("/home/tomii/simenv/trilinos/build/packages/kokkos/core/KokkosCoreConfig.cmake")
