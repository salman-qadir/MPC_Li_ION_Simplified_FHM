function d =misc10t1(y,p,t)
%y=y1';%reshape(y1,numel(y1)/length(t),length(t));
d.y=y;d.t=t;
d.qb=y(1:p.qbl,:);
d.cnn=y(p.qbl+1,:);d.cpp=y(p.qbl+2,:);
d.g=p.ca*([zeros(4,length(t));d.qb]);
% d.g=y(p.qbl+3:p.qbl+p.gl+2,:);
% d.v=y(p.qbl+p.gl+3,:);
% d.socn=y(p.qbl+p.gl+4,:);
% d.socp=y(p.qbl+p.gl+5,:);
% d.csn=y(p.qbl+p.gl+5+1:p.qbl+p.gl+5+p.n,:);
% d.csp=y(p.qbl+p.gl+5+p.n+1:p.qbl+p.gl+5+p.n+p.p,:);
% d.cel=y(p.qbl+p.gl+5+p.n+p.p+1:p.qbl+p.gl+5+p.n+p.p+p.x,:);
% d.cen=d.cel(1:p.n,:);d.ces=d.cel(p.n+1:p.n+p.s,:);
% d.cep=d.cel(p.n+p.s+1:p.x,:);
tt=length(t);
d.jn=p.u/(p.ln)*ones(p.n,tt);
d.jp=-p.u/(p.lp)*ones(p.n,tt);
d.u=p.u*ones(1,tt);%
%%
b=-(d.jn(end,:)*p.ln^2)/(p.f*p.dsn*6*p.nsn);
a= d.cnn-b/3;
d.csn=(a+b.*(p.zn'./p.ln).^2);
b1=-(d.jp(end,:)*p.lp^2)/(p.f*p.dsp*6*p.nsp);
a1= d.cpp-b1/3;
d.csp=fliplr(a1+b1.*((p.zp'/p.lp).^2));
%% electrolyte simplified
d.cen=(d.g(2,:)'.*((p.zn).^2)+d.g(1,:)'.*ones(length(p.zn),1)');
d.ces=(d.g(5,:)'.*((p.zs).^2)+d.g(4,:)'.*p.zs+d.g(3,:)'.*ones(length(p.zs),1)');
d.cep=fliplr(d.g(7,:)'.*((p.zp).^2)+d.g(6,:)'.*ones(length(p.zp),1)');
d.cel=[d.cen';d.ces';(d.cep)'];
%% Volts
d.cenn=mean(d.cen');d.cepp=mean(d.cep');
[d.un,d.up,~,~] = ocp10t1(d.csn(1,:)/p.csn,d.csp(1,:)/p.csp);
d.ecdn=real(mean(p.kn*sqrt((d.cen'.*d.csn).*(1-d.csn/p.csn))));
d.ecdp=real(mean(p.kp*sqrt((d.cep'.*d.csp).*(1-d.csp/p.csp))));
% d.ecdn1=real(p.kn*sqrt(((d.cenn).*(d.cnn)).*(1-(d.cnn)/p.csn)));
% d.ecdp1=real(p.kp*sqrt(((d.cepp).*(d.cpp)).*(1-(d.cpp)/p.csp)));
d.opn=p.kb\asinh(d.jn(1,:)./(2*d.ecdn));
d.opp=p.kb\asinh(d.jp(1,:)./(2*d.ecdp));
d.phied=((p.ln+p.lp+2*p.ls)*p.u)/(2*p.ke) +...
    p.kb\p.tp*p.ke*( log(d.cel(end,:))-log(d.cel(1,:))  );
d.v=d.opp-d.opn+d.phied+fliplr(d.up)-d.un-p.u*p.rc*p.a;
d.yn=mean(d.csn/p.csn);
d.yp=mean(fliplr(d.csp)/p.csp);
d.socn=100*(d.yn-p.xn0)/(p.xn1-p.xn0);
d.socp=100*(d.yp-p.xp0)/(p.xp1-p.xp0);
end