# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

# compile C with /usr/bin/mpicc
# compile CXX with /usr/bin/mpicxx
C_FLAGS = -O3 -I/home/tomii/simenv/trilinos/build -I/home/tomii/simenv/trilinos/build/packages/ml/src -I/home/tomii/simenv/trilinos/packages/ml/src/Include -I/home/tomii/simenv/trilinos/packages/ml/src/Comm -I/home/tomii/simenv/trilinos/packages/ml/src/Coarsen -I/home/tomii/simenv/trilinos/packages/ml/src/FEGrid -I/home/tomii/simenv/trilinos/packages/ml/src/Main -I/home/tomii/simenv/trilinos/packages/ml/src/Smoother -I/home/tomii/simenv/trilinos/packages/ml/src/Krylov -I/home/tomii/simenv/trilinos/packages/ml/src/Operator -I/home/tomii/simenv/trilinos/packages/ml/src/Utils -I/home/tomii/simenv/trilinos/packages/ml/src/RefMaxwell -I/home/tomii/simenv/trilinos/packages/ml/src/MatrixFree -I/home/tomii/simenv/trilinos/packages/ml/src/MLAPI -I/home/tomii/simenv/trilinos/packages/ml/src/LevelWrap -I/home/tomii/simenv/trilinos/build/packages/ifpack/src -I/home/tomii/simenv/trilinos/packages/ifpack/src -I/home/tomii/simenv/trilinos/packages/ifpack/../amesos/src/SuiteSparse/AMD/Include -I/home/tomii/simenv/trilinos/packages/ifpack/../amesos/src/SuiteSparse/UFconfig -I/home/tomii/simenv/trilinos/build/packages/amesos/src -I/home/tomii/simenv/trilinos/packages/amesos/src -I/home/tomii/simenv/trilinos/packages/amesos/src/SuiteSparse/AMD/Include -I/home/tomii/simenv/trilinos/packages/amesos/src/SuiteSparse/COLAMD/Include -I/home/tomii/simenv/trilinos/packages/amesos/src/SuiteSparse/CHOLMOD/Include -I/home/tomii/simenv/trilinos/packages/amesos/src/SuiteSparse/UFconfig -I/home/tomii/simenv/trilinos/packages/amesos/src/SuiteSparse/KLU/Include -I/home/tomii/simenv/trilinos/packages/amesos/src/SuiteSparse/BTF/Include -I/home/tomii/simenv/trilinos/packages/amesos/src/SuiteSparse/CAMD/Include -I/home/tomii/simenv/trilinos/build/packages/epetraext/src -I/home/tomii/simenv/trilinos/packages/epetraext/src -I/home/tomii/simenv/trilinos/packages/epetraext/src/transform -I/home/tomii/simenv/trilinos/packages/epetraext/src/inout -I/home/tomii/simenv/trilinos/packages/epetraext/src/coloring -I/home/tomii/simenv/trilinos/packages/epetraext/src/model_evaluator -I/home/tomii/simenv/trilinos/packages/epetraext/src/block -I/home/tomii/simenv/trilinos/packages/epetraext/src/restrict -I/home/tomii/simenv/trilinos/build/packages/triutils/src -I/home/tomii/simenv/trilinos/packages/triutils/src -I/home/tomii/simenv/trilinos/build/packages/epetra/src -I/home/tomii/simenv/trilinos/packages/epetra/src -I/home/tomii/simenv/trilinos/build/packages/teuchos/kokkoscomm/src -I/home/tomii/simenv/trilinos/packages/teuchos/kokkoscomm/src -I/home/tomii/simenv/trilinos/build/packages/teuchos/kokkoscompat/src -I/home/tomii/simenv/trilinos/packages/teuchos/kokkoscompat/src -I/home/tomii/simenv/trilinos/packages/teuchos/parameterlist/src -I/home/tomii/simenv/trilinos/build/packages/teuchos/core/src -I/home/tomii/simenv/trilinos/packages/teuchos/core/src -I/home/tomii/simenv/trilinos/build/packages/kokkos/core/src -I/home/tomii/simenv/trilinos/packages/kokkos/core/src -I/home/tomii/simenv/trilinos/packages/teuchos/comm/src -I/home/tomii/simenv/trilinos/packages/teuchos/remainder/src -I/home/tomii/simenv/trilinos/build/packages/teuchos/remainder/src -I/home/tomii/simenv/trilinos/packages/teuchos/numerics/src -I/usr/include/suitesparse -I/home/tomii/simenv/trilinos/build/packages/aztecoo/src -I/home/tomii/simenv/trilinos/packages/aztecoo/src -I/home/tomii/simenv/trilinos/build/packages/zoltan/src -I/home/tomii/simenv/trilinos/packages/zoltan/src/include -I/home/tomii/simenv/trilinos/packages/zoltan/src/all -I/home/tomii/simenv/trilinos/packages/zoltan/src/coloring -I/home/tomii/simenv/trilinos/packages/zoltan/src/graph -I/home/tomii/simenv/trilinos/packages/zoltan/src/ha -I/home/tomii/simenv/trilinos/packages/zoltan/src/hier -I/home/tomii/simenv/trilinos/packages/zoltan/src/hsfc -I/home/tomii/simenv/trilinos/packages/zoltan/src/lb -I/home/tomii/simenv/trilinos/packages/zoltan/src/matrix -I/home/tomii/simenv/trilinos/packages/zoltan/src/order -I/home/tomii/simenv/trilinos/packages/zoltan/src/par -I/home/tomii/simenv/trilinos/packages/zoltan/src/params -I/home/tomii/simenv/trilinos/packages/zoltan/src/tpls -I/home/tomii/simenv/trilinos/packages/zoltan/src/phg -I/home/tomii/simenv/trilinos/packages/zoltan/src/rcb -I/home/tomii/simenv/trilinos/packages/zoltan/src/reftree -I/home/tomii/simenv/trilinos/packages/zoltan/src/simple -I/home/tomii/simenv/trilinos/packages/zoltan/src/timer -I/home/tomii/simenv/trilinos/packages/zoltan/src/Utilities/Communication -I/home/tomii/simenv/trilinos/packages/zoltan/src/Utilities/DDirectory -I/home/tomii/simenv/trilinos/packages/zoltan/src/Utilities/Timer -I/home/tomii/simenv/trilinos/packages/zoltan/src/Utilities/shared -I/home/tomii/simenv/trilinos/packages/zoltan/src/zz   

