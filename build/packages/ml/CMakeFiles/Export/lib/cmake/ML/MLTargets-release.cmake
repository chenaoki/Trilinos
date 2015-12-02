#----------------------------------------------------------------
# Generated CMake target import file for configuration "RELEASE".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "ml" for configuration "RELEASE"
set_property(TARGET ml APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(ml PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "C;CXX"
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "ifpack;amesos;aztecoo;epetraext;zoltan;epetra;teuchoskokkoscomm;teuchoskokkoscompat;teuchosremainder;teuchosnumerics;teuchoscomm;teuchosparameterlist;teuchoscore;/usr/lib/libparmetis.so;/usr/lib/libmetis.so;/usr/lib/liblapack.so;/usr/lib/libblas.so"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libml.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS ml )
list(APPEND _IMPORT_CHECK_FILES_FOR_ml "${_IMPORT_PREFIX}/lib/libml.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
