Two-dimensional Kolmogorov-Smirnov test
==========================================

This folder contains a set of codes that implements the two-dimensional Kolmogorov-Smirnov test, to check whether two 2d distributions are drawn from the same one. Implemented in Fortran 90 using [Numerical Recipes](http://numerical.recipes).

To check whether the result of `use_ks2d` applied to real data is meaningful, you have to compare it to the result expected by chance produced by `mc_ks2d`, and then run `histplot`.

`use_ks2d`
  Compile with use_ks2d.sh. Applies the ks2d2s.f90 routine of Numerical Recipes F90 (chapter 14) to two samples of data.

`test_ks2d`
  Compiles the xks2d2s.f90 routine, which is an illustration of the use of ks2d2s.f90. Compile with test_ks2d.sh.

`mc_ks2d`
  This routine performs a Monte Carlo simulation of an ensemble of isotropic distributions of random sources in the sky, in equatorial coordinates. It computes for each distribution the (D, prob) parameters of the 2D K-S test, comparing with the Pierre Auger event list of UHECRs. The number of sources in each synthetic catalog must be the same as the number of selected Fermi gamma-ray sources. The goal of this code is to check the probability of correlation of PA data expected by chance. 
  Files mc* correspond to the different outputs by this code.
  
`readfile.f90`
  Illustrates the function of reading files with fortran 90.

`histplot.pro`
  Plots histograms with IDL. Used to plot the output of the mc_ks2d code, and compare that with the results of ks2d applied to real data.
