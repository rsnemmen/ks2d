! Produces an isotropic sky of Pierre Auger detections.
! Given a target number of accepted events, this routine
! will generate isotropic CRs until the desired number of detections
! is reached. See astro-ph/0004016. Based on the routine randomsky.pro
! that I previously wrote for IDL.
!
! Usage: randomsky, n, ra, dec
! 
! Input: n = number of desired UHECR detections
! Output: ra, dec = right ascension and declination in degrees (arrays)

subroutine randomsky(ntarget, xa, ya)
!use myprogs
implicit none
integer, intent(in) :: ntarget
real, intent(out), dimension(:), allocatable :: xa, ya
real :: x, y, sampling, exposure
integer :: naccept, totalcrs

allocate(xa(ntarget),ya(ntarget))

! Equatorial coordinates of accepted events
xa=0.
ya=0.

! Number of accepted events. Must reach naccept=target to start next trial
naccept=0
totalcrs=0	! total number of produced CRs

! Performs the Monte Carlo simulation
! Be careful here. Distributing points uniformly in the (alpha,delta)
! plane does not correspond to a uniform random sky (spherical surface).
! Instead it will concentrate points towards the poles of the sphere.

! Loop that produces individual CRs
do while (naccept < ntarget)

	call random_number(x)
	call random_number(y)
	x = x*360.	! between 0 and 360 
! To avoid concentrations towards the poles, generates sin(delta)
! between -1 and +1, then converts to delta
	y = asin(2.*y-1.)*180./3.1415	! dec
	
! If sampling<exposure for a given CR, it is accepted
	call random_number(sampling)
	if (sampling <= exposure(y)) then
		naccept=naccept+1
		xa(naccept)=x
		ya(naccept)=y
	end if
	
	totalcrs=totalcrs+1
end do

end subroutine randomsky

