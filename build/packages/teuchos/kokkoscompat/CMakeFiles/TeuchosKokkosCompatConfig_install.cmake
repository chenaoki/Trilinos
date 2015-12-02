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
# CMake variable for use by Trilinos/TeuchosKokkosCompat clients.
#
# Do not edit: This file was generated automatically by CMake.
#
##############################################################################


# Include guard
IF (TeuchosKokkosCompat_CONFIG_INCLUDED)
  RETURN()
ENDIF()
SET(TeuchosKokkosCompat_CONFIG_INCLUDED TRUE)

# Make sure CMAKE_CURRENT_LIST_DIR is usable
IF (NOT DEFINED CMAKE_CURRENT_LIST_DIR)
  GET_FILENAME_COMPONENT(_THIS_SCRIPT_PATH ${CMAKE_CURRENT_LIST_FILE} PATH)
  SET(CMAKE_CURRENT_LIST_DIR ${_THIS_SCRIPT_PATH})
ENDIF()


## ---------------------------------------------------------------------------
## Compilers used by Trilinos/TeuchosKokkosCompat build
## ---------------------------------------------------------------------------

SET(TeuchosKokkosCompat_CXX_COMPILER "/usr/bin/mpicxx")

SET(TeuchosKokkosCompat_C_COMPILER "/usr/bin/mpicc")

SET(TeuchosKokkosCompat_FORTRAN_COMPILER "/usr/bin/mpif90")


## ---------------------------------------------------------------------------
## Compiler flags used by Trilinos/TeuchosKokkosCompat build
## ---------------------------------------------------------------------------

## Set compiler flags, including those determined by build type
SET(TeuchosKokkosCompat_CXX_FLAGS " -std=c++11 -O3")

SET(TeuchosKokkosCompat_C_FLAGS " -O3")

SET(TeuchosKokkosCompat_FORTRAN_FLAGS " -O3")

## Extra link flags (e.g., specification of fortran libraries)
SET(TeuchosKokkosCompat_EXTRA_LD_FLAGS "-lpthread")

## This is the command-line entry used for setting rpaths. In a build
## with static libraries it will be empty.
SET(TeuchosKokkosCompat_SHARED_LIB_RPATH_COMMAND "")
SET(TeuchosKokkosCompat_BUILD_SHARED_LIBS "OFF")

SET(TeuchosKokkosCompat_LINKER /usr/bin/ld)
SET(TeuchosKokkosCompat_AR /usr/bin/ar)

## ---------------------------------------------------------------------------
## Set library specifications and paths
## ---------------------------------------------------------------------------

## List of package include dirs
SET(TeuchosKokkosCompat_INCLUDE_DIRS "${CMAKE_CURRENT_LIST_DIR}/../../../include")

## List of package library paths
SET(TeuchosKokkosCompat_LIBRARY_DIRS "${CMAKE_CURRENT_LIST_DIR}/../../../lib")

## List of package libraries
SET(TeuchosKokkosCompat_LIBRARIES "teuchoskokkoscompat;teuchosparameterlist;teuchoscore;kokkoscore")

## Specification of directories for TPL headers
SET(TeuchosKokkosCompat_TPL_INCLUDE_DIRS "")

## Specification of directories for TPL libraries
SET(TeuchosKokkosCompat_TPL_LIBRARY_DIRS "")

## List of required TPLs
SET(TeuchosKokkosCompat_TPL_LIBRARIES "")

## ---------------------------------------------------------------------------
## MPI specific variables
##   These variables are provided to make it easier to get the mpi libraries
##   and includes on systems that do not use the mpi wrappers for compiling
## ---------------------------------------------------------------------------

SET(TeuchosKokkosCompat_MPI_LIBRARIES "")
SET(TeuchosKokkosCompat_MPI_LIBRARY_DIRS "")
SET(TeuchosKokkosCompat_MPI_INCLUDE_DIRS "")
SET(TeuchosKokkosCompat_MPI_EXEC "/usr/bin/mpiexec")
SET(TeuchosKokkosCompat_MPI_EXEC_MAX_NUMPROCS "4")
SET(TeuchosKokkosCompat_MPI_EXEC_NUMPROCS_FLAG "-np")

## ---------------------------------------------------------------------------
## Set useful general variables
## ---------------------------------------------------------------------------

## The packages enabled for this project
SET(TeuchosKokkosCompat_PACKAGE_LIST "TeuchosKokkosCompat;TeuchosParameterList;TeuchosCore;KokkosCore")

## The TPLs enabled for this project
SET(TeuchosKokkosCompat_TPL_LIST "MPI;Pthread")


# Include configuration of dependent packages
INCLUDE("${CMAKE_CURRENT_LIST_DIR}/../TeuchosParameterList/TeuchosParameterListConfig.cmake")
INCLUDE("${CMAKE_CURRENT_LIST_DIR}/../TeuchosCore/TeuchosCoreConfig.cmake")
INCLUDE("${CMAKE_CURRENT_LIST_DIR}/../KokkosCore/KokkosCoreConfig.cmake")

# Import TeuchosKokkosCompat targets
INCLUDE("${CMAKE_CURRENT_LIST_DIR}/TeuchosKokkosCompatTargets.cmake")
