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
# CMake variable for use by Trilinos clients. 
#
# Do not edit: This file was generated automatically by CMake.
#
##############################################################################

#
# Ensure CMAKE_CURRENT_LIST_DIR is usable.
#

# Include guard
IF (Trilinos_CONFIG_INCLUDED)
  RETURN()
ENDIF()
SET(Trilinos_CONFIG_INCLUDED TRUE)

# Make sure CMAKE_CURRENT_LIST_DIR is usable
IF (NOT DEFINED CMAKE_CURRENT_LIST_DIR)
  GET_FILENAME_COMPONENT(_THIS_SCRIPT_PATH ${CMAKE_CURRENT_LIST_FILE} PATH)
  SET(CMAKE_CURRENT_LIST_DIR ${_THIS_SCRIPT_PATH})
ENDIF()


## ---------------------------------------------------------------------------
## Compilers used by Trilinos build
## ---------------------------------------------------------------------------

SET(Trilinos_CXX_COMPILER "/usr/bin/mpicxx")

SET(Trilinos_C_COMPILER "/usr/bin/mpicc")

SET(Trilinos_Fortran_COMPILER "/usr/bin/mpif90")

## ---------------------------------------------------------------------------
## Compiler flags used by Trilinos build
## ---------------------------------------------------------------------------

SET(Trilinos_CXX_COMPILER_FLAGS " -std=c++11 -O3")

SET(Trilinos_C_COMPILER_FLAGS " -O3")

SET(Trilinos_Fortran_COMPILER_FLAGS " -O3")

## Extra link flags (e.g., specification of fortran libraries)
SET(Trilinos_EXTRA_LD_FLAGS "-lpthread")

## This is the command-line entry used for setting rpaths. In a build
## with static libraries it will be empty. 
SET(Trilinos_SHARED_LIB_RPATH_COMMAND "")
SET(Trilinos_BUILD_SHARED_LIBS "OFF")

SET(Trilinos_LINKER /usr/bin/ld)
SET(Trilinos_AR /usr/bin/ar)


## ---------------------------------------------------------------------------
## Set library specifications and paths 
## ---------------------------------------------------------------------------

## The project version number
SET(Trilinos_VERSION "12.4.2")

## The project include file directories.
#SET(Trilinos_INCLUDE_DIRS "${CMAKE_CURRENT_LIST_DIR}/../../../include")

## The project library directories.
#SET(Trilinos_LIBRARY_DIRS "${CMAKE_CURRENT_LIST_DIR}/../../../lib")

## The project libraries.
#SET(Trilinos_LIBRARIES "anasazitpetra;ModeLaplace;anasaziepetra;anasazi;belostpetra;belosepetra;belos;ml;ifpack;amesos;aztecoo;thyraepetra;thyracore;thyraepetra;thyracore;epetraext;tpetraext;tpetrainout;tpetra;kokkostsqr;tpetrakernels;tpetraclassiclinalg;tpetraclassicnodeapi;tpetraclassic;tpetraext;tpetrainout;tpetra;kokkostsqr;tpetrakernels;tpetraclassiclinalg;tpetraclassicnodeapi;tpetraclassic;triutils;zoltan;epetra;rtop;teuchoskokkoscomm;teuchoskokkoscompat;teuchosremainder;teuchosnumerics;teuchoscomm;teuchosparameterlist;teuchoscore;teuchoskokkoscomm;teuchoskokkoscompat;teuchosremainder;teuchosnumerics;teuchoscomm;teuchosparameterlist;teuchoscore;kokkosalgorithms;kokkoscontainers;kokkoscore;kokkosalgorithms;kokkoscontainers;kokkoscore;tpi;gtest")

## The project tpl include paths
#SET(Trilinos_TPL_INCLUDE_DIRS "/usr/include/suitesparse;/usr/include")

## The project tpl library paths
#SET(Trilinos_TPL_LIBRARY_DIRS "")

