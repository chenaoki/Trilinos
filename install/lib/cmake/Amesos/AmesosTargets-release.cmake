#----------------------------------------------------------------
# Generated CMake target import file for configuration "RELEASE".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "amesos" for configuration "RELEASE"
set_property(TARGET amesos APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(amesos PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "C;CXX"
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "epetraext;epetra;teuchoskokkoscomm;teuchoskokkoscompat;teuchosremainder;teuchosnumerics;teuchoscomm;teuchosparameterlist;teuchoscore;/usr/lib/x86_64-linux-gnu/libumfpack.so;/usr/lib/x86_64-linux-gnu/libamd.so;/usr/lib/libparmetis.so;/usr/lib/libmetis.so"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libamesos.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS amesos )
list(APPEND _IMPORT_CHECK_FILES_FOR_amesos "${_IMPORT_PREFIX}/lib/libamesos.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
