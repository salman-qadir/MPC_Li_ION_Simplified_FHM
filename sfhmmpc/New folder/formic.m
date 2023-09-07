function [csn,csp,cel,phicn,phicp,jnn,jpp]=formic(y,yp,p)

csn=yp(1:p.n);csp=yp(p.n+1:p.n+p.p);
cel=yp(p.n+p.p+1:p.n+p.p+p.x);
phicn=y(1);
phicp=y(2);
jnn=y(2+1:p.n+2);
jpp=y(p.n+2+1:p.n+p.p+2);

 end

