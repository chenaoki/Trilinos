#----------------------------------------------------------------
# Generated CMake target import file for configuration "RELEASE".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "kokkostsqr" for configuration "RELEASE"
set_property(TARGET kokkostsqr APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(kokkostsqr PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "tpetraclassiclinalg;tpetraclassicnodeapi;tpetraclassic;teuchoskokkoscomm;teuchoskokkoscompat;teuchosremainder;teuchosnumerics;teuchoscomm;teuchosparameterlist;teuchoscore"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libkokkostsqr.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS kokkostsqr )
list(APPEND _IMPORT_CHECK_FILES_FOR_kokkostsqr "${_IMPORT_PREFIX}/lib/libkokkostsqr.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
