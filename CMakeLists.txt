cmake_minimum_required(VERSION 3.5)
project(CInt LANGUAGES C CXX Fortran)

message(STATUS "CONDA_PREFIX: ${CONDA_PREFIX}")
if(DEFINED ENV{CONDA_PREFIX})
    include_directories($ENV{CONDA_PREFIX}/include)
    link_directories($ENV{CONDA_PREFIX}/lib)
    message(STATUS "include: ${CMAKE_INCLUDE_PATH}")
endif()

set(SIMINT_VER "0.7")
set(simint_MAXAM 7)
set(simint_MAXDER 0)

message("FIND ME ${am${MAX_AM_ERI}} ${der0}")
find_package(simint ${SIMINT_VER} CONFIG COMPONENTS am${MAX_AM_ERI} der0)
message(STATUS "SIMINT_FOUND: ${SIMINT_FOUND}")

# Include the CIntCmake.cmake script
include(CIntCmake.cmake)

# Specify the public headers for the libcint library
set(PUBLIC_HEADERS
    cint_basisset.h
    erd_integral.h
    oed_integral.h
    # cint_simint.h
)

# Define where to install the headers
install(FILES ${PUBLIC_HEADERS} DESTINATION include)

# Define where to install the libcint library
install(TARGETS libcint
        ARCHIVE DESTINATION lib
        LIBRARY DESTINATION lib
        RUNTIME DESTINATION bin)



