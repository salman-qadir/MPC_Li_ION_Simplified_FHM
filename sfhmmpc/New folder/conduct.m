function [ecdn,ecdp,on,op] = conduct(jn,jp,cel,csn,csp,phicn,phicp,p)  

[phisna,phispa,phien,~,phiep] = phi(jn,jp,cel,p);

[un,up,~,~] = ocp(csn/p.csn,csp/p.csp);
cep=cel(1:p.p);cen=cel(p.p+p.s+1:p.p+p.s+p.n);
ecdn=p.kn*sqrt((cen.*csn).*(1-csn/p.csn));
ecdp=p.kp*sqrt((cep.*csp).*(1-csp/p.csp));
opp=phicp+phispa-phiep-up;
op=2*sinh(p.kb*opp);
opn=phicn+phisna-phien-un;
on=2*sinh(p.kb*opn);

end
% function [vnf] = voltn(vx,ecd,phis,phie,u,p)
%     
% vnf=(simp(2*ecd.*sinh( (p.f/(2*p.r*p.ta))*...
%     (phis-phie-u+vx) )))*p.zn(1,2)-p.u;
% end
% function [vnf] = voltp(vx,ecd,phis,phie,u,p)
%     
% vnf=(simp(2*ecd.*sinh( (p.f/(2*p.r*p.ta))*...
%     (phis-phie-u+vx) )))*p.zp(1,2)+p.u;
% end
%% Cathode
% smp=p.s41*( -(p.ksp*2*p.s2)\([0;p.lp*p.u]) );
% phispa=p.s4\([smp;0]+p.ksp\(.25*p.lp^2*[jp;0]) );
% phispa=phispa(1:p.p);
% %phispa=p.s4*phisp-(smp+p.ksp\(.25*p.lp^2*jp) );
% 
% %% Anode
% phisna=(4*p.s7*p.ksn)\(p.ln^2*jn) ;
% %phisna=(4*p.ksn*p.ln^-2*p.s7*phisn)-jn;
% %% Electrolyte
% jc=[jp;zeros(p.s,1);jn];
% phia = -(p.r*p.ta*p.tp*p.ke*p.cmm*log(cel))/p.f - jc;
% phib=(p.smm)\([phia;0]);
% phiea=phib(1:p.x);
%phib=p.smm*[phiep;phies;phien];
%phiea=phib-phia;
%%
% phiep=phiea(1:p.p,:); phien=phiea(p.p+p.s+1:p.p+p.s+p.n,:);
%  k1n=real(asinh((p.u)./(2*(simp(jn))*p.zn(1,2)))/p.kb );
%  k3p=real(asinh((-p.u)./(2*(simp(jp))*p.zp(1,2)))/p.kb );
%  ficn=phien+un-phisn+k1n; phsn=phisn+ficn;
%  ficp=phiep+up-phisp+k3p; phsp=phisp+ficp;
% options = optimset('Display','off','TolFun',2e-6);
% fun=@(x)voltn(x,ecdn,phisn,phien,un,p);
% vn =fsolve(fun,un(1),options);
% fup=@(x)voltp(x,ecdp,phisp,phiep,up,p);
% vp = fsolve(fup,up(1),options);
% phsna=phisna+vn;phspa=phispa+vp;
% fprintf('vn=%3.3d, vp=%3.3s .\n',vn,vp);

%%
%phisa=[phisna;phispa];

%phic=[simp(jn)*p.zn(1,2)-p.u;simp(jp)*p.zp(1,2)+p.u];
%phic=[un(1);up(1)];