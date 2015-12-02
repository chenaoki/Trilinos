#----------------------------------------------------------------
# Generated CMake target import file for configuration "RELEASE".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "aztecoo" for configuration "RELEASE"
set_property(TARGET aztecoo APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(aztecoo PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "C;CXX;Fortran"
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "triutils;epetra;teuchoskokkoscomm;teuchoskokkoscompat;teuchosremainder;teuchosnumerics;teuchoscomm;teuchosparameterlist;teuchoscore"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libaztecoo.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS aztecoo )
list(APPEND _IMPORT_CHECK_FILES_FOR_aztecoo "${_IMPORT_PREFIX}/lib/libaztecoo.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
