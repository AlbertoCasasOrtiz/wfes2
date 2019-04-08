# doctest-cli tests
# INSTALL: pip3 install doctest-cli
# USAGE: doctest-cli wfes_test.sh

# Tests
## Single
### Absorption
>>>../build/wfes_single --absorption -N 1000 --csv
1000, 0.0000000000e+00, 5.0000000000e-01, 1.0000000000e-09, 1.0000000000e-09, 1.0000000000e-20, 9.9949998695e-01, 5.0001305912e-04, 1.4564579449e+01, 1.2529233426e+02, 3.9957557932e+03, 2.1529724507e+03
>>>../build/wfes_single --absorption -N 1000 -p 1 --csv
1000, 0.0000000000e+00, 5.0000000000e-01, 1.0000000000e-09, 1.0000000000e-09, 1.0000000000e-20, 9.9949998744e-01, 5.0001255936e-04, 1.4564567296e+01, 1.2529226927e+02, 3.9957557942e+03, 2.1529650404e+03
>>>../build/wfes_single --absorption -N 1000 -p 1 -u 1e-4 --csv
1000, 0.0000000000e+00, 5.0000000000e-01, 1.0000000000e-04, 1.0000000000e-09, 1.0000000000e-20, 9.9969853500e-01, 3.0146500186e-04, 1.5143101369e+01, 1.4319534334e+02, 4.6467532200e+03, 2.6392046795e+03
>>>../build/wfes_single --absorption -N 1000 -p 1 -u 1e-4 -s 0.001 --csv
1000, 1.0000000000e-03, 5.0000000000e-01, 1.0000000000e-04, 1.0000000000e-09, 1.0000000000e-20, 9.9913316541e-01, 8.6683459467e-04, 1.4999963616e+01, 1.4139589654e+02, 4.7098061515e+03, 2.6886673244e+03
### Fixation
>>>../build/wfes_single --fixation -N 1000 --csv
1000, 0.0000000000e+00, 5.0000000000e-01, 1.0000000000e-09, 1.0000000000e-09, 1.0000000000e-20, 1.0000080029e+09, 1.0000040067e+09, 9.9999199716e-10
### Allele age
>>>../build/wfes_single --allele-age -N 1000 -s 0.01 -x 10 --csv
1000, 1.0000000000e-02, 5.0000000000e-01, 1.0000000000e-09, 1.0000000000e-09, 1.0000000000e-20, 5.6989600732e+01, 9.6737105117e+01
### Establishment
>>>../build/wfes_single --establishment -N 1000 -a 1e-15 -p 1 --csv
1000, 0.0000000000e+00, 5.0000000000e-01, 1.0000000000e-09, 1.0000000000e-09, 1.0000000000e-15, 5.0000000000e-01, 9.8764814780e-04, 2.7695712941e+03,2.0337341394e+03, 2.7711176861e+03, 2.0340412331e+03, 2.7680279917e+03, 2.0334264406e+03, 1.2458632821e+03, 7.1765889698e+02

## Switching
### Absorption
>>>../build/wfes_switching --absorption -N 1000,2000 --csv
1000, 2000, 0.0000000000e+00, 0.0000000000e+00, 5.0000000000e-01, 5.0000000000e-01, 1.0000000000e-09, 1.0000000000e-09, 1.0000000000e-09, 1.0000000000e-09, 5.0000000000e-01, 5.0000000000e-01, 1.0000000000e-20, 9.9962498641e-01, 3.7501359526e-04, 1.5099954079e+01, 1.4486630022e+02, 5.3287128698e+03, 2.8708644893e+03
>>>../build/wfes_switching --absorption -N 1000,2000 -s 0.001,0.002 --csv
1000, 2000, 1.0000000000e-03, 2.0000000000e-03, 5.0000000000e-01, 5.0000000000e-01, 1.0000000000e-09, 1.0000000000e-09, 1.0000000000e-09, 1.0000000000e-09, 5.0000000000e-01, 5.0000000000e-01, 1.0000000000e-20, 9.9847394214e-01, 1.5260578650e-03, 1.3634971648e+01, 1.0625928299e+02, 4.4619701313e+03, 2.1503668202e+03
### Fixation
>>>../build/wfes_switching --fixation -N 1000,2000 --csv
1000, 2000, 0.0000000000e+00, 0.0000000000e+00, 5.0000000000e-01, 5.0000000000e-01, 1.0000000000e-09, 1.0000000000e-09, 1.0000000000e-09, 1.0000000000e-09, 5.0000000000e-01, 5.0000000000e-01, 1.0000000000e-20, 1.0000106854e+09, 9.9998931475e-10
>>>../build/wfes_switching --fixation -N 1000,2000 -s 0.001,0.002 --csv
1000, 2000, 1.0000000000e-03, 2.0000000000e-03, 5.0000000000e-01, 5.0000000000e-01, 1.0000000000e-09, 1.0000000000e-09, 1.0000000000e-09, 1.0000000000e-09, 5.0000000000e-01, 5.0000000000e-01, 1.0000000000e-20, 2.4572441932e+08, 4.0695996058e-09

