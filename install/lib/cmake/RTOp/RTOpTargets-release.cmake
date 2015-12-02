#----------------------------------------------------------------
# Generated CMake target import file for configuration "RELEASE".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "rtop" for configuration "RELEASE"
set_property(TARGET rtop APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(rtop PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "C;CXX"
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "teuchoskokkoscomm;teuchoskokkoscompat;teuchosremainder;teuchosnumerics;teuchoscomm;teuchosparameterlist;teuchoscore"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/librtop.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS rtop )
list(APPEND _IMPORT_CHECK_FILES_FOR_rtop "${_IMPORT_PREFIX}/lib/librtop.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
