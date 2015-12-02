#----------------------------------------------------------------
# Generated CMake target import file for configuration "RELEASE".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "triutils" for configuration "RELEASE"
set_property(TARGET triutils APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(triutils PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "epetra"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libtriutils.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS triutils )
list(APPEND _IMPORT_CHECK_FILES_FOR_triutils "${_IMPORT_PREFIX}/lib/libtriutils.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
