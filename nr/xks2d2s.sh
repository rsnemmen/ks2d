# Compiles example program that drives the 2D Kolmogorov-Smirnov test 
# for two samples.

gfortran -O  nr/nrtype.f90 nr/nr.f90 nr/nrutil.f90 nr/betacf.f90 nr/betai.f90 nr/gammln.f90 nr/ks2d2s.f90 nr/pearsn.f90 nr/probks.f90 nr/quadct.f90 nr/ran_state.f90 nr/ran1.f90 nr/gasdev.f90 nr/xks2d2s.f90  -o call_ks2d