C_DEFINES = 

CXX_FLAGS =  -std=c++11 -O3 -I/home/tomii/simenv/trilinos/build -I/home/tomii/simenv/trilinos/build/packages/ml/src -I/home/tomii/simenv/trilinos/packages/ml/src/Include -I/home/tomii/simenv/trilinos/packages/ml/src/Comm -I/home/tomii/simenv/trilinos/packages/ml/src/Coarsen -I/home/tomii/simenv/trilinos/packages/ml/src/FEGrid -I/home/tomii/simenv/trilinos/packages/ml/src/Main -I/home/tomii/simenv/trilinos/packages/ml/src/Smoother -I/home/tomii/simenv/trilinos/packages/ml/src/Krylov -I/home/tomii/simenv/trilinos/packages/ml/src/Operator -I/home/tomii/simenv/trilinos/packages/ml/src/Utils -I/home/tomii/simenv/trilinos/packages/ml/src/RefMaxwell -I/home/tomii/simenv/trilinos/packages/ml/src/MatrixFree -I/home/tomii/simenv/trilinos/packages/ml/src/MLAPI -I/home/tomii/simenv/trilinos/packages/ml/src/LevelWrap -I/home/tomii/simenv/trilinos/build/packages/ifpack/src -I/home/tomii/simenv/trilinos/packages/ifpack/src -I/home/tomii/simenv/trilinos/packages/ifpack/../amesos/src/SuiteSparse/AMD/Include -I/home/tomii/simenv/trilinos/packages/ifpack/../amesos/src/SuiteSparse/UFconfig -I/home/tomii/simenv/trilinos/build/packages/amesos/src -I/home/tomii/simenv/trilinos/packages/amesos/src -I/home/tomii/simenv/trilinos/packages/amesos/src/SuiteSparse/AMD/Include -I/home/tomii/simenv/trilinos/packages/amesos/src/SuiteSparse/COLAMD/Include -I/home/tomii/simenv/trilinos/packages/amesos/src/SuiteSparse/CHOLMOD/Include -I/home/tomii/simenv/trilinos/packages/amesos/src/SuiteSparse/UFconfig -I/home/tomii/simenv/trilinos/packages/amesos/src/SuiteSparse/KLU/Include -I/home/tomii/simenv/trilinos/packages/amesos/src/SuiteSparse/BTF/Include -I/home/tomii/simenv/trilinos/packages/amesos/src/SuiteSparse/CAMD/Include -I/home/tomii/simenv/trilinos/build/packages/epetraext/src -I/home/tomii/simenv/trilinos/packages/epetraext/src -I/home/tomii/simenv/trilinos/packages/epetraext/src/transform -I/home/tomii/simenv/trilinos/packages/epetraext/src/inout -I/home/tomii/simenv/trilinos/packages/epetraext/src/coloring -I/home/tomii/simenv/trilinos/packages/epetraext/src/model_evaluator -I/home/tomii/simenv/trilinos/packages/epetraext/src/block -I/home/tomii/simenv/trilinos/packages/epetraext/src/restrict -I/home/tomii/simenv/trilinos/build/packages/triutils/src -I/home/tomii/simenv/trilinos/packages/triutils/src -I/home/tomii/simenv/trilinos/build/packages/epetra/src -I/home/tomii/simenv/trilinos/packages/epetra/src -I/home/tomii/simenv/trilinos/build/packages/teuchos/kokkoscomm/src -I/home/tomii/simenv/trilinos/packages/teuchos/kokkoscomm/src -I/home/tomii/simenv/trilinos/build/packages/teuchos/kokkoscompat/src -I/home/tomii/simenv/trilinos/packages/teuchos/kokkoscompat/src -I/home/tomii/simenv/trilinos/packages/teuchos/parameterlist/src -I/home/tomii/simenv/trilinos/build/packages/teuchos/core/src -I/home/tomii/simenv/trilinos/packages/teuchos/core/src -I/home/tomii/simenv/trilinos/build/packages/kokkos/core/src -I/home/tomii/simenv/trilinos/packages/kokkos/core/src -I/home/tomii/simenv/trilinos/packages/teuchos/comm/src -I/home/tomii/simenv/trilinos/packages/teuchos/remainder/src -I/home/tomii/simenv/trilinos/build/packages/teuchos/remainder/src -I/home/tomii/simenv/trilinos/packages/teuchos/numerics/src -I/usr/include/suitesparse -I/home/tomii/simenv/trilinos/build/packages/aztecoo/src -I/home/tomii/simenv/trilinos/packages/aztecoo/src -I/home/tomii/simenv/trilinos/build/packages/zoltan/src -I/home/tomii/simenv/trilinos/packages/zoltan/src/include -I/home/tomii/simenv/trilinos/packages/zoltan/src/all -I/home/tomii/simenv/trilinos/packages/zoltan/src/coloring -I/home/tomii/simenv/trilinos/packages/zoltan/src/graph -I/home/tomii/simenv/trilinos/packages/zoltan/src/ha -I/home/tomii/simenv/trilinos/packages/zoltan/src/hier -I/home/tomii/simenv/trilinos/packages/zoltan/src/hsfc -I/home/tomii/simenv/trilinos/packages/zoltan/src/lb -I/home/tomii/simenv/trilinos/packages/zoltan/src/matrix -I/home/tomii/simenv/trilinos/packages/zoltan/src/order -I/home/tomii/simenv/trilinos/packages/zoltan/src/par -I/home/tomii/simenv/trilinos/packages/zoltan/src/params -I/home/tomii/simenv/trilinos/packages/zoltan/src/tpls -I/home/tomii/simenv/trilinos/packages/zoltan/src/phg -I/home/tomii/simenv/trilinos/packages/zoltan/src/rcb -I/home/tomii/simenv/trilinos/packages/zoltan/src/reftree -I/home/tomii/simenv/trilinos/packages/zoltan/src/simple -I/home/tomii/simenv/trilinos/packages/zoltan/src/timer -I/home/tomii/simenv/trilinos/packages/zoltan/src/Utilities/Communication -I/home/tomii/simenv/trilinos/packages/zoltan/src/Utilities/DDirectory -I/home/tomii/simenv/trilinos/packages/zoltan/src/Utilities/Timer -I/home/tomii/simenv/trilinos/packages/zoltan/src/Utilities/shared -I/home/tomii/simenv/trilinos/packages/zoltan/src/zz   

CXX_DEFINES = 

