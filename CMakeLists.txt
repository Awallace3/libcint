cmake_minimum_required(VERSION 3.5)
project(CInt LANGUAGES C CXX Fortran)

# Include the CIntConfig.cmake script
include(share/cmake/CInt/CIntConfig.cmake)

# Specify the public headers for the libcint library
set(PUBLIC_HEADERS
    cint_basisset.h
    erd_integral.h
    oed_integral.h
    CInt.h
)

# Define where to install the headers
install(FILES ${PUBLIC_HEADERS} DESTINATION include)

# Define where to install the libcint library
install(TARGETS cint
        ARCHIVE DESTINATION lib
        LIBRARY DESTINATION lib
        RUNTIME DESTINATION bin)