## The project tpl libraries
#SET(Trilinos_TPL_LIBRARIES "/usr/lib/x86_64-linux-gnu/libumfpack.so;/usr/lib/x86_64-linux-gnu/libamd.so;/usr/lib/x86_64-linux-gnu/libhdf5.so;/usr/lib/x86_64-linux-gnu/libz.so;/usr/lib/libparmetis.so;/usr/lib/libmetis.so;/usr/lib/liblapack.so;/usr/lib/libblas.so")

# For best practices in handling of components, see
# <http://www.cmake.org/cmake/help/v3.2/manual/cmake-developer.7.html#find-modules>.
#
# If components were requested, include only those. If not, include all of
# Trilinos.
IF (Trilinos_FIND_COMPONENTS)
  SET(COMPONENTS_LIST ${Trilinos_FIND_COMPONENTS})
ELSE()
  SET(COMPONENTS_LIST Anasazi;Belos;ML;Ifpack;Amesos;AztecOO;Thyra;ThyraEpetraAdapters;ThyraCore;EpetraExt;Tpetra;TpetraCore;TpetraTSQR;TpetraKernels;TpetraClassic;Triutils;Zoltan;Epetra;RTOp;Teuchos;TeuchosKokkosComm;TeuchosKokkosCompat;TeuchosRemainder;TeuchosNumerics;TeuchosComm;TeuchosParameterList;TeuchosCore;Kokkos;KokkosAlgorithms;KokkosContainers;KokkosCore;ThreadPool;Gtest)
ENDIF()

# Initialize Trilinos_FOUND with true, and set it to FALSE if any of
# the required components wasn't found.
SET(Trilinos_FOUND TRUE)
FOREACH(comp ${COMPONENTS_LIST})
   SET(
     INCLUDE_FILE
     ${CMAKE_CURRENT_LIST_DIR}/../${comp}/${comp}Config.cmake
     )
   IF (EXISTS ${INCLUDE_FILE})
       # Set Trilinos_<component>_FOUND.
       SET(Trilinos_${comp}_FOUND TRUE)
       # Include the package file.
       INCLUDE(${INCLUDE_FILE})
       # Add variables to lists.
       LIST(APPEND Trilinos_INCLUDE_DIRS ${${comp}_INCLUDE_DIRS})
       LIST(APPEND Trilinos_LIBRARY_DIRS ${${comp}_LIBRARY_DIRS})
       LIST(APPEND Trilinos_LIBRARIES ${${comp}_LIBRARIES})
       LIST(APPEND Trilinos_TPL_INCLUDE_DIRS ${${comp}_TPL_INCLUDE_DIRS})
       LIST(APPEND Trilinos_TPL_LIBRARY_DIRS ${${comp}_TPL_LIBRARY_DIRS})
       LIST(APPEND Trilinos_TPL_LIBRARIES ${${comp}_TPL_LIBRARIES})
   ELSE()
       # Component not found.
       MESSAGE(WARNING "Component \"${comp}\" NOT found.")
       # Set Trilinos_<component>_FOUND to FALSE.
       SET(Trilinos_${comp}_FOUND FALSE)
       # Set Trilinos_FOUND to FALSE if component is not optional.
       IF(Trilinos_FIND_REQUIRED_${comp})
           SET(Trilinos_FOUND FALSE)
       ENDIF()
   ENDIF()
ENDFOREACH()

# Resolve absolute paths and remove duplicate paths
# for LIBRARY_DIRS and INCLUDE_DIRS
# This reduces stress on regular expressions later
SET(short_dirs)
FOREACH(dir ${Trilinos_INCLUDE_DIRS})
  GET_FILENAME_COMPONENT(dir_abs ${dir} ABSOLUTE)
  LIST(APPEND short_dirs ${dir_abs})
ENDFOREACH()
LIST(REMOVE_DUPLICATES short_dirs)
SET(Trilinos_INCLUDE_DIRS ${short_dirs})

SET(short_dirs)
FOREACH(dir ${Trilinos_LIBRARY_DIRS})
  GET_FILENAME_COMPONENT(dir_abs ${dir} ABSOLUTE)
  LIST(APPEND short_dirs ${dir_abs})
ENDFOREACH()
LIST(REMOVE_DUPLICATES short_dirs)
SET(Trilinos_LIBRARY_DIRS ${short_dirs})

