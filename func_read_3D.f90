subroutine func_read_3d(nx,ny,nz,infil,recbeg,varout)
!subroutine func_read_3D(nx,ny,nz,recbeg)
!************************************************
! read and return 3D field from directory access 
! binary data (record length: nx * ny)
!************************************************

integer,intent(in) :: nx
integer,intent(in) :: ny
integer,intent(in) :: nz
character(len=*),intent(in) :: infil
integer,intent(in) :: recbeg

!;input variables
real(4),intent(out) :: varout(nx,ny,nz)

integer :: iz
integer :: recid

!--------------------------------------------
!print*,nx
!print*,ny
!print*,nz
!print*,infil

 open ( 300, file=trim(infil), form="unformatted", status="old",    &
             access="direct", recl=nx*ny*4)

 do iz=1,nz
   recid=recbeg+iz-1
   read(300,rec=recid) varout(:,:,iz)
 end do
end subroutine func_read_3d
