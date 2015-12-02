#----------------------------------------------------------------
# Generated CMake target import file for configuration "RELEASE".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "teuchosparameterlist" for configuration "RELEASE"
set_property(TARGET teuchosparameterlist APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(teuchosparameterlist PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "teuchoscore"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libteuchosparameterlist.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS teuchosparameterlist )
list(APPEND _IMPORT_CHECK_FILES_FOR_teuchosparameterlist "${_IMPORT_PREFIX}/lib/libteuchosparameterlist.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
