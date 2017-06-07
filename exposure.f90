! Calculates the exposure function of the Pierre Auger Observatory.
! Formula taken from Sommers, P. 2000, astro-ph/0004016. Based on the 
! function exposure.pro that I previously wrote for IDL.
!
! Usage: X=exposure(delta)
!
!      where delta is the declination in degrees.

function exposure(deltain)
implicit none
real, intent(in) :: deltain
real :: delta, xi, lat, thetam, alpham, omega, exposure
integer, parameter :: pi=3.141592

delta=deltain*pi/180.

lat = -35.2*pi/180.	! latitude of PA
thetam = 60.*pi/180.	! maximum zenith angle of PA

xi = (cos(thetam) - sin(lat)*Sin(delta))/(Cos(lat)*Cos(delta))

if (xi > 1) then 
	alpham=0
else if (xi < -1) then 
	alpham=pi
else
	alpham=acos(xi)
end if

omega = Cos(lat)*Cos(delta)*Sin(alpham) + alpham*Sin(lat)*Sin(delta)

! Normalizes to 1, for the latitude and max. zenith angle of Pierre Auger
exposure=omega/1.81092

end function exposure
