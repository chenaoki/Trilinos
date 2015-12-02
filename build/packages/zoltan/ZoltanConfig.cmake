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
# CMake variable for use by Trilinos/Zoltan clients.
#
# Do not edit: This file was generated automatically by CMake.
#
##############################################################################


# Include guard
IF (Zoltan_CONFIG_INCLUDED)
  RETURN()
ENDIF()
SET(Zoltan_CONFIG_INCLUDED TRUE)

# Make sure CMAKE_CURRENT_LIST_DIR is usable
IF (NOT DEFINED CMAKE_CURRENT_LIST_DIR)
  GET_FILENAME_COMPONENT(_THIS_SCRIPT_PATH ${CMAKE_CURRENT_LIST_FILE} PATH)
  SET(CMAKE_CURRENT_LIST_DIR ${_THIS_SCRIPT_PATH})
ENDIF()


## ---------------------------------------------------------------------------
## Compilers used by Trilinos/Zoltan build
## ---------------------------------------------------------------------------

SET(Zoltan_CXX_COMPILER "/usr/bin/mpicxx")

SET(Zoltan_C_COMPILER "/usr/bin/mpicc")

SET(Zoltan_FORTRAN_COMPILER "/usr/bin/mpif90")


## ---------------------------------------------------------------------------
## Compiler flags used by Trilinos/Zoltan build
## ---------------------------------------------------------------------------

## Set compiler flags, including those determined by build type
SET(Zoltan_CXX_FLAGS " -std=c++11 -DMPICH_IGNORE_CXX_SEEK -O3")

SET(Zoltan_C_FLAGS " -O3")

SET(Zoltan_FORTRAN_FLAGS " -O3")

## Extra link flags (e.g., specification of fortran libraries)
SET(Zoltan_EXTRA_LD_FLAGS "-lpthread")

## This is the command-line entry used for setting rpaths. In a build
## with static libraries it will be empty.
SET(Zoltan_SHARED_LIB_RPATH_COMMAND "")
SET(Zoltan_BUILD_SHARED_LIBS "OFF")

SET(Zoltan_LINKER /usr/bin/ld)
SET(Zoltan_AR /usr/bin/ar)

## ---------------------------------------------------------------------------
## Set library specifications and paths
## ---------------------------------------------------------------------------

## List of package include dirs
SET(Zoltan_INCLUDE_DIRS "/home/tomii/simenv/trilinos/build;/home/tomii/simenv/trilinos/build/packages/zoltan/src;/home/tomii/simenv/trilinos/packages/zoltan/src/include;/home/tomii/simenv/trilinos/packages/zoltan/src/all;/home/tomii/simenv/trilinos/packages/zoltan/src/coloring;/home/tomii/simenv/trilinos/packages/zoltan/src/graph;/home/tomii/simenv/trilinos/packages/zoltan/src/ha;/home/tomii/simenv/trilinos/packages/zoltan/src/hier;/home/tomii/simenv/trilinos/packages/zoltan/src/hsfc;/home/tomii/simenv/trilinos/packages/zoltan/src/lb;/home/tomii/simenv/trilinos/packages/zoltan/src/matrix;/home/tomii/simenv/trilinos/packages/zoltan/src/order;/home/tomii/simenv/trilinos/packages/zoltan/src/par;/home/tomii/simenv/trilinos/packages/zoltan/src/params;/home/tomii/simenv/trilinos/packages/zoltan/src/tpls;/home/tomii/simenv/trilinos/packages/zoltan/src/phg;/home/tomii/simenv/trilinos/packages/zoltan/src/rcb;/home/tomii/simenv/trilinos/packages/zoltan/src/reftree;/home/tomii/simenv/trilinos/packages/zoltan/src/simple;/home/tomii/simenv/trilinos/packages/zoltan/src/timer;/home/tomii/simenv/trilinos/packages/zoltan/src/Utilities/Communication;/home/tomii/simenv/trilinos/packages/zoltan/src/Utilities/DDirectory;/home/tomii/simenv/trilinos/packages/zoltan/src/Utilities/Timer;/home/tomii/simenv/trilinos/packages/zoltan/src/Utilities/shared;/home/tomii/simenv/trilinos/packages/zoltan/src/zz;/usr/include")

## List of package library paths
SET(Zoltan_LIBRARY_DIRS "/home/tomii/simenv/trilinos/build/packages/zoltan/src")

## List of package libraries
SET(Zoltan_LIBRARIES "zoltan")

## Specification of directories for TPL headers
SET(Zoltan_TPL_INCLUDE_DIRS "/usr/include")

## Specification of directories for TPL libraries
SET(Zoltan_TPL_LIBRARY_DIRS "")

## List of required TPLs
SET(Zoltan_TPL_LIBRARIES "/usr/lib/libparmetis.so;/usr/lib/libmetis.so")

## ---------------------------------------------------------------------------
## MPI specific variables
##   These variables are provided to make it easier to get the mpi libraries
##   and includes on systems that do not use the mpi wrappers for compiling
## ---------------------------------------------------------------------------

SET(Zoltan_MPI_LIBRARIES "")
SET(Zoltan_MPI_LIBRARY_DIRS "")
SET(Zoltan_MPI_INCLUDE_DIRS "")
SET(Zoltan_MPI_EXEC "/usr/bin/mpiexec")
SET(Zoltan_MPI_EXEC_MAX_NUMPROCS "4")
SET(Zoltan_MPI_EXEC_NUMPROCS_FLAG "-np")

## ---------------------------------------------------------------------------
## Set useful general variables
## ---------------------------------------------------------------------------

## The packages enabled for this project
SET(Zoltan_PACKAGE_LIST "Zoltan")

## The TPLs enabled for this project
SET(Zoltan_TPL_LIST "ParMETIS;MPI")


# Import Zoltan targets
INCLUDE("/home/tomii/simenv/trilinos/build/TrilinosTargets.cmake")
