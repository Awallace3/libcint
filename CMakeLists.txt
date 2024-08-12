cmake_minimum_required(VERSION 3.5)
project(CInt LANGUAGES C CXX Fortran)

set(alignlen 64 CACHE STRING "Alignment length")

find_package(simint REQUIRED)
find_package(erd REQUIRED)
find_package(oed REQUIRED)
message(STATUS "SIMINT_FOUND: ${simint_INCLUDE_DIRS}")
message(STATUS "SIMINT_LIBRARIES: ${simint_LIBRARIES}")

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
# Get all *.c files in the current directory
# file(GLOB CInt_SRC ${CMAKE_CURRENT_LIST_DIR}/*.c)

# Include directories
include_directories(${SIMINT_DIR}/include
    ${CMAKE_CURRENT_LIST_DIR}
    ${ERD_INCLUDE_DIRS}
    ${OED_INCLUDE_DIRS}
    )

# Compiler flags
if (CMAKE_C_COMPILER_ID STREQUAL "GNU")
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -O3 -Wall -fopenmp -g -fPIC")
elseif (CMAKE_C_COMPILER_ID STREQUAL "Intel")
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -O3 -Wall -fopenmp -g -diag-disable=10441 -fPIC")
endif()
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wunknown-pragmas -Wunused-variable")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${OPTFLAGS}")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__ALIGNLEN__=${alignlen}")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wno-undef")


message(STATUS "ERD_INCLUDE_DIRS: ${ERD_INCLUDE_DIRS}")
message(STATUS "ERD_LIBRARIES: ${ERD_LIBRARIES}")
message(STATUS "OED_INCLUDE_DIRS: ${OED_INCLUDE_DIRS}")
message(STATUS "OED_LIBRARIES: ${OED_LIBRARIES}")

# The libcint library
add_library(cint ${CInt_SRC})
#target_compile_features(cint PRIVATE c_std_11 ${SIMINT_LIBRARIES})
target_include_directories(cint PUBLIC ${CInt_INCLUDE_DIRS} ${simint_INCLUDE_DIRS} ${ERD_INCLUDE_DIRS} ${OED_INCLUDE_DIRS})
message(STATUS "SIMINT_LIBRARIES: ${simint_LIBRARIES}")
target_link_libraries(cint PRIVATE ${simint_LIBRARIES} m ${ERD_LIBRARIES} ${OED_LIBRARIES} gfortran)
# target_link_libraries(cint PRIVATE ${simint_LIBRARIES} m ${ERD_STATIC})
target_link_options(cint PRIVATE "-Wl,-z,defs")

# Specify the public headers for the libcint library
file(GLOB PUBLIC_HEADERS "*.h")

# Define where to install the headers
install(FILES ${PUBLIC_HEADERS} DESTINATION include)

# Define where to install the libcint library
install(TARGETS cint
        ARCHIVE DESTINATION lib
        LIBRARY DESTINATION lib
        RUNTIME DESTINATION bin)
