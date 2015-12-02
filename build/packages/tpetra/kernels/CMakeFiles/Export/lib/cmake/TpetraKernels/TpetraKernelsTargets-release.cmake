#----------------------------------------------------------------
# Generated CMake target import file for configuration "RELEASE".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "tpetrakernels" for configuration "RELEASE"
set_property(TARGET tpetrakernels APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(tpetrakernels PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "teuchoscomm;teuchoscore;kokkoscontainers;kokkoscore"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libtpetrakernels.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS tpetrakernels )
list(APPEND _IMPORT_CHECK_FILES_FOR_tpetrakernels "${_IMPORT_PREFIX}/lib/libtpetrakernels.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
