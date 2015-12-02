#----------------------------------------------------------------
# Generated CMake target import file for configuration "RELEASE".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "zoltan" for configuration "RELEASE"
set_property(TARGET zoltan APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(zoltan PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "C"
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "m;/usr/lib/libparmetis.so;/usr/lib/libmetis.so"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libzoltan.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS zoltan )
list(APPEND _IMPORT_CHECK_FILES_FOR_zoltan "${_IMPORT_PREFIX}/lib/libzoltan.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
