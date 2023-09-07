function [csn,csp,cel,phicn,phicp,jnn,jpp]=form(y,p)

csn=y(1:p.n);csp=y(p.n+1:p.n+p.p);
cel=y(p.n+p.p+1:p.n+p.p+p.x);
phicn=y(p.n+p.p+p.x+1);
phicp=y(p.n+p.p+p.x+2);
jnn=y(p.n+p.p+p.x+2+1:2*p.n+p.p+p.x+2);
jpp=y(2*p.n+p.p+p.x+2+1:2*(p.n+p.p)+p.x+2);

 end

