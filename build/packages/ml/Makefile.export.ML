##############################################################################
#
# Make variables for use by Trilinos/ML clients. 
#
# Do not edit: This file was generated automatically by CMake.
#
##############################################################################


## ---------------------------------------------------------------------------
## Compilers used by Trilinos/ML build
## ---------------------------------------------------------------------------

ML_CXX_COMPILER=/usr/bin/mpicxx

ML_C_COMPILER=/usr/bin/mpicc

ML_FORTRAN_COMPILER=/usr/bin/mpif90
ML_Fortran_COMPILER=/usr/bin/mpif90


## ---------------------------------------------------------------------------
## Compiler flags used by Trilinos/ML build
## ---------------------------------------------------------------------------

## Set compiler flags, including those determined by build type
ML_CXX_FLAGS= -std=c++11 -O3
ML_CXX_COMPILER_FLAGS= -std=c++11 -O3

ML_C_FLAGS= -O3
ML_C_COMPILER_FLAGS= -O3

ML_FORTRAN_FLAGS= -O3
ML_Fortran_COMPILER_FLAGS= -O3

## Extra link flags (e.g., specification of fortran libraries)
ML_EXTRA_LD_FLAGS=-lpthread

## This is the command-line entry used for setting rpaths. In a build
## with static libraries it will be empty. 
ML_SHARED_LIB_RPATH_COMMAND=
ML_BUILD_SHARED_LIBS=OFF

ML_LINKER=/usr/bin/ld
ML_AR=/usr/bin/ar

## ---------------------------------------------------------------------------
## Set library specifications and paths 
## ---------------------------------------------------------------------------

## The project version number
ML_VERSION=12.4.2

