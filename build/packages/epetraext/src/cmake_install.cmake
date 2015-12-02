# Install script for directory: /home/tomii/simenv/trilinos/packages/epetraext/src

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

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "EpetraExt")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/home/tomii/simenv/trilinos/build/packages/epetraext/src/libepetraext.a")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "EpetraExt")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "EpetraExt")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE FILES
    "/home/tomii/simenv/trilinos/build/packages/epetraext/src/EpetraExt_config.h"
    "/home/tomii/simenv/trilinos/packages/epetraext/src/EpetraExt_ConfigDefs.h"
    "/home/tomii/simenv/trilinos/packages/epetraext/src/EpetraExt_MMHelpers.h"
    "/home/tomii/simenv/trilinos/packages/epetraext/src/EpetraExt_MatrixMatrix.h"
    "/home/tomii/simenv/trilinos/packages/epetraext/src/EpetraExt_ProductOperator.h"
    "/home/tomii/simenv/trilinos/packages/epetraext/src/EpetraExt_TimedEpetraOperator.hpp"
    "/home/tomii/simenv/trilinos/packages/epetraext/src/EpetraExt_Version.h"
    "/home/tomii/simenv/trilinos/packages/epetraext/src/transform/EpetraExt_SubCopy_CrsMatrix.h"
    "/home/tomii/simenv/trilinos/packages/epetraext/src/transform/EpetraExt_Transform.h"
    "/home/tomii/simenv/trilinos/packages/epetraext/src/transform/EpetraExt_Transform_Composite.h"
    "/home/tomii/simenv/trilinos/packages/epetraext/src/transform/EpetraExt_Permutation.h"
    "/home/tomii/simenv/trilinos/packages/epetraext/src/transform/EpetraExt_Permutation_impl.h"
    "/home/tomii/simenv/trilinos/packages/epetraext/src/transform/EpetraExt_LPTrans_From_GraphTrans.h"
    "/home/tomii/simenv/trilinos/packages/epetraext/src/transform/EpetraExt_LPTrans_From_MatrixTrans.h"
    "/home/tomii/simenv/trilinos/packages/epetraext/src/transform/EpetraExt_View_CrsGraph.h"
    "/home/tomii/simenv/trilinos/packages/epetraext/src/transform/EpetraExt_View_CrsMatrix.h"
    "/home/tomii/simenv/trilinos/packages/epetraext/src/transform/EpetraExt_View_MultiVector.h"
    "/home/tomii/simenv/trilinos/packages/epetraext/src/transform/EpetraExt_Transpose_CrsGraph.h"
    "/home/tomii/simenv/trilinos/packages/epetraext/src/transform/EpetraExt_Transpose_RowMatrix.h"
    "/home/tomii/simenv/trilinos/packages/epetraext/src/transform/EpetraExt_Scale_LinearProblem.h"
    "/home/tomii/simenv/trilinos/packages/epetraext/src/transform/EpetraExt_CrsSingletonFilter_LinearProblem.h"
    "/home/tomii/simenv/trilinos/packages/epetraext/src/transform/EpetraExt_Overlap_CrsGraph.h"
    "/home/tomii/simenv/trilinos/packages/epetraext/src/transform/EpetraExt_Reindex_CrsMatrix.h"
    "/home/tomii/simenv/trilinos/packages/epetraext/src/transform/EpetraExt_Reindex_MultiVector.h"
    "/home/tomii/simenv/trilinos/packages/epetraext/src/transform/EpetraExt_Reindex_LinearProblem.h"
    "/home/tomii/simenv/trilinos/packages/epetraext/src/transform/EpetraExt_Reindex_LinearProblem2.h"
    "/home/tomii/simenv/trilinos/packages/epetraext/src/transform/EpetraExt_SolverMap_CrsMatrix.h"
    "/home/tomii/simenv/trilinos/packages/epetraext/src/transform/EpetraExt_SolverMap_LinearProblem.h"
    "/home/tomii/simenv/trilinos/packages/epetraext/src/transform/EpetraExt_BlockAdjacencyGraph.h"
    "/home/tomii/simenv/trilinos/packages/epetraext/src/inout/EpetraExt_mmio.h"
    "/home/tomii/simenv/trilinos/packages/epetraext/src/inout/EpetraExt_OperatorOut.h"
    "/home/tomii/simenv/trilinos/packages/epetraext/src/inout/EpetraExt_RowMatrixOut.h"
    "/home/tomii/simenv/trilinos/packages/epetraext/src/inout/EpetraExt_MultiVectorOut.h"
    "/home/tomii/simenv/trilinos/packages/epetraext/src/inout/EpetraExt_VectorOut.h"
    "/home/tomii/simenv/trilinos/packages/epetraext/src/inout/EpetraExt_BlockMapOut.h"
    "/home/tomii/simenv/trilinos/packages/epetraext/src/inout/EpetraExt_BlockMapIn.h"
    "/home/tomii/simenv/trilinos/packages/epetraext/src/inout/EpetraExt_CrsMatrixIn.h"
    "/home/tomii/simenv/trilinos/packages/epetraext/src/inout/EpetraExt_MultiVectorIn.h"
    "/home/tomii/simenv/trilinos/packages/epetraext/src/inout/EpetraExt_VectorIn.h"
    "/home/tomii/simenv/trilinos/packages/epetraext/src/inout/EpetraExt_Exception.h"
    "/home/tomii/simenv/trilinos/packages/epetraext/src/inout/EpetraExt_Utils.h"
    "/home/tomii/simenv/trilinos/packages/epetraext/src/inout/EpetraExt_XMLReader.h"
    "/home/tomii/simenv/trilinos/packages/epetraext/src/inout/EpetraExt_XMLWriter.h"
    "/home/tomii/simenv/trilinos/packages/epetraext/src/inout/EpetraExt_HDF5.h"
    "/home/tomii/simenv/trilinos/packages/epetraext/src/inout/EpetraExt_HDF5_Handle.h"
    "/home/tomii/simenv/trilinos/packages/epetraext/src/inout/EpetraExt_DistArray.h"
    "/home/tomii/simenv/trilinos/packages/epetraext/src/inout/EpetraExt_readEpetraLinearSystem.h"
    "/home/tomii/simenv/trilinos/packages/epetraext/src/coloring/EpetraExt_MapColoring.h"
    "/home/tomii/simenv/trilinos/packages/epetraext/src/coloring/EpetraExt_TCrsGraph_MapColoringIndex.h"
    "/home/tomii/simenv/trilinos/packages/epetraext/src/coloring/EpetraExt_MapColoringIndex.h"
    "/home/tomii/simenv/trilinos/packages/epetraext/src/model_evaluator/EpetraExt_ModelEvaluator.h"
    "/home/tomii/simenv/trilinos/packages/epetraext/src/model_evaluator/EpetraExt_ModelEvaluatorScalingTools.h"
    "/home/tomii/simenv/trilinos/packages/epetraext/src/model_evaluator/EpetraExt_PolynomialVectorTraits.h"
    "/home/tomii/simenv/trilinos/packages/epetraext/src/block/EpetraExt_BlockCrsMatrix.h"
    "/home/tomii/simenv/trilinos/packages/epetraext/src/block/EpetraExt_BlockMultiVector.h"
    "/home/tomii/simenv/trilinos/packages/epetraext/src/block/EpetraExt_BlockVector.h"
    "/home/tomii/simenv/trilinos/packages/epetraext/src/block/EpetraExt_BlockUtility.h"
    "/home/tomii/simenv/trilinos/packages/epetraext/src/block/EpetraExt_MultiComm.h"
    "/home/tomii/simenv/trilinos/packages/epetraext/src/block/EpetraExt_MultiPointModelEvaluator.h"
    "/home/tomii/simenv/trilinos/packages/epetraext/src/block/EpetraExt_MultiSerialComm.h"
    "/home/tomii/simenv/trilinos/packages/epetraext/src/block/EpetraExt_BlockDiagMatrix.h"
    "/home/tomii/simenv/trilinos/packages/epetraext/src/block/EpetraExt_PointToBlockDiagPermute.h"
    "/home/tomii/simenv/trilinos/packages/epetraext/src/block/EpetraExt_MultiMpiComm.h"
    "/home/tomii/simenv/trilinos/packages/epetraext/src/restrict/EpetraExt_RestrictedMultiVectorWrapper.h"
    "/home/tomii/simenv/trilinos/packages/epetraext/src/restrict/EpetraExt_RestrictedCrsMatrixWrapper.h"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "EpetraExt")

