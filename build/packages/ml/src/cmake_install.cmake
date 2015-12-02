# Install script for directory: /home/tomii/simenv/trilinos/packages/ml/src

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

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "ML")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/home/tomii/simenv/trilinos/build/packages/ml/src/libml.a")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "ML")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "ML")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE FILES
    "/home/tomii/simenv/trilinos/build/packages/ml/src/ml_config.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/Include/ml_defs.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/Comm/ml_comm.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/Include/ml_include.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/Include/ml_common.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/Coarsen/ml_amg_genP.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/Coarsen/ml_amg.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/Coarsen/ml_agg_genP.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/Coarsen/ml_agg_min_energy.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/Coarsen/ml_check.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/Coarsen/ml_aggregate.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/Coarsen/ml_ggraph.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/Coarsen/ml_parmetis_constants.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/FEGrid/ml_mapper.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/FEGrid/ml_gridagx.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/FEGrid/ml_pde.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/FEGrid/ml_bdrypts.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/Coarsen/ml_agg_reitzinger.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/Coarsen/ml_agg_METIS.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/Coarsen/ml_agg_user.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/Coarsen/ml_agg_VBMETIS.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/Coarsen/ml_agg_Zoltan.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/Coarsen/ml_agg_ParMETIS.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/Coarsen/ml_qr_fix.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/Coarsen/ml_qr_fix.hpp"
    "/home/tomii/simenv/trilinos/packages/ml/src/FEGrid/ml_gridfunc.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/FEGrid/ml_setup.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/FEGrid/ml_elementagx.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/FEGrid/ml_grid.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/Main/ml_struct.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/Main/ml_seg_precond.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/Main/ml_1level.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/Main/mli_solver.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/Main/ml_ggb.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/Main/ml_viz_stats.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/Comm/ml_comminfoagx.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/Comm/ml_comminfoop.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/Smoother/ml_csolve.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/Smoother/ml_mls.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/Smoother/ml_smoother.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/Smoother/ml_solver.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/Smoother/ml_superlu.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/Smoother/ml_xxt.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/Smoother/ml_xyt.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/Krylov/ml_bicgstabl.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/Krylov/ml_cg.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/Krylov/ml_gmres.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/Krylov/ml_krylov.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/Operator/ml_mat_formats.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/Operator/ml_operatoragx.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/Operator/ml_operator_blockmat.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/Operator/ml_operator.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/Operator/ml_op_utils.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/Operator/ml_rap.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/Utils/ml_aztec_utils.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/Utils/ml_epetra_utils.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/Utils/ml_utils.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/Utils/ml_memory.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/Utils/ml_agg_info.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/Utils/ml_aztec_lapack.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/Utils/ml_rbm.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/Utils/ml_read_utils.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/Utils/ml_superlu_lapack.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/Utils/ml_epetra_operator.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/Utils/ml_twogrid_analysis.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/Utils/ml_intlist.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/Utils/ml_vec.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/Utils/ml_lapack.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/Utils/ml_eigf2c.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/Utils/ml_vampir.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/Utils/ml_viz_opendx.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/Utils/ml_viz_xyz.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/Utils/ml_viz_vtk.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/Utils/ml_amesos.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/Utils/ml_amesos_wrap.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/Utils/ml_ifpack.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/Utils/ml_ifpack_wrap.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/Utils/ml_ifpack_epetra_wrap.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/Utils/ml_self.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/Utils/ml_self_wrap.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/Utils/ml_epetra_preconditioner.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/Utils/ml_anasazi.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/Utils/ml_epetra.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/Utils/ml_MultiLevelOperator.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/Utils/ml_MultiLevelPreconditioner.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/Utils/ml_RowMatrix.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/Utils/ml_FilterType.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/Utils/ml_DD_prec.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/Utils/ml_Ifpack_ML.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/Utils/ml_Epetra_wrap_CrsGraph_as_RowMatrix.H"
    "/home/tomii/simenv/trilinos/packages/ml/src/Utils/ml_Preconditioner.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/Utils/Epetra_Operator_With_MatMat.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/Utils/Epetra_Multi_CrsMatrix.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/Utils/ml_ValidateParameters.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/Utils/ml_petsc.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/RefMaxwell/ml_RefMaxwell_Utils.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/RefMaxwell/ml_EdgeMatrixFreePreconditioner.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/RefMaxwell/ml_FaceMatrixFreePreconditioner.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/RefMaxwell/ml_RefMaxwell_11_Operator.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/RefMaxwell/ml_RefMaxwell.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/RefMaxwell/ml_GradDiv.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/MatrixFree/ml_MatrixFreePreconditioner.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/MatrixFree/ml_ElementByElement_SingleElement.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/MLAPI/MLAPI.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/MLAPI/MLAPI_Aggregation.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/MLAPI/MLAPI_BaseObject.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/MLAPI/MLAPI_BaseOperator.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/MLAPI/MLAPI_CompObject.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/MLAPI/MLAPI_Defaults.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/MLAPI/MLAPI_Eig.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/MLAPI/MLAPI_EpetraBaseOperator.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/MLAPI/MLAPI_Expressions.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/MLAPI/MLAPI_Gallery.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/MLAPI/MLAPI_InverseOperator.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/MLAPI/MLAPI_LoadBalanceInverseOperator.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/MLAPI/MLAPI_Krylov.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/MLAPI/MLAPI_MATLABStream.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/MLAPI/MLAPI_SerialMatrix.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/MLAPI/MLAPI_DistributedMatrix.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/MLAPI/MLAPI_MultiLevelSA.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/MLAPI/MLAPI_MultiLevelAdaptiveSA.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/MLAPI/MLAPI_MultiVector.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/MLAPI/MLAPI_MultiVector_Utils.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/MLAPI/MLAPI_Operator_Box.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/MLAPI/MLAPI_Operator.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/MLAPI/MLAPI_LoadBalanceOperator.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/MLAPI/MLAPI_Operator_Utils.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/MLAPI/MLAPI_Space.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/MLAPI/MLAPI_TimeObject.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/MLAPI/MLAPI_Workspace.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/MLAPI/MLAPI_Error.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/MLAPI/MLAPI_SAMIS.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/MLAPI/MLAPI_LinearCombinations.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/MLAPI/MLAPI_BaseLinearCombination.h"
    "/home/tomii/simenv/trilinos/packages/ml/src/LevelWrap/ml_LevelWrap.h"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "ML")

