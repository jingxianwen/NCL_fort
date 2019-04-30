load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

external func_read_3D "./func_read_3D.so"

begin
 ;--------
 ;MIROC FX10 fortran output is in bigendian. Set binary format bigendian. 
  setfileoption ("bin", "ReadByteOrder", "BigEndian")
  setfileoption ("bin", "WriteByteOrder", "BigEndian")

  schm="br" ;asciiread("./schm.txt",(/1/),"string")
  datapath="/Volumes/WD4T_1/COSP2.0_PD_1yr/test_"+schm+"_cosp2/processed/"
  outpath="/Volumes/WD4T_1/COSP2.0_PD_1yr/test_"+schm+"_cosp2/processed/"
  vnm="ice_mass_frac_3D_snap_"+schm

  inputfile=datapath+vnm+".grd"

  ntime=1459
  nlat=128
  nlon=256
  nlev=40

  varsnp=new((/nlev,nlat,nlon/),"float")
  t1=get_cpu_time()
  do it = 0,ntime-1
   print(it)
   recbeg=it*nlev+1
   func_read_3D::func_read_3d(nlon,nlat,nlev,inputfile,recbeg,varsnp)

   ;do ilev=0,nlev-1
   ;  ;print(ilev)
   ;  varsnp(ilev,:,:)=fbindirread(inputfile,  \
   ;             it*nlev+ilev,(/nlat,nlon/),"float")
   ;end do
   ;print(varsnp(:,28,36))

  end do
   t2=get_cpu_time()
   print(t2-t1)
 end
