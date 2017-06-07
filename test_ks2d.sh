# Compiles example program that drives the 2D Kolmogorov-Smirnov test 
# for two samples.
#
# The smaller the shrinkage factor, the less correlated are the two samples.
# For instance, for shrink=0.1 the two samples have an almost perfect
# anti-correlation.

gfortran -O  nr/nrtype.f90 nr/nr.f90 nr/nrutil.f90 nr/betacf.f90 nr/betai.f90 nr/gammln.f90 nr/ks2d2s.f90 nr/pearsn.f90 nr/probks.f90 nr/quadct.f90 nr/ran_state.f90 nr/ran1.f90 nr/gasdev.f90 nr/xks2d2s.f90  -o test_ks2d

#gfortran -O  nr/nrtype.f90 nr/nr.f90 nr/nrutil.f90 nr/betacf.f90 nr/betai.f90 nr/gammln.f90 nr/ks2d2s.f90 nr/pearsn.f90 nr/probks.f90 nr/quadct.f90 nr/ran_state.f90 nr/ran1.f90 nr/gasdev.f90 nr/temp.f90  -o test_ks2d
