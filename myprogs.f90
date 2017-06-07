! Required in order for the program, subroutines and functions to be
! compiled correctly.

MODULE myprogs

interface
subroutine randomsky(ntarget, xa, ya)
integer, intent(in) :: ntarget
real, intent(out), dimension(:), allocatable :: xa, ya
end subroutine randomsky

function exposure(deltain)
real, intent(in) :: deltain
real :: exposure
end function exposure
end interface

end module myprogs
