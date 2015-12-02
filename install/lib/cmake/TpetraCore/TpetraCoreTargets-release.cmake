#----------------------------------------------------------------
# Generated CMake target import file for configuration "RELEASE".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "tpetra" for configuration "RELEASE"
set_property(TARGET tpetra APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(tpetra PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "kokkostsqr;tpetrakernels;tpetraclassiclinalg;tpetraclassicnodeapi;tpetraclassic;epetra;teuchoskokkoscomm;teuchoskokkoscompat;teuchosremainder;teuchosnumerics;teuchoscomm;teuchosparameterlist;teuchoscore;teuchoskokkoscomm;teuchoskokkoscompat;kokkosalgorithms;kokkoscontainers;kokkoscore"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libtpetra.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS tpetra )
list(APPEND _IMPORT_CHECK_FILES_FOR_tpetra "${_IMPORT_PREFIX}/lib/libtpetra.a" )

# Import target "tpetrainout" for configuration "RELEASE"
set_property(TARGET tpetrainout APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(tpetrainout PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "tpetra"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libtpetrainout.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS tpetrainout )
list(APPEND _IMPORT_CHECK_FILES_FOR_tpetrainout "${_IMPORT_PREFIX}/lib/libtpetrainout.a" )

# Import target "tpetraext" for configuration "RELEASE"
set_property(TARGET tpetraext APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(tpetraext PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "tpetra"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libtpetraext.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS tpetraext )
list(APPEND _IMPORT_CHECK_FILES_FOR_tpetraext "${_IMPORT_PREFIX}/lib/libtpetraext.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
