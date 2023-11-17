cmake_minimum_required(VERSION 3.5)
project(CInt LANGUAGES C CXX Fortran)

# Set the alignment length
set(alignlen 64 CACHE STRING "Alignment length")

# Compiler settings
#set(CMAKE_C_COMPILER "icc")
#set(CMAKE_CXX_COMPILER "icpc")
#set(CMAKE_Fortran_COMPILER "ifort")
#set(CMAKE_AR "xiar rcs")
find_package(SIMINT REQUIRED)

# Optimization flags
set(OPTFLAGS "-m64" CACHE STRING "Optimization flags")

# Source files
set(SRC
    cint_basisset.c
    erd_integral.c
    oed_integral.c
    cint_simint.c
)

# Include directories
# set(SIMINT_DIR "/global/homes/h/huangh/scratch/gtfock-simint/build-avx512/install")
include_directories(${SIMINT_DIR}/include
    ${CMAKE_SOURCE_DIR}
    )

# Compiler flags
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -O3 -Wall -qopenmp -g")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wunknown-pragmas -Wunused-variable")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${OPTFLAGS}")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__ALIGNLEN__=${alignlen}")

# The libcint library
add_library(libcint STATIC ${SRC})
