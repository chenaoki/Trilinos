# Install script for directory: /home/tomii/simenv/trilinos/packages/tpetra/core/src

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

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "TpetraCore")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/home/tomii/simenv/trilinos/build/packages/tpetra/core/src/libtpetra.a")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "TpetraCore")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "TpetraCore")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE FILES
    "/home/tomii/simenv/trilinos/packages/tpetra/core/src/MurmurHash3.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/core/src/Tpetra_ConfigDefs.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/core/src/Tpetra_RowGraph_decl.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/core/src/Tpetra_Experimental_BlockMultiVector_decl.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/core/src/Tpetra_RowMatrix_def.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/core/src/Tpetra_MultiVectorFiller.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/core/src/Tpetra_Export_def.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/core/src/Tpetra_Details_Transfer.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/core/src/Tpetra_Vector_def.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/core/src/Tpetra_Details_Hash.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/core/src/Tpetra_DistObjectKA_decl.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/core/src/Tpetra_Map_decl.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/core/src/Tpetra_HashTable_decl.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/core/src/Tpetra_Import_Util.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/core/src/Tpetra_Details_PackTraits.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/core/src/Tpetra_MultiVector_decl.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/core/src/Tpetra_Import_decl.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/core/src/Tpetra_CrsMatrix_def.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/core/src/Tpetra_CrsGraph_decl.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/core/src/Tpetra_Experimental_BlockVector_def.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/core/src/Tpetra_Export_decl.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/core/src/Tpetra_CrsMatrix_decl.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/core/src/Tpetra_Details_OrdinalTraits.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/core/src/Tpetra_ComputeGatherMap.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/core/src/Tpetra_TsqrAdaptor.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/core/src/Tpetra_RowMatrixTransposer_decl.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/core/src/Tpetra_DistObject_decl.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/core/src/Tpetra_Distributor.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/core/src/Tpetra_Directory_decl.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/core/src/Tpetra_CombineMode.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/core/src/Tpetra_ImportExportData_def.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/core/src/Tpetra_Experimental_BlockCrsMatrix_def.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/core/src/Tpetra_RowGraph_def.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/core/src/Tpetra_TieBreak.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/core/src/Tpetra_Version.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/core/src/Tpetra_CrsMatrixMultiplyOp.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/core/src/Tpetra_Operator.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/core/src/Tpetra_Vector_decl.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/core/src/Tpetra_DefaultPlatform.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/core/src/Tpetra_Core.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/core/src/Tpetra_SrcDistObject.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/core/src/Tpetra_Map_def.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/core/src/Tpetra_Experimental_BlockView.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/core/src/Tpetra_ApplyOp.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/core/src/Tpetra_DistObjectKA_def.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/core/src/Tpetra_Details_MultiVectorDistObjectKernels_def.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/core/src/Tpetra_Details_FixedHashTable_def.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/core/src/Tpetra_Exceptions_decl.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/core/src/Tpetra_HashTable_def.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/core/src/Tpetra_Experimental_BlockMultiVector_def.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/core/src/Tpetra_DirectoryImpl_def.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/core/src/Tpetra_RowMatrixTransposer_def.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/core/src/Tpetra_CrsMatrixSolveOp.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/core/src/Tpetra_Import_def.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/core/src/Tpetra_RowMatrix_decl.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/core/src/Tpetra_MultiVector_def.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/core/src/Tpetra_MpiPlatform.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/core/src/Tpetra_Util.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/core/src/Tpetra_CrsGraph_def.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/core/src/Tpetra_ExplicitInstantiationHelpers.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/core/src/Tpetra_Details_gathervPrint.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/core/src/Tpetra_EpetraRowMatrix.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/core/src/Tpetra_Details_makeOptimizedColMap.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/core/src/Epetra_TsqrMessenger.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/core/src/Tpetra_Details_FixedHashTable_decl.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/core/src/Tpetra_DistObject_def.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/core/src/Tpetra_CrsMatrixSolveOp_decl.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/core/src/Tpetra_Experimental_BlockCrsMatrix_decl.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/core/src/Tpetra_SerialPlatform.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/core/src/Tpetra_Experimental_BlockVector_decl.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/core/src/Epetra_TsqrAdaptor.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/core/src/Tpetra_DirectoryImpl_decl.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/core/src/Tpetra_Exceptions_def.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/core/src/Tpetra_Packable.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/core/src/Tpetra_Details_MultiVectorDistObjectKernels_decl.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/core/src/Tpetra_ImportExportData_decl.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/core/src/Tpetra_Directory_def.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/core/src/Tpetra_Import_Util2.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/core/src/kokkos_refactor/Tpetra_KokkosRefactor_DistObject_def.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/core/src/kokkos_refactor/Tpetra_KokkosRefactor_CrsMatrix_def.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/core/src/kokkos_refactor/Tpetra_KokkosRefactor_CrsGraph_def.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/core/src/kokkos_refactor/Tpetra_KokkosRefactor_MultiVector_decl.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/core/src/kokkos_refactor/Tpetra_KokkosRefactor_Details_MultiVectorLocalDeepCopy.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/core/src/kokkos_refactor/Tpetra_KokkosRefactor_Map_def.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/core/src/kokkos_refactor/Tpetra_KokkosRefactor_CrsMatrix_decl.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/core/src/kokkos_refactor/Tpetra_KokkosRefactor_Details_MultiVectorDistObjectKernels.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/core/src/kokkos_refactor/Tpetra_KokkosRefactor_DistObject_decl.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/core/src/kokkos_refactor/Tpetra_KokkosRefactor_Vector_decl.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/core/src/kokkos_refactor/Tpetra_KokkosRefactor_CrsGraph_decl.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/core/src/kokkos_refactor/Tpetra_KokkosRefactor_Map_decl.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/core/src/kokkos_refactor/Tpetra_KokkosRefactor_Vector_def.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/core/src/kokkos_refactor/Tpetra_KokkosRefactor_MultiVector_def.hpp"
    "/home/tomii/simenv/trilinos/packages/tpetra/core/src/kokkos_refactor/Kokkos_MV_GEMM.hpp"
    "/home/tomii/simenv/trilinos/build/packages/tpetra/core/src/Tpetra_RowGraph.hpp"
    "/home/tomii/simenv/trilinos/build/packages/tpetra/core/src/Tpetra_ImportExportData.hpp"
    "/home/tomii/simenv/trilinos/build/packages/tpetra/core/src/Tpetra_RowMatrixTransposer.hpp"
    "/home/tomii/simenv/trilinos/build/packages/tpetra/core/src/Tpetra_Details_MultiVectorDistObjectKernels.hpp"
    "/home/tomii/simenv/trilinos/build/packages/tpetra/core/src/Tpetra_KokkosRefactor_MultiVector.hpp"
    "/home/tomii/simenv/trilinos/build/packages/tpetra/core/src/Tpetra_Experimental_BlockVector.hpp"
    "/home/tomii/simenv/trilinos/build/packages/tpetra/core/src/Tpetra_DistObject.hpp"
    "/home/tomii/simenv/trilinos/build/packages/tpetra/core/src/Tpetra_Experimental_BlockMultiVector.hpp"
    "/home/tomii/simenv/trilinos/build/packages/tpetra/core/src/Tpetra_Import.hpp"
    "/home/tomii/simenv/trilinos/build/packages/tpetra/core/src/Tpetra_Map.hpp"
    "/home/tomii/simenv/trilinos/build/packages/tpetra/core/src/Tpetra_RowMatrix.hpp"
    "/home/tomii/simenv/trilinos/build/packages/tpetra/core/src/Tpetra_Vector.hpp"
    "/home/tomii/simenv/trilinos/build/packages/tpetra/core/src/Tpetra_Exceptions.hpp"
    "/home/tomii/simenv/trilinos/build/packages/tpetra/core/src/Tpetra_Details_FixedHashTable.hpp"
    "/home/tomii/simenv/trilinos/build/packages/tpetra/core/src/Tpetra_Directory.hpp"
    "/home/tomii/simenv/trilinos/build/packages/tpetra/core/src/Tpetra_Export.hpp"
    "/home/tomii/simenv/trilinos/build/packages/tpetra/core/src/Tpetra_KokkosRefactor_DistObject.hpp"
    "/home/tomii/simenv/trilinos/build/packages/tpetra/core/src/Tpetra_CrsMatrix.hpp"
    "/home/tomii/simenv/trilinos/build/packages/tpetra/core/src/Tpetra_DirectoryImpl.hpp"
    "/home/tomii/simenv/trilinos/build/packages/tpetra/core/src/Tpetra_KokkosRefactor_CrsMatrix.hpp"
    "/home/tomii/simenv/trilinos/build/packages/tpetra/core/src/Tpetra_KokkosRefactor_Vector.hpp"
    "/home/tomii/simenv/trilinos/build/packages/tpetra/core/src/Tpetra_MultiVector.hpp"
    "/home/tomii/simenv/trilinos/build/packages/tpetra/core/src/Tpetra_Experimental_BlockCrsMatrix.hpp"
    "/home/tomii/simenv/trilinos/build/packages/tpetra/core/src/Tpetra_CrsMatrixSolveOp.hpp"
    "/home/tomii/simenv/trilinos/build/packages/tpetra/core/src/Tpetra_DistObjectKA.hpp"
    "/home/tomii/simenv/trilinos/build/packages/tpetra/core/src/Tpetra_HashTable.hpp"
    "/home/tomii/simenv/trilinos/build/packages/tpetra/core/src/Tpetra_KokkosRefactor_CrsGraph.hpp"
    "/home/tomii/simenv/trilinos/build/packages/tpetra/core/src/Tpetra_CrsGraph.hpp"
    "/home/tomii/simenv/trilinos/build/packages/tpetra/core/src/Tpetra_KokkosRefactor_Map.hpp"
    "/home/tomii/simenv/trilinos/build/packages/tpetra/core/src/TpetraCore_config.h"
    "/home/tomii/simenv/trilinos/build/packages/tpetra/core/src/TpetraCore_ETIHelperMacros.h"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "TpetraCore")