## ---------------------------------------------------------------------------
## MPI specific variables
##   These variables are provided to make it easier to get the mpi libraries
##   and includes on systems that do not use the mpi wrappers for compiling
## ---------------------------------------------------------------------------

SET(Trilinos_MPI_LIBRARIES "")
SET(Trilinos_MPI_LIBRARY_DIRS "")
SET(Trilinos_MPI_INCLUDE_DIRS "")
SET(Trilinos_MPI_EXEC "/usr/bin/mpiexec")
SET(Trilinos_MPI_EXEC_MAX_NUMPROCS "4")
SET(Trilinos_MPI_EXEC_NUMPROCS_FLAG "-np")

## ---------------------------------------------------------------------------
## Compiler vendor identifications
## ---------------------------------------------------------------------------
SET(Trilinos_SYSTEM_NAME "Linux")
SET(Trilinos_CXX_COMPILER_ID "GNU")
SET(Trilinos_C_COMPILER_ID "GNU")
SET(Trilinos_Fortran_COMPILER_ID "GNU")
SET(Trilinos_Fortran_IMPLICIT_LINK_LIBRARIES "mpi_f90;mpi_f77;mpi;dl;hwloc;gfortran;m;quadmath;m;pthread;c")

## ---------------------------------------------------------------------------
## Set useful general variables 
## ---------------------------------------------------------------------------

## The packages enabled for this project
SET(Trilinos_PACKAGE_LIST "Anasazi;Belos;ML;Ifpack;Amesos;AztecOO;Thyra;ThyraEpetraAdapters;ThyraCore;EpetraExt;Tpetra;TpetraCore;TpetraTSQR;TpetraKernels;TpetraClassic;Triutils;Zoltan;Epetra;RTOp;Teuchos;TeuchosKokkosComm;TeuchosKokkosCompat;TeuchosRemainder;TeuchosNumerics;TeuchosComm;TeuchosParameterList;TeuchosCore;Kokkos;KokkosAlgorithms;KokkosContainers;KokkosCore;ThreadPool;Gtest")

## The TPLs enabled for this project
SET(Trilinos_TPL_LIST "UMFPACK;HDF5;ParMETIS;LAPACK;BLAS;MPI;Pthread")


# Load configurations from enabled packages
include("${CMAKE_CURRENT_LIST_DIR}/../Anasazi/AnasaziConfig.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/../Belos/BelosConfig.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/../ML/MLConfig.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/../Ifpack/IfpackConfig.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/../Amesos/AmesosConfig.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/../AztecOO/AztecOOConfig.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/../Thyra/ThyraConfig.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/../ThyraEpetraAdapters/ThyraEpetraAdaptersConfig.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/../ThyraCore/ThyraCoreConfig.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/../EpetraExt/EpetraExtConfig.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/../Tpetra/TpetraConfig.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/../TpetraCore/TpetraCoreConfig.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/../TpetraTSQR/TpetraTSQRConfig.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/../TpetraKernels/TpetraKernelsConfig.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/../TpetraClassic/TpetraClassicConfig.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/../Triutils/TriutilsConfig.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/../Zoltan/ZoltanConfig.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/../Epetra/EpetraConfig.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/../RTOp/RTOpConfig.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/../Teuchos/TeuchosConfig.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/../TeuchosKokkosComm/TeuchosKokkosCommConfig.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/../TeuchosKokkosCompat/TeuchosKokkosCompatConfig.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/../TeuchosRemainder/TeuchosRemainderConfig.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/../TeuchosNumerics/TeuchosNumericsConfig.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/../TeuchosComm/TeuchosCommConfig.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/../TeuchosParameterList/TeuchosParameterListConfig.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/../TeuchosCore/TeuchosCoreConfig.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/../Kokkos/KokkosConfig.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/../KokkosAlgorithms/KokkosAlgorithmsConfig.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/../KokkosContainers/KokkosContainersConfig.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/../KokkosCore/KokkosCoreConfig.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/../ThreadPool/ThreadPoolConfig.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/../Gtest/GtestConfig.cmake")
