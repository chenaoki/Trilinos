# Install script for directory: /home/tomii/simenv/trilinos/packages/ifpack/src

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

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Ifpack")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/home/tomii/simenv/trilinos/build/packages/ifpack/src/libifpack.a")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Ifpack")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Ifpack")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE FILES
    "/home/tomii/simenv/trilinos/build/packages/ifpack/src/Ifpack_config.h"
    "/home/tomii/simenv/trilinos/packages/ifpack/src/Ifpack_ConfigDefs.h"
    "/home/tomii/simenv/trilinos/packages/ifpack/src/Ifpack_Version.h"
    "/home/tomii/simenv/trilinos/packages/ifpack/src/Ifpack_IlukGraph.h"
    "/home/tomii/simenv/trilinos/packages/ifpack/src/Ifpack_CrsRiluk.h"
    "/home/tomii/simenv/trilinos/packages/ifpack/src/Ifpack_ILU.h"
    "/home/tomii/simenv/trilinos/packages/ifpack/src/Ifpack_IKLU.h"
    "/home/tomii/simenv/trilinos/packages/ifpack/src/Ifpack_IKLU_Utils.h"
    "/home/tomii/simenv/trilinos/packages/ifpack/src/Ifpack_ILUT.h"
    "/home/tomii/simenv/trilinos/packages/ifpack/src/Ifpack_OverlapGraph.h"
    "/home/tomii/simenv/trilinos/packages/ifpack/src/Ifpack_ScalingType.h"
    "/home/tomii/simenv/trilinos/packages/ifpack/src/Ifpack_ICT.h"
    "/home/tomii/simenv/trilinos/packages/ifpack/src/Ifpack_IC.h"
    "/home/tomii/simenv/trilinos/packages/ifpack/src/Ifpack_IC_Utils.h"
    "/home/tomii/simenv/trilinos/packages/ifpack/src/ifp_parameters.h"
    "/home/tomii/simenv/trilinos/packages/ifpack/src/Ifpack_Preconditioner.h"
    "/home/tomii/simenv/trilinos/packages/ifpack/src/Ifpack_CondestType.h"
    "/home/tomii/simenv/trilinos/packages/ifpack/src/Ifpack_Condest.h"
    "/home/tomii/simenv/trilinos/packages/ifpack/src/Ifpack.h"
    "/home/tomii/simenv/trilinos/packages/ifpack/src/Ifpack_DiagPreconditioner.h"
    "/home/tomii/simenv/trilinos/packages/ifpack/src/Ifpack_PointRelaxation.h"
    "/home/tomii/simenv/trilinos/packages/ifpack/src/Ifpack_BlockRelaxation.h"
    "/home/tomii/simenv/trilinos/packages/ifpack/src/Ifpack_Container.h"
    "/home/tomii/simenv/trilinos/packages/ifpack/src/Ifpack_SparseContainer.h"
    "/home/tomii/simenv/trilinos/packages/ifpack/src/Ifpack_DenseContainer.h"
    "/home/tomii/simenv/trilinos/packages/ifpack/src/Ifpack_TriDiContainer.h"
    "/home/tomii/simenv/trilinos/packages/ifpack/src/Ifpack_SerialTriDiMatrix.h"
    "/home/tomii/simenv/trilinos/packages/ifpack/src/Ifpack_SerialTriDiSolver.h"
    "/home/tomii/simenv/trilinos/packages/ifpack/src/Ifpack_AdditiveSchwarz.h"
    "/home/tomii/simenv/trilinos/packages/ifpack/src/Ifpack_LocalFilter.h"
    "/home/tomii/simenv/trilinos/packages/ifpack/src/Ifpack_NodeFilter.h"
    "/home/tomii/simenv/trilinos/packages/ifpack/src/Ifpack_DropFilter.h"
    "/home/tomii/simenv/trilinos/packages/ifpack/src/Ifpack_SparsityFilter.h"
    "/home/tomii/simenv/trilinos/packages/ifpack/src/Ifpack_ReorderFilter.h"
    "/home/tomii/simenv/trilinos/packages/ifpack/src/Ifpack_SingletonFilter.h"
    "/home/tomii/simenv/trilinos/packages/ifpack/src/Ifpack_DiagonalFilter.h"
    "/home/tomii/simenv/trilinos/packages/ifpack/src/Ifpack_Graph.h"
    "/home/tomii/simenv/trilinos/packages/ifpack/src/Ifpack_Graph_Epetra_RowMatrix.h"
    "/home/tomii/simenv/trilinos/packages/ifpack/src/Ifpack_Graph_Epetra_CrsGraph.h"
    "/home/tomii/simenv/trilinos/packages/ifpack/src/Ifpack_Partitioner.h"
    "/home/tomii/simenv/trilinos/packages/ifpack/src/Ifpack_OverlappingPartitioner.h"
    "/home/tomii/simenv/trilinos/packages/ifpack/src/Ifpack_LinePartitioner.h"
    "/home/tomii/simenv/trilinos/packages/ifpack/src/Ifpack_LinearPartitioner.h"
    "/home/tomii/simenv/trilinos/packages/ifpack/src/Ifpack_GreedyPartitioner.h"
    "/home/tomii/simenv/trilinos/packages/ifpack/src/Ifpack_METISPartitioner.h"
    "/home/tomii/simenv/trilinos/packages/ifpack/src/Ifpack_EquationPartitioner.h"
    "/home/tomii/simenv/trilinos/packages/ifpack/src/Ifpack_UserPartitioner.h"
    "/home/tomii/simenv/trilinos/packages/ifpack/src/Ifpack_Utils.h"
    "/home/tomii/simenv/trilinos/packages/ifpack/src/Ifpack_HashTable.h"
    "/home/tomii/simenv/trilinos/packages/ifpack/src/Ifpack_Reordering.h"
    "/home/tomii/simenv/trilinos/packages/ifpack/src/Ifpack_RCMReordering.h"
    "/home/tomii/simenv/trilinos/packages/ifpack/src/Ifpack_SPARSKIT.h"
    "/home/tomii/simenv/trilinos/packages/ifpack/src/Ifpack_Chebyshev.h"
    "/home/tomii/simenv/trilinos/packages/ifpack/src/Ifpack_Polynomial.h"
    "/home/tomii/simenv/trilinos/packages/ifpack/src/Ifpack_Krylov.h"
    "/home/tomii/simenv/trilinos/packages/ifpack/src/Ifpack_METISReordering.h"
    "/home/tomii/simenv/trilinos/packages/ifpack/src/Ifpack_OverlappingRowMatrix.h"
    "/home/tomii/simenv/trilinos/packages/ifpack/src/Ifpack_ValidParameters.h"
    "/home/tomii/simenv/trilinos/packages/ifpack/src/Ifpack_HIPS.h"
    "/home/tomii/simenv/trilinos/packages/ifpack/src/Ifpack_Hypre.h"
    "/home/tomii/simenv/trilinos/packages/ifpack/src/Ifpack_Euclid.h"
    "/home/tomii/simenv/trilinos/packages/ifpack/src/Ifpack_SILU.h"
    "/home/tomii/simenv/trilinos/packages/ifpack/src/Ifpack_IHSS.h"
    "/home/tomii/simenv/trilinos/packages/ifpack/src/Ifpack_SORa.h"
    "/home/tomii/simenv/trilinos/packages/ifpack/src/Ifpack_AMDReordering.h"
    "/home/tomii/simenv/trilinos/packages/ifpack/src/Ifpack_Amesos.h"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Ifpack")

