! Monte Carlo simulation of the Fermi sky
! =========================================
!
! Program that generates cosmic rays isotropically distributed
! in the sky according to the exposure function of the Pierre Auger
! Observatory. Computes the 2D K-S statistic, comparing
! these sources with the Fermi bright gamma-ray sources.
!
! Dependencies:
! - ks2d2s (Kolmogorov-Smirnov test for two samples of data, Numerical
!   Recipes for F, page 640).
! - randomsky.f90: generates an isotropic sky observed by the Pierre Auger
! - exposure.f90: calculates exposure function of PA
! (dependencies handled by modules nr, myprogs).
!
! x is the RA, y is the dec, in degrees.
!
! Creates two files: 
! - mcks2d.dat: (D, prob) resulting from the Monte Carlo realizations
! - mccoord.dat: equatorial coordinates (alpha, delta) of the random catalog,
!   resulting from the first MC realization

PROGRAM mcks2d
USE nrtype
USE nr
use myprogs
IMPLICIT NONE
INTEGER :: i, j, n1, n2, ntrial
REAL :: d,prob
real, dimension(:), allocatable :: x1,y1,x2,y2
character(len=50) :: in1, in2

! (x1,y1) are the coordinates of the sources that will be simulated (in this
! case, UHECRs). (x2, y2) are the coords. of the fixed sources that will 
! be read from a datafile (Fermi).

! Must be the same as the number of UHECRs
!write(unit=*,fmt='(A,$)') 'Number of synthetic data points: '
!read *, n1
n1=27

write(unit=*,fmt='(A,$)') 'How many trials? '
read *, ntrial

write(unit=*,fmt='(A,$)') 'Input filename with fixed sources: '
read *, in2

write(unit=*,fmt='(A,$)') 'Number of fixed sources: '
read *, n2

allocate(x1(n1),y1(n1),x2(n2),y2(n2))






! Reads the data file with fixed sources and closes it
open(unit=2,file=in2,status='old')
do i=1,n2
  read(unit=2,fmt=*) x2(i), y2(i)
end do
close(unit=2)



! Opens file ks2dmc.dat
open(unit=4,file='mcks2d.dat',status='replace')
write(unit=4,fmt=*) '# D  prob'

! Performs the Monte Carlo simulation
! Be careful here. Distributing points uniformly in the (alpha,delta)
! plane does not correspond to a uniform random sky (spherical surface).
! Instead it will concentrate points towards the poles of the sphere.
do i=1,ntrial
	call randomsky(n1,x1,y1)

! Loop to print x y values from the first realization
	if (i==1) then
		open(unit=3,file='mccoord.dat',status='replace')
		write(unit=3,fmt=*) '# alpha(deg)  delta(deg)'
		do j=1,n1
			write(unit=3,fmt=*) x1(j), y1(j)
		end do
		close(unit=3)
	end if
	
! Calls NR routine to perform 2D K-S test
	call ks2d2s(x1(1:n1),y1(1:n1),x2(1:n2),y2(1:n2),d,prob)
	write(unit=4,fmt=*) d, prob
end do

deallocate(x1,y1,x2,y2)
close(unit=4)	! closes the ks2dmc.dat file

end program


