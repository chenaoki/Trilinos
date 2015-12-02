#----------------------------------------------------------------
# Generated CMake target import file for configuration "RELEASE".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "epetra" for configuration "RELEASE"
set_property(TARGET epetra APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(epetra PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX;Fortran"
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "teuchoskokkoscomm;teuchoskokkoscompat;teuchosremainder;teuchosnumerics;teuchoscomm;teuchosparameterlist;teuchoscore;/usr/lib/liblapack.so;/usr/lib/libblas.so"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libepetra.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS epetra )
list(APPEND _IMPORT_CHECK_FILES_FOR_epetra "${_IMPORT_PREFIX}/lib/libepetra.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
