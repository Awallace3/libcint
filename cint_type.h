#pragma once

#include <stdint.h>
#include <stdbool.h>

struct OED
{
    int nalpha;
    int ncoeff;
    int ncgto1;
    int ncgto2;
    int npgto1;
    int npgto2;
    int shell1;
    int shell2;
    int natoms;
    int ncsum;
    int spheric;
    int screen;  
    double x1;
    double y1;
    double z1;
    double x2;
    double y2;
    double z2;
    double *xn;
    double *yn;
    double *zn;
    double *charge;
    double *cc;
    double *alpha;
    int cc_beg[2];
    int cc_end[2];
    int imax;
    int zmax;
    double *zcore;
    double *zcore2;
    int *icore;

    int fp_memory_opt;
    int int_memory_opt;
    int *coef_offset;
    int *exp_offset;
};


struct ERD
{
    /* The number of threads used for computation */
    uint32_t nthreads;
    size_t int_memory_opt;
    int **icore;
    size_t fp_memory_opt;
    double **zcore;    
    /* Used for vrrtable */
    int max_shella;
    /* 2D array */
    int **vrrtable;
};

struct BasisSet
{
    // atom
    int natoms;
    int *eid;
    double *xn;
    double *yn;
    double *zn;   
    double *charge;
    int nelectrons;

    // basis
    int bs_natoms;
    int basistype;
    int *bs_eptr;
    int *bs_atom_start;
    int bs_nshells;
    int bs_totnexp;
    int *bs_nexp;
    double **bs_exp;
    double **bs_cc;
    double **bs_norm;
    int *bs_momentum;
    
    // shell
    int nshells;    
    int nfunctions;    
    int *f_start_id;
    int *f_end_id;
    int *s_start_id;
    int *nexp;
    double **exp;
    double **cc;
    double **norm;
    int *momentum;
    double *xyz0;

    int maxdim; // max number of functions of a shell 
    int max_momentum;
    int max_nexp;
    int max_nexp_id;
    
    char str_buf[512];

#ifdef __INTEL_OFFLOAD
    int mic_numdevs;
#endif
};
