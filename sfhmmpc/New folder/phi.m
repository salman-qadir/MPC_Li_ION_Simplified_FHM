function [phisna,phispa,phien,phies,phiep] = phi(jn,jp,cel,p)  

%% Cathode
smp=p.s41*( -(p.ksp*2*p.s2)\([0;p.lp*p.u]) );
phispa=p.s4\([smp;0]+p.ksp\(.25*p.lp^2*[jp;0]) );
phispa=phispa(1:p.p);
%% Anode
phisna=(4*p.s7*p.ksn)\(p.ln^2*jn) ;
%% Electrolyte
jc=[jp;zeros(p.s,1);jn];
phia = -(p.r*p.ta*p.tp*p.ke*p.cmm*log(cel))/p.f - jc;
phib=(p.smm)\([phia;0]);
phiea=phib(1:p.x);
%%
 phiep=phiea(1:p.p,:); phies=phiea(p.p+1:p.p+p.s,:);
 phien=phiea(p.p+p.s+1:p.p+p.s+p.n,:);
end