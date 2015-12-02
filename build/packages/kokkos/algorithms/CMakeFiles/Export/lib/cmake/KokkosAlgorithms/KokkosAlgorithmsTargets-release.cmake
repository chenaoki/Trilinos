#----------------------------------------------------------------
# Generated CMake target import file for configuration "RELEASE".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "kokkosalgorithms" for configuration "RELEASE"
set_property(TARGET kokkosalgorithms APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(kokkosalgorithms PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "kokkoscore"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libkokkosalgorithms.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS kokkosalgorithms )
list(APPEND _IMPORT_CHECK_FILES_FOR_kokkosalgorithms "${_IMPORT_PREFIX}/lib/libkokkosalgorithms.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
