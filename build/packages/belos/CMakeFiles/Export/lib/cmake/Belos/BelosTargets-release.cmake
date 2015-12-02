#----------------------------------------------------------------
# Generated CMake target import file for configuration "RELEASE".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "belos" for configuration "RELEASE"
set_property(TARGET belos APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(belos PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "tpetraext;tpetrainout;tpetra;kokkostsqr;tpetrakernels;tpetraclassiclinalg;tpetraclassicnodeapi;tpetraclassic;epetra;teuchoskokkoscomm;teuchoskokkoscompat;teuchosremainder;teuchosnumerics;teuchoscomm;teuchosparameterlist;teuchoscore"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libbelos.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS belos )
list(APPEND _IMPORT_CHECK_FILES_FOR_belos "${_IMPORT_PREFIX}/lib/libbelos.a" )

# Import target "belosepetra" for configuration "RELEASE"
set_property(TARGET belosepetra APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(belosepetra PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "belos"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libbelosepetra.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS belosepetra )
list(APPEND _IMPORT_CHECK_FILES_FOR_belosepetra "${_IMPORT_PREFIX}/lib/libbelosepetra.a" )

# Import target "belostpetra" for configuration "RELEASE"
set_property(TARGET belostpetra APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(belostpetra PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "belos"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libbelostpetra.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS belostpetra )
list(APPEND _IMPORT_CHECK_FILES_FOR_belostpetra "${_IMPORT_PREFIX}/lib/libbelostpetra.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
