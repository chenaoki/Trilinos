# Install script for directory: /home/tomii/simenv/trilinos/packages/teuchos/parameterlist/src

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

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "TeuchosParameterList")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/home/tomii/simenv/trilinos/build/packages/teuchos/parameterlist/src/libteuchosparameterlist.a")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "TeuchosParameterList")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "TeuchosParameterList")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE FILES
    "/home/tomii/simenv/trilinos/packages/teuchos/parameterlist/src/Teuchos_DependencyXMLConverterDB.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/parameterlist/src/Teuchos_XMLFunctionObjectExceptions.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/parameterlist/src/Teuchos_TreeBuildingXMLHandler.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/parameterlist/src/Teuchos_ParameterList.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/parameterlist/src/Teuchos_ParameterEntryXMLConverter.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/parameterlist/src/Teuchos_XMLInputStream.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/parameterlist/src/Teuchos_XMLParameterListReader.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/parameterlist/src/Teuchos_VerbosityLevelCommandLineProcessorHelpers.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/parameterlist/src/Teuchos_XMLDependencyExceptions.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/parameterlist/src/Teuchos_StandardFunctionObjects.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/parameterlist/src/Teuchos_ValidatorFactory.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/parameterlist/src/Teuchos_StandardDependencies.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/parameterlist/src/Teuchos_StandardParameterEntryXMLConverters.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/parameterlist/src/Teuchos_ParameterListExceptions.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/parameterlist/src/Teuchos_Dependency.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/parameterlist/src/Teuchos_XMLParameterListWriter.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/parameterlist/src/Teuchos_DependencyXMLConverter.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/parameterlist/src/Teuchos_ObjectBuilder.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/parameterlist/src/Teuchos_Condition.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/parameterlist/src/Teuchos_DummyObjectGetter.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/parameterlist/src/Teuchos_XMLParameterListExceptions.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/parameterlist/src/Teuchos_FunctionObject.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/parameterlist/src/Teuchos_StandardConditions.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/parameterlist/src/Teuchos_ValidatorXMLConverter.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/parameterlist/src/Teuchos_XMLInputSource.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/parameterlist/src/Teuchos_StandardConditionXMLConverters.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/parameterlist/src/Teuchos_ParameterListNonAcceptor.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/parameterlist/src/Teuchos_VerboseObjectParameterListHelpers.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/parameterlist/src/Teuchos_XMLParser.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/parameterlist/src/Teuchos_StringInputSource.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/parameterlist/src/Teuchos_StringInputStream.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/parameterlist/src/Teuchos_DependencySheet.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/parameterlist/src/Teuchos_ParameterListAcceptorDefaultBase.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/parameterlist/src/Teuchos_ExpatHandlerAdapter.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/parameterlist/src/Teuchos_XMLParameterListCoreHelpers.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/parameterlist/src/Teuchos_ParameterEntryValidator.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/parameterlist/src/Teuchos_ParameterEntryXMLConverterDB.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/parameterlist/src/Teuchos_FunctionObjectXMLConverter.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/parameterlist/src/Teuchos_XMLPerfTestArchive.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/parameterlist/src/Teuchos_XMLObject.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/parameterlist/src/Teuchos_InvalidConditionException.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/parameterlist/src/Teuchos_StandardFunctionObjectXMLConverters.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/parameterlist/src/Teuchos_FunctionObjectXMLConverterDB.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/parameterlist/src/Teuchos_StandardDependencyXMLConverters.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/parameterlist/src/Teuchos_ConditionXMLConverter.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/parameterlist/src/Teuchos_XMLConditionExceptions.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/parameterlist/src/Teuchos_StandardValidatorXMLConverters.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/parameterlist/src/Teuchos_ParameterListAcceptorHelpers.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/parameterlist/src/Teuchos_ParameterListAcceptor.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/parameterlist/src/Teuchos_StandardParameterEntryValidators.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/parameterlist/src/Teuchos_InvalidDependencyException.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/parameterlist/src/Teuchos_ConditionXMLConverterDB.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/parameterlist/src/Teuchos_ParameterEntry.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/parameterlist/src/Teuchos_ParameterXMLFileReader.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/parameterlist/src/Teuchos_FileInputStream.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/parameterlist/src/Teuchos_ValidatorXMLConverterDB.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/parameterlist/src/Teuchos_FileInputSource.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/parameterlist/src/Teuchos_ValidatorMaps.hpp"
    "/home/tomii/simenv/trilinos/packages/teuchos/parameterlist/src/Teuchos_XMLObjectImplem.hpp"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "TeuchosParameterList")