## List of package include dirs
ML_INCLUDE_DIRS= -I/home/tomii/simenv/trilinos/build -I/home/tomii/simenv/trilinos/build/packages/ml/src -I/home/tomii/simenv/trilinos/packages/ml/src/Include -I/home/tomii/simenv/trilinos/packages/ml/src/Comm -I/home/tomii/simenv/trilinos/packages/ml/src/Coarsen -I/home/tomii/simenv/trilinos/packages/ml/src/FEGrid -I/home/tomii/simenv/trilinos/packages/ml/src/Main -I/home/tomii/simenv/trilinos/packages/ml/src/Smoother -I/home/tomii/simenv/trilinos/packages/ml/src/Krylov -I/home/tomii/simenv/trilinos/packages/ml/src/Operator -I/home/tomii/simenv/trilinos/packages/ml/src/Utils -I/home/tomii/simenv/trilinos/packages/ml/src/RefMaxwell -I/home/tomii/simenv/trilinos/packages/ml/src/MatrixFree -I/home/tomii/simenv/trilinos/packages/ml/src/MLAPI -I/home/tomii/simenv/trilinos/packages/ml/src/LevelWrap -I/home/tomii/simenv/trilinos/build/packages/ifpack/src -I/home/tomii/simenv/trilinos/packages/ifpack/src -I/home/tomii/simenv/trilinos/packages/ifpack/../amesos/src/SuiteSparse/AMD/Include -I/home/tomii/simenv/trilinos/packages/ifpack/../amesos/src/SuiteSparse/UFconfig -I/home/tomii/simenv/trilinos/build/packages/amesos/src -I/home/tomii/simenv/trilinos/packages/amesos/src -I/home/tomii/simenv/trilinos/packages/amesos/src/SuiteSparse/AMD/Include -I/home/tomii/simenv/trilinos/packages/amesos/src/SuiteSparse/COLAMD/Include -I/home/tomii/simenv/trilinos/packages/amesos/src/SuiteSparse/CHOLMOD/Include -I/home/tomii/simenv/trilinos/packages/amesos/src/SuiteSparse/UFconfig -I/home/tomii/simenv/trilinos/packages/amesos/src/SuiteSparse/KLU/Include -I/home/tomii/simenv/trilinos/packages/amesos/src/SuiteSparse/BTF/Include -I/home/tomii/simenv/trilinos/packages/amesos/src/SuiteSparse/CAMD/Include -I/home/tomii/simenv/trilinos/build/packages/epetraext/src -I/home/tomii/simenv/trilinos/packages/epetraext/src -I/home/tomii/simenv/trilinos/packages/epetraext/src/transform -I/home/tomii/simenv/trilinos/packages/epetraext/src/inout -I/home/tomii/simenv/trilinos/packages/epetraext/src/coloring -I/home/tomii/simenv/trilinos/packages/epetraext/src/model_evaluator -I/home/tomii/simenv/trilinos/packages/epetraext/src/block -I/home/tomii/simenv/trilinos/packages/epetraext/src/restrict -I/home/tomii/simenv/trilinos/build/packages/triutils/src -I/home/tomii/simenv/trilinos/packages/triutils/src -I/home/tomii/simenv/trilinos/build/packages/epetra/src -I/home/tomii/simenv/trilinos/packages/epetra/src -I/home/tomii/simenv/trilinos/build/packages/teuchos/kokkoscomm/src -I/home/tomii/simenv/trilinos/packages/teuchos/kokkoscomm/src -I/home/tomii/simenv/trilinos/build/packages/teuchos/kokkoscompat/src -I/home/tomii/simenv/trilinos/packages/teuchos/kokkoscompat/src -I/home/tomii/simenv/trilinos/packages/teuchos/parameterlist/src -I/home/tomii/simenv/trilinos/build/packages/teuchos/core/src -I/home/tomii/simenv/trilinos/packages/teuchos/core/src -I/home/tomii/simenv/trilinos/build/packages/kokkos/core/src -I/home/tomii/simenv/trilinos/packages/kokkos/core/src -I/home/tomii/simenv/trilinos/packages/teuchos/comm/src -I/home/tomii/simenv/trilinos/packages/teuchos/remainder/src -I/home/tomii/simenv/trilinos/build/packages/teuchos/remainder/src -I/home/tomii/simenv/trilinos/packages/teuchos/numerics/src -I/usr/include -I/usr/include/suitesparse -I/home/tomii/simenv/trilinos/build/packages/aztecoo/src -I/home/tomii/simenv/trilinos/packages/aztecoo/src -I/home/tomii/simenv/trilinos/build/packages/zoltan/src -I/home/tomii/simenv/trilinos/packages/zoltan/src/include -I/home/tomii/simenv/trilinos/packages/zoltan/src/all -I/home/tomii/simenv/trilinos/packages/zoltan/src/coloring -I/home/tomii/simenv/trilinos/packages/zoltan/src/graph -I/home/tomii/simenv/trilinos/packages/zoltan/src/ha -I/home/tomii/simenv/trilinos/packages/zoltan/src/hier -I/home/tomii/simenv/trilinos/packages/zoltan/src/hsfc -I/home/tomii/simenv/trilinos/packages/zoltan/src/lb -I/home/tomii/simenv/trilinos/packages/zoltan/src/matrix -I/home/tomii/simenv/trilinos/packages/zoltan/src/order -I/home/tomii/simenv/trilinos/packages/zoltan/src/par -I/home/tomii/simenv/trilinos/packages/zoltan/src/params -I/home/tomii/simenv/trilinos/packages/zoltan/src/tpls -I/home/tomii/simenv/trilinos/packages/zoltan/src/phg -I/home/tomii/simenv/trilinos/packages/zoltan/src/rcb -I/home/tomii/simenv/trilinos/packages/zoltan/src/reftree -I/home/tomii/simenv/trilinos/packages/zoltan/src/simple -I/home/tomii/simenv/trilinos/packages/zoltan/src/timer -I/home/tomii/simenv/trilinos/packages/zoltan/src/Utilities/Communication -I/home/tomii/simenv/trilinos/packages/zoltan/src/Utilities/DDirectory -I/home/tomii/simenv/trilinos/packages/zoltan/src/Utilities/Timer -I/home/tomii/simenv/trilinos/packages/zoltan/src/Utilities/shared -I/home/tomii/simenv/trilinos/packages/zoltan/src/zz

