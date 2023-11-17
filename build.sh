#!/usr/bin/bash
export CPATH=/usr/include/x86_64-linux-gnu:$CPATH
echo $CONDA_PREFIX
export objdir=objdir_cint
rm -r $objdir
mkdir -p $objdir
# cmake -G Ninja .. -DCMAKE_INSTALL_PREFIX=../../deps -DCMAKE_C_COMPILER=icc -DCMAKE_CXX_COMPILER=icpc -DSIMINT_DIR=../simint/build-avx512/install -DCMAKE_Fortran_COMPILER=ifort
# cmake -G Ninja -DCMAKE_INSTALL_PREFIX=../../deps -DCMAKE_C_COMPILER=icc -DCMAKE_CXX_COMPILER=icpc -DCMAKE_Fortran_COMPILER=ifort -DCMAKE_INCLUDE_PATH=$CONDA_PREFIX/include -DCMAKE_LIBRARY_PATH=$CONDA_PREFIX/lib .. -DCONDA_PREFIX=$CONDA_PREFIX -DCMAKE_PREFIX_PATH=$CONDA_PREFIX -DBUILD_SHARED_LIBS=ON
#cmake -G Ninja -S. -B$objdir -DCMAKE_INSTALL_PREFIX=../deps -DCMAKE_C_COMPILER=icc -DCMAKE_CXX_COMPILER=icpc -DCMAKE_Fortran_COMPILER=ifort -DCMAKE_INCLUDE_PATH=$CONDA_PREFIX/include -DCMAKE_LIBRARY_PATH=$CONDA_PREFIX/lib -DCMAKE_PREFIX_PATH=$CONDA_PREFIX -DBUILD_SHARED_LIBS=ON
cmake -S. -Bobjdir_cint -DCMAKE_C_COMPILER=icc -DCMAKE_CXX_COMPILER=icpc -DCMAKE_Fortran_COMPILER=ifort -DBUILD_SHARED_LIBS=ON -Dsimint_DIR=$CONDA_PREFIX/share/cmake/simint -G Ninja -DCMAKE_INSTALL_PREFIX=../deps
cd $objdir
ninja install
cd ..
