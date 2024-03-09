#!/usr/bin/bash
#export CPATH=/usr/include/x86_64-linux-gnu:$CPATH
echo $CONDA_PREFIX
export objdir=objdir_cint
export SIMINT_LIBRARY_DIR=$PWD/../simint/build-avx512/install
rm -r $objdir
rm -r include
rm -r lib
mkdir -p $objdir
cmake -S. -B${objdir} -G Ninja -DCMAKE_C_COMPILER=$CC -DCMAKE_CXX_COMPILER=$CXX  -DBUILD_SHARED_LIBS=ON -DCMAKE_PREFIX_PATH=${SIMINT_LIBRARY_DIR} -DCMAKE_INSTALL_PREFIX=.
ninja -C ${objdir} install
cd ..
