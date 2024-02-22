#----------------------------------------------------------------
# Generated CMake target import file.
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "cint" for configuration ""
set_property(TARGET cint APPEND PROPERTY IMPORTED_CONFIGURATIONS NOCONFIG)
set_target_properties(cint PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_NOCONFIG "C"
  IMPORTED_LOCATION_NOCONFIG "${_IMPORT_PREFIX}/lib/libcint.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS cint )
list(APPEND _IMPORT_CHECK_FILES_FOR_cint "${_IMPORT_PREFIX}/lib/libcint.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
