function [cs,ce] = difff(csn,csp,cel,jn,jp,p)
    
%% solid
% anode
cbn=p.A11*csn+p.A14\([(-0.5*p.ln^2*jn(1))/(p.dsn*p.f*3*p.nsn);0]);
cn=((4*p.dsn)/p.ln^2)*p.A1*([cbn(1);csn;cbn(2)]) - jn/p.f;
% cathode
cbp=p.A31*csp+p.A34\([(-0.5*p.lp^2*jp(1))/(p.dsp*p.f*3*p.nsp);0]);
cp=((4*p.dsp)/p.lp^2)*p.A3*([cbp(1);csp;cbp(2)]) - jp/p.f;
cs=[cn;cp];
%% liquid
jj=[jp;zeros(p.s,1);jn];
ce = p.deee*p.cmm*cel + p.ae*((jj*(1-p.tp))/p.f);
end

