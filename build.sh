#!/usr/bin/bash
echo $CONDA_PREFIX
rm -r build
mkdir -p build && cd build
# cmake -G Ninja .. -DCMAKE_INSTALL_PREFIX=../../deps -DCMAKE_C_COMPILER=icc -DCMAKE_CXX_COMPILER=icpc -DSIMINT_DIR=../simint/build-avx512/install -DCMAKE_Fortran_COMPILER=ifort
cmake -G Ninja -DCMAKE_INSTALL_PREFIX=../../deps -DCMAKE_C_COMPILER=icc -DCMAKE_CXX_COMPILER=icpc -DCMAKE_Fortran_COMPILER=ifort -DCMAKE_INCLUDE_PATH=$CONDA_PREFIX/include -DCMAKE_LIBRARY_PATH=$CONDA_PREFIX/lib .. -DCONDA_PREFIX=$CONDA_PREFIX -DCMAKE_PREFIX_PATH=$CONDA_PREFIX -DENABLE_simint=ON
ninja install
cd ..
