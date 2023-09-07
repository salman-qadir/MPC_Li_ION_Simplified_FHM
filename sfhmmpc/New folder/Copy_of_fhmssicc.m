function [yt] = fhmssicc(y,yp,p)   
    
%%  
% [csn,csp,cel,phicn,phicp,jn,jp]=form(y,p);
csn=yp(1:p.n);csp=yp(p.n+1:p.n+p.p);
cel=yp(p.n+p.p+1:p.n+p.p+p.x);
phicn=y(1);
phicp=y(2);
jn=y(2+1:p.n+2);
jp=y(p.n+2+1:p.n+p.p+2);
%% Diffusion
%[cs,ce] = difff(csn,csp,cel,jn,jp,p);
% anode
cbn=p.A11*csn+p.A14\([(-0.5*p.ln^2*jn(1))/(p.dsn*p.f*3*p.nsn);0]);
cn=((4*p.dsn)/p.ln^2)*p.A1*([cbn(1);csn;cbn(2)]) - jn/p.f;
% cathode
cbp=p.A31*csp+p.A34\([(-0.5*p.lp^2*jp(1))/(p.dsp*p.f*3*p.nsp);0]);
cp=((4*p.dsp)/p.lp^2)*p.A3*([cbp(1);csp;cbp(2)]) - jp/p.f;
cs=[cn;cp];
% liquid
jj=[jp;zeros(p.s,1);jn];
ce = p.deee*p.cmm*cel + p.ae*((jj*(1-p.tp))/p.f);
%%   Potential
%[phisna,phispa,phien,~,phiep] = phi(jn,jp,cel,p);
% Cathode
smp=p.s41*( -(p.ksp*2*p.s2)\([0;p.lp*p.u]) );
phispa=p.s4\([smp;0]+p.ksp\(.25*p.lp^2*[jp;0]) );
phispa=phispa(1:p.p);
% Anode
phisna=(4*p.s7*p.ksn)\(p.ln^2*jn) ;
% Electrolyte
jc=[jp;zeros(p.s,1);jn];
phia = -(p.r*p.ta*p.tp*p.ke*p.cmm*log(cel))/p.f - jc;
phib=(p.smm)\([phia;0]);
%phiea=phib(1:p.x);
phiep=phib(1:p.p,:); 
%phies=phiea(p.p+1:p.p+p.s,:);
phien=phib(p.p+p.s+1:p.p+p.s+p.n,:);
%%  Intercalation Current
%[ecdn,ecdp,on,op] = conduct(jn,jp,cel,csn,csp,phicn,phicp,p);
[un,up,~,~] = ocp(csn/p.csn,csp/p.csp);
cep=cel(1:p.p);cen=cel(p.p+p.s+1:p.p+p.s+p.n);
ecdn=p.kn*sqrt((cen.*csn).*(1-csn/p.csn));
ecdp=p.kp*sqrt((cep.*csp).*(1-csp/p.csp));
opp=phicp+phispa-phiep-up;
op=2*sinh(p.kb*opp);
opn=phicn+phisna-phien-un;
on=2*sinh(p.kb*opn);
%% ODE Format
yt=zeros(2*(p.n+p.p)+p.x+2,1);

yt(1:p.n+p.p,1)=yp(1:p.n+p.p,1)-cs;

yt(p.n+p.p+1:p.n+p.p+p.x,1)=...
yp(p.n+p.p+1:p.n+p.p+p.x,1)-ce;

yt(p.n+p.p+p.x+1,1)= ...
simp(jn)*p.zn(1,2)-p.u;

yt(p.n+p.p+p.x+2,1)=...
simp(jp)*p.zp(1,2)+p.u;

yt(p.n+p.p+p.x+2+1:...
2*p.n+p.p+p.x+2,1)=jn-ecdn.*on;

yt(2*p.n+p.p+p.x+2+1:...
2*(p.n+p.p)+p.x+2,1)=jp-ecdp.*op;
end