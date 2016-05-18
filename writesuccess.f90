!
!  Written by Leandro Martínez, 2009-2011.
!  Copyright (c) 2009-2011, Leandro Martínez, Jose Mario Martinez,
!  Ernesto G. Birgin.
!  
!  This program is free software; you can redistribute it and/or
!  modify it under the terms of the GNU General Public License
!  as published by the Free Software Foundation; either version 2
!  of the License, or (at your option) any later version.
!  
! Subroutine writesuccess
!
!    Writes the success messages for good packings    
!

subroutine writesuccess(itype,fdist,frest,f)

  use input, only : precision 
  use compute_data, only : ntype
  use ahestetic
  implicit none
  integer :: itype
  double precision :: fdist, frest, f

  if(itype.le.ntype) then
    write(*,dash1_line)
    write(*,*)' Packing solved for molecules of type', itype
    write(*,*)' Objective function value: ', f
    write(*,*)' Maximum violation of target distance: ',fdist
    write(*,*)' Max. constraint violation: ', frest
    write(*,dash1_line)
  else
    write(*,hash3_line)
    write(*,"(&
      t27, ' Success! ',                               /,&
      t10, ' Final objective function value: ', e10.5, /,&
      t10, ' Maximum violation of target distance: ', f10.6, /,&
      t10, ' Maximum violation of the constraints: ', e10.5 &
             )") f, fdist, frest
    write(*,dash3_line)
    write(*,"(&
      ' Please cite this work if Packmol was useful: ',/,&
      ' L. Martinez, R. Andrade, E. G. Birgin, J. M. Martinez, ',/,&
      ' PACKMOL: A package for building initial configurations ',/,&
      ' for molecular dynamics simulations. ',/,&
      ' Journal of Computational Chemistry, 30:2157-2164,2009.' )")
    write(*,hash3_line)
  end if

end subroutine writesuccess

