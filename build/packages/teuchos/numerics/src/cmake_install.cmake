# Install script for directory: /home/tomii/simenv/trilinos/packages/teuchos/numerics/src

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

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "TeuchosNumerics")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/home/tomii/simenv/trilinos/build/packages/teuchos/numerics/src/libteuchosnumerics.a")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "TeuchosNumerics")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "TeuchosNumerics")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE FILES
    "/home/tomii/simenv/trilinos/packages/teuchos/numerics/src/Teuchos_PromotionTraits.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/numerics/src/Teuchos_BLAS_wrappers.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/numerics/src/Teuchos_MatrixMarket_SymmetrizingAdder.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/numerics/src/Teuchos_SerialDenseHelpers.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/numerics/src/Teuchos_MatrixMarket_SetScientific.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/numerics/src/Teuchos_MatrixMarket_Raw_Checker.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/numerics/src/Teuchos_MatrixMarket_Raw_Writer.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/numerics/src/Teuchos_SerialSymDenseMatrix.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/numerics/src/Teuchos_LAPACK_wrappers.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/numerics/src/Teuchos_Flops.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/numerics/src/Teuchos_ExpandScalarTypeMacros.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/numerics/src/Teuchos_BLAS.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/numerics/src/Teuchos_SerialBandDenseMatrix.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/numerics/src/Teuchos_SerialSpdDenseSolver.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/numerics/src/Teuchos_BLAS_types.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/numerics/src/Teuchos_SerialQRDenseSolver.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/numerics/src/Teuchos_MatrixMarket_Banner.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/numerics/src/Teuchos_MatrixMarket_Raw_Reader.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/numerics/src/Teuchos_MatrixMarket_split.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/numerics/src/Teuchos_MatrixMarket_CoordDataReader.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/numerics/src/Teuchos_SerialBandDenseSolver.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/numerics/src/Teuchos_Object.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/numerics/src/Teuchos_MatrixMarket_Raw_Adder.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/numerics/src/Teuchos_SerialTriDiMatrix.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/numerics/src/Teuchos_MatrixMarket_assignScalar.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/numerics/src/Teuchos_SerialDenseSolver.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/numerics/src/Teuchos_CompObject.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/numerics/src/Teuchos_MatrixMarket_generic.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/numerics/src/Teuchos_PolynomialDecl.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/numerics/src/Teuchos_Polynomial.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/numerics/src/Teuchos_Details_Lapack128.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/numerics/src/Teuchos_PolynomialTraits.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/numerics/src/Teuchos_SerialDenseMatrix.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/numerics/src/Teuchos_DataAccess.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/numerics/src/Teuchos_LAPACK.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/numerics/src/Teuchos_SerialDenseVector.hpp"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "TeuchosNumerics")

