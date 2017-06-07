! Program that calls ks2d2s (Kolmogorov-Smirnov test for two samples of
! data, Numerical Recipes for F, page 640) and applies it.

PROGRAM applyks2d
USE nrtype
USE nr
IMPLICIT NONE
INTEGER :: i, n1, n2
REAL :: d,prob
real, dimension(:), allocatable :: x1,y1,x2,y2
character(len=50) :: in1, in2

!write(unit=*,fmt='(A,$)') 'Input filename 01: '
!read *, in1
in1='pa.dat'

write(unit=*,fmt='(A,$)') 'Input filename 02: '
read *, in2

!write(unit=*,fmt='(A,$)') 'Number of data points 1: '
!read *, n1
n1=27

write(unit=*,fmt='(A,$)') 'Number of data points 2: '
read *, n2

allocate(x1(n1),y1(n1),x2(n2),y2(n2))

! Reads file 1
open(unit=1,file=in1,status='old')
do i=1,n1
  read(unit=1,fmt=*) x1(i), y1(i)
end do
close(unit=1)

! Reads file 2
open(unit=2,file=in2,status='old')
do i=1,n2
  read(unit=2,fmt=*) x2(i), y2(i)
end do
close(unit=2)

! Calls NR routine to perform 2D K-S test
call ks2d2s(x1(1:n1),y1(1:n1),x2(1:n2),y2(1:n2),d,prob)

print *, 'D=', d, 'PROB=', prob

deallocate(x1,y1,x2,y2)

end program


