rm -r build
mkdir -p build && cd build
cmake -G Ninja .. -DCMAKE_INSTALL_PREFIX=../../deps -DCMAKE_C_COMPILER=icc -DCMAKE_CXX_COMPILER=icpc -DSIMINT_DIR=../simint/build-avx512/install -DCMAKE_Fortran_COMPILER=ifort
ninja install
cd ..
