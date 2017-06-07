# Compiles the program that drives the 2D Kolmogorov-Smirnov test 
# for two samples, with all the Numerical Recipes dependencies included.

gfortran -O  nr/nrtype.f90 nr/nr.f90 nr/nrutil.f90 nr/betacf.f90 nr/betai.f90 nr/gammln.f90 nr/ks2d2s.f90 nr/pearsn.f90 nr/probks.f90 nr/quadct.f90 myprogs.f90 exposure.f90 randomsky.f90 mc_ks2d.f90  -o mc_ks2d
