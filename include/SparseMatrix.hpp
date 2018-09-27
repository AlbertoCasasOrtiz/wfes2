#pragma once

#include "common.hpp"

class SparseMatrix
{
protected:
    llong current_row;
    bool full;

public:
    llong non_zeros;
    llong n_row;
    llong n_col;

    double* data;
    llong* cols;
    llong* rows;
    llong* row_index;


    SparseMatrix(llong n_row, llong n_col);
    // Copy constructor
    SparseMatrix(dmat& dense);

    ~SparseMatrix();

    //       r0 = 1;   r1 = 4;
    // r: a  b  c  d  e  f  g  h 
    //      /        /
    //     /        /
    // m: b  c  d  e
    //    m0 = 0;  m1 = 3;  
    // insert row from r0 to r1 (row index) into matrix from m0 to m1 (matrix index)
    void append_data(dvec& row, llong m0, llong m1, llong r0, llong r1, bool new_row = true, llong slack = 0);
    void finalize_row();

    void append_row(dvec& row, llong col_start = 0, llong col_end = -1);
    void push_row(dvec& row, llong mat_col_start, llong mat_col_end, llong row_col_start, llong row_col_end, bool finish_row = true);
    void push_value(double value, llong i, llong j, bool finish_row);
    void compress_csr();

    void debug_print();
    dmat dense();
    dvec multiply(dvec& x, bool transpose = false);
    void multiply_inplace_rep(dvec& x, llong times, bool transpose = false);

    // friend ostream& operator<< (ostream& os, const SparseMatrix& M);
    void save_market(std::string path);
    void subtract_identity(); // I - Q
    void add_identity(); // -(Q + I)
    double operator() (llong i, llong j);
    dvec col_copy(llong j);
    dvec row(llong i);

    bool approx_eq(const SparseMatrix& rhs, double tol = 1e-10, bool verbose = false);
private:
    void append_chunk(dvec& row, llong m0, llong m1, llong r0, llong r1);
};

std::ostream& operator<<(std::ostream& os, const SparseMatrix& M);

typedef SparseMatrix smat;
