#----------------------------------------------------------------
# Generated CMake target import file for configuration "RELEASE".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "epetraext" for configuration "RELEASE"
set_property(TARGET epetraext APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(epetraext PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "triutils;epetra;teuchoskokkoscomm;teuchoskokkoscompat;teuchosremainder;teuchosnumerics;teuchoscomm;teuchosparameterlist;teuchoscore;/usr/lib/x86_64-linux-gnu/libumfpack.so;/usr/lib/x86_64-linux-gnu/libamd.so;/usr/lib/x86_64-linux-gnu/libhdf5.so;/usr/lib/x86_64-linux-gnu/libz.so"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libepetraext.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS epetraext )
list(APPEND _IMPORT_CHECK_FILES_FOR_epetraext "${_IMPORT_PREFIX}/lib/libepetraext.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
