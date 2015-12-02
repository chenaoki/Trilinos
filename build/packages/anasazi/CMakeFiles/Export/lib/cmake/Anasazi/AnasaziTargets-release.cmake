#----------------------------------------------------------------
# Generated CMake target import file for configuration "RELEASE".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "anasazi" for configuration "RELEASE"
set_property(TARGET anasazi APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(anasazi PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "belostpetra;belosepetra;belos;thyraepetra;thyracore;epetraext;tpetraext;tpetrainout;tpetra;kokkostsqr;tpetrakernels;tpetraclassiclinalg;tpetraclassicnodeapi;tpetraclassic;epetra;teuchoskokkoscomm;teuchoskokkoscompat;teuchosremainder;teuchosnumerics;teuchoscomm;teuchosparameterlist;teuchoscore"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libanasazi.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS anasazi )
list(APPEND _IMPORT_CHECK_FILES_FOR_anasazi "${_IMPORT_PREFIX}/lib/libanasazi.a" )

# Import target "anasaziepetra" for configuration "RELEASE"
set_property(TARGET anasaziepetra APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(anasaziepetra PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "belostpetra;belosepetra;belos;thyraepetra;thyracore;epetraext;tpetraext;tpetrainout;tpetra;kokkostsqr;tpetrakernels;tpetraclassiclinalg;tpetraclassicnodeapi;tpetraclassic;epetra;teuchoskokkoscomm;teuchoskokkoscompat;teuchosremainder;teuchosnumerics;teuchoscomm;teuchosparameterlist;teuchoscore"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libanasaziepetra.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS anasaziepetra )
list(APPEND _IMPORT_CHECK_FILES_FOR_anasaziepetra "${_IMPORT_PREFIX}/lib/libanasaziepetra.a" )

# Import target "ModeLaplace" for configuration "RELEASE"
set_property(TARGET ModeLaplace APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(ModeLaplace PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "belostpetra;belosepetra;belos;thyraepetra;thyracore;epetraext;tpetraext;tpetrainout;tpetra;kokkostsqr;tpetrakernels;tpetraclassiclinalg;tpetraclassicnodeapi;tpetraclassic;epetra;teuchoskokkoscomm;teuchoskokkoscompat;teuchosremainder;teuchosnumerics;teuchoscomm;teuchosparameterlist;teuchoscore"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libModeLaplace.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS ModeLaplace )
list(APPEND _IMPORT_CHECK_FILES_FOR_ModeLaplace "${_IMPORT_PREFIX}/lib/libModeLaplace.a" )

# Import target "anasazitpetra" for configuration "RELEASE"
set_property(TARGET anasazitpetra APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(anasazitpetra PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "belostpetra;belosepetra;belos;thyraepetra;thyracore;epetraext;tpetraext;tpetrainout;tpetra;kokkostsqr;tpetrakernels;tpetraclassiclinalg;tpetraclassicnodeapi;tpetraclassic;epetra;teuchoskokkoscomm;teuchoskokkoscompat;teuchosremainder;teuchosnumerics;teuchoscomm;teuchosparameterlist;teuchoscore"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libanasazitpetra.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS anasazitpetra )
list(APPEND _IMPORT_CHECK_FILES_FOR_anasazitpetra "${_IMPORT_PREFIX}/lib/libanasazitpetra.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
