# Install script for directory: /home/tomii/simenv/trilinos/packages/epetra/src

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

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Epetra")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/home/tomii/simenv/trilinos/build/packages/epetra/src/libepetra.a")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Epetra")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Epetra")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE FILES
    "/home/tomii/simenv/trilinos/build/packages/epetra/src/Epetra_config.h"
    "/home/tomii/simenv/trilinos/build/packages/epetra/src/Epetra_DLLExportMacro.h"
    "/home/tomii/simenv/trilinos/packages/epetra/src/Epetra_BLAS.h"
    "/home/tomii/simenv/trilinos/packages/epetra/src/Epetra_BLAS_wrappers.h"
    "/home/tomii/simenv/trilinos/packages/epetra/src/Epetra_BasicDirectory.h"
    "/home/tomii/simenv/trilinos/packages/epetra/src/Epetra_BasicRowMatrix.h"
    "/home/tomii/simenv/trilinos/packages/epetra/src/Epetra_BlockMap.h"
    "/home/tomii/simenv/trilinos/packages/epetra/src/Epetra_BlockMapData.h"
    "/home/tomii/simenv/trilinos/packages/epetra/src/Epetra_C_wrappers.h"
    "/home/tomii/simenv/trilinos/packages/epetra/src/Epetra_CombineMode.h"
    "/home/tomii/simenv/trilinos/packages/epetra/src/Epetra_Comm.h"
    "/home/tomii/simenv/trilinos/packages/epetra/src/Epetra_CompObject.h"
    "/home/tomii/simenv/trilinos/packages/epetra/src/Epetra_ConfigDefs.h"
    "/home/tomii/simenv/trilinos/packages/epetra/src/Epetra_CrsGraph.h"
    "/home/tomii/simenv/trilinos/packages/epetra/src/Epetra_CrsGraphData.h"
    "/home/tomii/simenv/trilinos/packages/epetra/src/Epetra_CrsMatrix.h"
    "/home/tomii/simenv/trilinos/packages/epetra/src/Epetra_CrsSingletonFilter.h"
    "/home/tomii/simenv/trilinos/packages/epetra/src/Epetra_Data.h"
    "/home/tomii/simenv/trilinos/packages/epetra/src/Epetra_DataAccess.h"
    "/home/tomii/simenv/trilinos/packages/epetra/src/Epetra_Directory.h"
    "/home/tomii/simenv/trilinos/packages/epetra/src/Epetra_DistObject.h"
    "/home/tomii/simenv/trilinos/packages/epetra/src/Epetra_Distributor.h"
    "/home/tomii/simenv/trilinos/packages/epetra/src/Epetra_Export.h"
    "/home/tomii/simenv/trilinos/packages/epetra/src/Epetra_FECrsGraph.h"
    "/home/tomii/simenv/trilinos/packages/epetra/src/Epetra_FECrsMatrix.h"
    "/home/tomii/simenv/trilinos/packages/epetra/src/Epetra_FEVbrMatrix.h"
    "/home/tomii/simenv/trilinos/packages/epetra/src/Epetra_FEVector.h"
    "/home/tomii/simenv/trilinos/packages/epetra/src/Epetra_Flops.h"
    "/home/tomii/simenv/trilinos/packages/epetra/src/Epetra_Fortran_wrappers.h"
    "/home/tomii/simenv/trilinos/packages/epetra/src/Epetra_GIDTypeSerialDenseVector.h"
    "/home/tomii/simenv/trilinos/packages/epetra/src/Epetra_GIDTypeVector.h"
    "/home/tomii/simenv/trilinos/packages/epetra/src/Epetra_HashTable.h"
    "/home/tomii/simenv/trilinos/packages/epetra/src/Epetra_Import.h"
    "/home/tomii/simenv/trilinos/packages/epetra/src/Epetra_Import_Util.h"
    "/home/tomii/simenv/trilinos/packages/epetra/src/Epetra_IntSerialDenseMatrix.h"
    "/home/tomii/simenv/trilinos/packages/epetra/src/Epetra_IntSerialDenseVector.h"
    "/home/tomii/simenv/trilinos/packages/epetra/src/Epetra_IntVector.h"
    "/home/tomii/simenv/trilinos/packages/epetra/src/Epetra_InvOperator.h"
    "/home/tomii/simenv/trilinos/packages/epetra/src/Epetra_JadMatrix.h"
    "/home/tomii/simenv/trilinos/packages/epetra/src/Epetra_LAPACK.h"
    "/home/tomii/simenv/trilinos/packages/epetra/src/Epetra_LAPACK_wrappers.h"
    "/home/tomii/simenv/trilinos/packages/epetra/src/Epetra_LinearProblem.h"
    "/home/tomii/simenv/trilinos/packages/epetra/src/Epetra_LocalMap.h"
    "/home/tomii/simenv/trilinos/packages/epetra/src/Epetra_Map.h"
    "/home/tomii/simenv/trilinos/packages/epetra/src/Epetra_MapColoring.h"
    "/home/tomii/simenv/trilinos/packages/epetra/src/Epetra_MultiVector.h"
    "/home/tomii/simenv/trilinos/packages/epetra/src/Epetra_Object.h"
    "/home/tomii/simenv/trilinos/packages/epetra/src/Epetra_OffsetIndex.h"
    "/home/tomii/simenv/trilinos/packages/epetra/src/Epetra_Operator.h"
    "/home/tomii/simenv/trilinos/packages/epetra/src/Epetra_RowMatrix.h"
    "/home/tomii/simenv/trilinos/packages/epetra/src/Epetra_RowMatrixTransposer.h"
    "/home/tomii/simenv/trilinos/packages/epetra/src/Epetra_SerialComm.h"
    "/home/tomii/simenv/trilinos/packages/epetra/src/Epetra_SerialCommData.h"
    "/home/tomii/simenv/trilinos/packages/epetra/src/Epetra_SerialDenseMatrix.h"
    "/home/tomii/simenv/trilinos/packages/epetra/src/Epetra_SerialDenseOperator.h"
    "/home/tomii/simenv/trilinos/packages/epetra/src/Epetra_SerialDenseSVD.h"
    "/home/tomii/simenv/trilinos/packages/epetra/src/Epetra_SerialDenseSolver.h"
    "/home/tomii/simenv/trilinos/packages/epetra/src/Epetra_SerialDenseVector.h"
    "/home/tomii/simenv/trilinos/packages/epetra/src/Epetra_SerialDistributor.h"
    "/home/tomii/simenv/trilinos/packages/epetra/src/Epetra_SerialSpdDenseSolver.h"
    "/home/tomii/simenv/trilinos/packages/epetra/src/Epetra_SerialSymDenseMatrix.h"
    "/home/tomii/simenv/trilinos/packages/epetra/src/Epetra_SrcDistObject.h"
    "/home/tomii/simenv/trilinos/packages/epetra/src/Epetra_Time.h"
    "/home/tomii/simenv/trilinos/packages/epetra/src/Epetra_Util.h"
    "/home/tomii/simenv/trilinos/packages/epetra/src/Epetra_VbrMatrix.h"
    "/home/tomii/simenv/trilinos/packages/epetra/src/Epetra_VbrRowMatrix.h"
    "/home/tomii/simenv/trilinos/packages/epetra/src/Epetra_Vector.h"
    "/home/tomii/simenv/trilinos/packages/epetra/src/Epetra_Version.h"
    "/home/tomii/simenv/trilinos/packages/epetra/src/Epetra_LongLongSerialDenseMatrix.h"
    "/home/tomii/simenv/trilinos/packages/epetra/src/Epetra_LongLongSerialDenseVector.h"
    "/home/tomii/simenv/trilinos/packages/epetra/src/Epetra_LongLongVector.h"
    "/home/tomii/simenv/trilinos/packages/epetra/src/Epetra_MpiComm.h"
    "/home/tomii/simenv/trilinos/packages/epetra/src/Epetra_MpiCommData.h"
    "/home/tomii/simenv/trilinos/packages/epetra/src/Epetra_MpiDistributor.h"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Epetra")

