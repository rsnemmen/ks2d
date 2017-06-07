! Opens a datafile and reads the columns as arrays.
! Illustrates the use of dynamic allocated arrays.

program readfile
implicit none

real, dimension(:), allocatable :: x, y
integer :: i,n
character(len=50) :: in

write(unit=*,fmt='(A,$)') 'Filename: '
read *, in

write(unit=*,fmt='(A,$)') 'Number of points: '
read *, n

open(unit=1,file=in,status='old')
allocate(x(n),y(n))

do i=1,n
  read(unit=1,fmt=*) x(i), y(i)
  print *, x(i),y(i)
end do

deallocate(x,y)
close(unit=1) ! closes file

end program

