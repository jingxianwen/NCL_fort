subroutine func_read_2d(nx,ny,infil,recbeg,varout)
!************************************************
! read and return 2D field from directory access 
! binary data (record length: nx * ny)
!************************************************

integer,intent(in) :: nx
integer,intent(in) :: ny
character(len=*),intent(in) :: infil
integer,intent(in) :: recbeg

!;input variables
real(4),intent(out) :: varout(nx,ny)

integer :: recid

!--------------------------------------------
!print*,nx
!print*,ny
!print*,nz
!print*,infil

 open ( 300, file=trim(infil), form="unformatted", status="old",    &
             access="direct", recl=nx*ny*4)
 recid=recbeg
 read(300,rec=recid) varout(:,:)

end subroutine func_read_2d
