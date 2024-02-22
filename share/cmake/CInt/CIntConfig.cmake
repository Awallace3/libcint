cmake_minimum_required(VERSION 3.5)
project(CInt LANGUAGES C CXX Fortran)

# include("${CMAKE_CURRENT_LIST_DIR}/CIntTargets.cmake")

# Set the include directory
set(CInt_INCLUDE_DIR "${CMAKE_CURRENT_LIST_DIR}/../../../include")

# Set the library path
set(CInt_LIBRARY "${CMAKE_CURRENT_LIST_DIR}/../../../lib/libcint.so")

# You can set this if you want to make it easy to link to the library
set(CInt_LIBRARIES "${CInt_LIBRARY}")
set(CInt_INCLUDE_DIRS "${CInt_INCLUDE_DIR}")