## List of package library paths
ML_LIBRARY_DIRS= -L/home/tomii/simenv/trilinos/build/packages/ml/src -L/home/tomii/simenv/trilinos/build/packages/ifpack/src -L/home/tomii/simenv/trilinos/build/packages/amesos/src -L/home/tomii/simenv/trilinos/build/packages/epetraext/src -L/home/tomii/simenv/trilinos/build/packages/triutils/src -L/home/tomii/simenv/trilinos/build/packages/epetra/src -L/home/tomii/simenv/trilinos/build/packages/teuchos/kokkoscomm/src -L/home/tomii/simenv/trilinos/build/packages/teuchos/kokkoscompat/src -L/home/tomii/simenv/trilinos/build/packages/teuchos/parameterlist/src -L/home/tomii/simenv/trilinos/build/packages/teuchos/core/src -L/home/tomii/simenv/trilinos/build/packages/kokkos/core/src -L/home/tomii/simenv/trilinos/build/packages/teuchos/comm/src -L/home/tomii/simenv/trilinos/build/packages/teuchos/remainder/src -L/home/tomii/simenv/trilinos/build/packages/teuchos/numerics/src -L/home/tomii/simenv/trilinos/build/packages/aztecoo/src -L/home/tomii/simenv/trilinos/build/packages/zoltan/src

## List of package libraries
ML_LIBRARIES= -lml -lifpack -lamesos -laztecoo -lepetraext -ltriutils -lzoltan -lepetra -lteuchoskokkoscomm -lteuchoskokkoscompat -lteuchosremainder -lteuchosnumerics -lteuchoscomm -lteuchosparameterlist -lteuchoscore -lkokkoscore

## Specification of directories for TPL headers
ML_TPL_INCLUDE_DIRS= -I/usr/include/suitesparse -I/usr/include -I/usr/include -I/usr/include -I/usr/include

## Specification of directories for TPL libraries
ML_TPL_LIBRARY_DIRS=

## List of required TPLs
ML_TPL_LIBRARIES= /usr/lib/x86_64-linux-gnu/libumfpack.so /usr/lib/x86_64-linux-gnu/libamd.so /usr/lib/x86_64-linux-gnu/libhdf5.so /usr/lib/x86_64-linux-gnu/libz.so /usr/lib/libparmetis.so /usr/lib/libmetis.so /usr/lib/liblapack.so /usr/lib/libblas.so

## ---------------------------------------------------------------------------
## MPI specific variables
##   These variables are provided to make it easier to get the mpi libraries
##   and includes on systems that do not use the mpi wrappers for compiling
## ---------------------------------------------------------------------------

ML_MPI_LIBRARIES=
ML_MPI_LIBRARY_DIRS=
ML_MPI_INCLUDE_DIRS=
ML_MPI_EXEC=/usr/bin/mpiexec
ML_MPI_EXEC_MAX_NUMPROCS=4
ML_MPI_EXEC_NUMPROCS_FLAG=-np

## ---------------------------------------------------------------------------
## Set useful general variables 
## ---------------------------------------------------------------------------

## The packages enabled for this project
ML_PACKAGE_LIST= ML Ifpack Amesos AztecOO EpetraExt Triutils Zoltan Epetra Teuchos TeuchosKokkosComm TeuchosKokkosCompat TeuchosRemainder TeuchosNumerics TeuchosComm TeuchosParameterList TeuchosCore KokkosCore

## The TPLs enabled for this project
ML_TPL_LIST= UMFPACK HDF5 ParMETIS LAPACK BLAS MPI Pthread

## ---------------------------------------------------------------------------
## Deprecated variables
##   These variables from the autotools version of Makefile.export.<package>
##   have been deprecated. To help avoid confusion with projects that haven't
##   migrated to the new version of the variable names when the don't compile.
##   This will put an obvious statement in the link line that these Trilinos
##   Makefile variables are no longer used. Without this there would be a link
##   error with no obvious reason as to why other than the lack of Trilinos libs
##   which would be confusing since the link line in the Makefile would have 
##   stated to put them on the line.
## ---------------------------------------------------------------------------

ML_LIBS="The Trilinos variable ML_LIBS has been deprecated. Please see the documentation on the Makefile.export capability for instructions on how to transition to the new system."
ML_INCLUDES="The Trilinos variable ML_INCLUDES has been deprecated. Please see the documentation on the Makefile.export capability for instructions on how to transition to the new system."


