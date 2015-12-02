#----------------------------------------------------------------
# Generated CMake target import file for configuration "RELEASE".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "tpi" for configuration "RELEASE"
set_property(TARGET tpi APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(tpi PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "C"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libtpi.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS tpi )
list(APPEND _IMPORT_CHECK_FILES_FOR_tpi "${_IMPORT_PREFIX}/lib/libtpi.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
