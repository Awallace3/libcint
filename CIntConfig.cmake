cmake_minimum_required(VERSION 3.5)
project(CInt LANGUAGES C CXX Fortran)

# Set the alignment length
set(alignlen 64 CACHE STRING "Alignment length")

find_package(simint REQUIRED)
message(STATUS "SIMINT_FOUND: ${SIMINT_FOUND}")

# Optimization flags
set(OPTFLAGS "-m64" CACHE STRING "Optimization flags")
set(CInt_INCLUDE_DIRS "${CInt_CMAKE_DIR}/include")

# Source files
set(CInt_SRC
    ${CMAKE_CURRENT_LIST_DIR}/cint_basisset.c
    ${CMAKE_CURRENT_LIST_DIR}/erd_integral.c
    ${CMAKE_CURRENT_LIST_DIR}/oed_integral.c
    ${CMAKE_CURRENT_LIST_DIR}/cint_simint.c
)

# Include directories
# set(SIMINT_DIR "/global/homes/h/huangh/scratch/gtfock-simint/build-avx512/install")
include_directories(${SIMINT_DIR}/include
    ${CMAKE_SOURCE_DIR}
    )

# Compiler flags
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -O3 -Wall -qopenmp -g -diag-disable=10441")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wunknown-pragmas -Wunused-variable")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${OPTFLAGS}")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__ALIGNLEN__=${alignlen}")

# The libcint library
add_library(cint STATIC ${CInt_SRC})
