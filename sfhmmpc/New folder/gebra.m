function [isn,isp,ien,iep,phis1,phis3,phi1,phi2,phi3,phin,phis,phip]=...
        gebra(w,j11,j33,cs,ce)
cn=cs(1:w.n);cp=cs(w.n+1:w.n+w.p);
cep=ce(1:w.p);ces=ce(w.p+1:w.p+w.s);
cen=ce(w.p+w.s+1:w.n+w.s+w.p);
ien=cumsp(w.zn',j11);
iep=cumsp(w.zp',j33)+w.u;
ie2=repmat(w.u,w.s,1);
isn=w.u - ien; isp=w.u - iep;
phis11=-(cumsp(w.zn',isn))/w.ksn;
ecd1=w.kn*real(((1-cn'/w.csn).*cn'.*cen').^w.aa);
k1n=real(asinh((w.u)./(2*(simp(ecd1))*w.zn(1,2)))/w.kb );
[ocp1,ocp3]=ocp(cn'/w.csn,cp'/w.csp);

y4=cumsp(w.zp',isp);
phis33=-( (y4-y4(end))*w.zp(1,2) )/w.ksp; %% check for changing sign if required
ecd3=w.kp*real(((1-cp'/w.csp).*cp'.*cep').^w.aa);
k3p=real(asinh((-w.u)./(2*(simp(ecd3))*w.zp(1,2)))/w.kb );


ki=(2*(1-w.tp)*w.r*w.ta)/w.f;
y3=cumsp(w.zp',wrev((iep)./w.ke));
phi3=wrev(real( y3 + wrev(ki*log(cep)')- ki*log(cep(1,end)) ));

y2=cumsp(w.zs',wrev((ie2)./w.ke));
phi2=wrev(real( y2+wrev(ki*log(ces)')-ki*log(ces(1,end))+phi3(1,1))) ;

y1=cumsp(w.zn',wrev((ien)./w.ke));
phi1=wrev(real( y1+ wrev(ki*log(cen)')-ki*log(cen(1,end))+phi2(1,1) ) );
%%
k1=(w.tp*w.r*w.ta)/w.f;
y3=cumsp(w.zp',wrev((iep)./w.ke));
phip=wrev(real( y3 + wrev(k1*log(cep)')- k1*log(cep(1,end)) ));

y2=cumsp(w.zs',wrev((ie2)./w.ke));
phis=wrev(real( y2+wrev(k1*log(ces)')-k1*log(ces(1,end))+phip(1,1))) ;

y1=cumsp(w.zn',wrev((ien)./w.ke));
phin=wrev(real( y1+ wrev(k1*log(cen)')-k1*log(cen(1,end))+phis(1,1) ) );
%%
ficn=phi1+ocp1-phis11+k1n; phis1=phis11+ficn;
ficp=phi3+ocp3-phis33+k3p; phis3=phis33+ficp;
end

%%
% ien=cumsim(j11)*zn(1,2);
% iep=cumsim(j33)*zpp(1,2)+iap;
% ie2=repmat(iap,s,1);
% isn=iap - ien; isp=iap - iep;
% phis1=-(cumsim(isn)*zn(1,2))/ksn;
% y4=cumsim(isp);
% phis3=-( (y4-y4(end))*zpp(1,2) )/ksp; %% check for chnaging sign if required
% 
% ki=(2*(1-tp)*r*t)/f;
% y3=cumsim(wrev((iep)./ke(cep,ta)'))*zpp(1,2);
% phi3=wrev(real( y3 + wrev(ki*log(cep)')- ki*log(cep(1,end)) ));
% 
% y2=cumsim(wrev(ie2./ke(ces,ta)'))*zs(1,2);
% phi2=wrev(real( y2+wrev(ki*log(ces)')-ki*log(ces(1,end))+phi3(1,1))) ;
% 
% y1=cumsim(wrev(ien./ke(cen,ta)'))*zn(1,2);
% phi1=wrev(real( y1+ wrev(ki*log(cen)')-ki*log(cen(1,end))+phi2(1,1) ) );
%%
% ie1=.5*ln*cumsummat(n)*j11';
% ie3=.5*lp*cumsummat(p)*j33'+iap;
% ie2=repmat(iap,s,1);
% is1=iap - ie1;is3=iap - ie3;
% phis1=(-0.5*ln*cumsummat(n)*is1)/ksn;
% phis3=(-0.5*lp*flip(cumsummat(p))*is3)/ksp;
% %[phis1,phis3] = fis(oc,j11,j33,p,iap);
% kfi=(2*(tp)*r*t)/f;c3=-real(kfi*log(cep(1,end)));
% phie3=real((lp*.5*flip(cumsummat(p)))*(ie3./ke(cep)')+c3+kfi*log(cep)');
% 
% c2=-real(kfi*log(ces(1,end)))+phie3(1,1);
% phie2=real((ls*.5*flip(cumsummat(s)))*(ie2./ke(ces)')+c2+kfi*log(ces)');
% 
% c1=-real(kfi*log(cen(1,end)))+phie2(1,1);
% phie1=real((ln*.5*flip(cumsummat(n)))*(ie1./ke(cen)')+c1+kfi*log(cen)');
% end
% 
% function y = ke(cee)
% y= .0911+(1.9101*cee)/1e3-1.052*(cee/1e3).^2+.1554*(cee/1e3).^3;
% end
% function[phis1,phis3] = fis(oc,jna,jpa,p,u)
% a=(diag(ones(n-3,1),-1)-2*diag(ones(n-2,1),0)+diag(ones(n-3,1),1));
% hn=ln/(n-1);
% a(end,end)=-1;
% fn=(a*ksn)\((hn.^2)*jna(2:n-1)');
% phis1=[0;fn;fn(end)];
% 
% hp=lp/(p-1);
% gp=(ksp)\(jpa(2:p-1)'*h^2);gp(end)=gp(end)+(u*hp)/ksp;
% gp(1,1)=gp(1,1)-oc;
% a(end,end)=-1;
% a(1,1)=-2.000001;fp=a\gp;
% phis3=[fp(1);fp;fp(end)-(u*hp)/ksp];
% end

