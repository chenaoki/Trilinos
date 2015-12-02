#----------------------------------------------------------------
# Generated CMake target import file for configuration "RELEASE".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "thyracore" for configuration "RELEASE"
set_property(TARGET thyracore APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(thyracore PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "rtop;teuchoskokkoscomm;teuchoskokkoscompat;teuchosremainder;teuchosnumerics;teuchoscomm;teuchosparameterlist;teuchoscore"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libthyracore.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS thyracore )
list(APPEND _IMPORT_CHECK_FILES_FOR_thyracore "${_IMPORT_PREFIX}/lib/libthyracore.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
