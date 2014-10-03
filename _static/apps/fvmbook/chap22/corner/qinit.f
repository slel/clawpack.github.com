
c
c
c
c     =====================================================
       subroutine qinit(meqn,mbc,mx,my,xlower,ylower,
     &                   dx,dy,q,maux,aux)
c     =====================================================
c
c     # Set initial conditions for q.
c
       implicit double precision (a-h,o-z)
       dimension q(meqn,1-mbc:mx+mbc,1-mbc:my+mbc)
       dimension aux(maux,1-mbc:mx+mbc,1-mbc:my+mbc)
       common /comaux/ rho1,amu1,alam1,rho2,amu2,alam2
c
       cp2 = dsqrt((alam2+2.d0*amu2)/rho2)
       do 20 i=1,mx
          xi = xlower + (i-0.5d0)*dx
          do 20 j=1,my
             yj = ylower + (j-0.5d0)*dy
             q(1,i,j) = 0.d0
             q(2,i,j) = 0.d0
             q(3,i,j) = 0.d0
             q(4,i,j) = 0.d0
             q(5,i,j) = 0.d0
     	     if (xi .gt. -0.35d0 .and. xi.lt.-0.2d0) then
c                # set to be an eigenvector corresponding to right-going
c                # P-wave:
    	         q(1,i,j) = aux(2,i,j) + 2.d0*aux(3,i,j)  
    	         q(2,i,j) = aux(2,i,j)
    	         q(4,i,j) = -aux(4,i,j)
        		 endif
  20         continue

       return
       end

