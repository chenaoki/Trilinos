#----------------------------------------------------------------
# Generated CMake target import file for configuration "RELEASE".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "kokkoscore" for configuration "RELEASE"
set_property(TARGET kokkoscore APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(kokkoscore PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libkokkoscore.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS kokkoscore )
list(APPEND _IMPORT_CHECK_FILES_FOR_kokkoscore "${_IMPORT_PREFIX}/lib/libkokkoscore.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
