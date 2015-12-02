#----------------------------------------------------------------
# Generated CMake target import file for configuration "RELEASE".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "teuchoskokkoscompat" for configuration "RELEASE"
set_property(TARGET teuchoskokkoscompat APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(teuchoskokkoscompat PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "teuchosparameterlist;teuchoscore;kokkoscore"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libteuchoskokkoscompat.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS teuchoskokkoscompat )
list(APPEND _IMPORT_CHECK_FILES_FOR_teuchoskokkoscompat "${_IMPORT_PREFIX}/lib/libteuchoskokkoscompat.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
