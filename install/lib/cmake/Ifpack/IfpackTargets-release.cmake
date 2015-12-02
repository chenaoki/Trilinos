#----------------------------------------------------------------
# Generated CMake target import file for configuration "RELEASE".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "ifpack" for configuration "RELEASE"
set_property(TARGET ifpack APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(ifpack PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "C;CXX"
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "amesos;aztecoo;epetraext;epetra;teuchoskokkoscomm;teuchoskokkoscompat;teuchosremainder;teuchosnumerics;teuchoscomm;teuchosparameterlist;teuchoscore"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libifpack.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS ifpack )
list(APPEND _IMPORT_CHECK_FILES_FOR_ifpack "${_IMPORT_PREFIX}/lib/libifpack.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
