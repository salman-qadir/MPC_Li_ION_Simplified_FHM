function yt = fhmss10t1ss(p,da,u)
y1=da.x0;t=p.tc;
u=reshape(u,length(u),1);
y=reshape(y1,length(y1),1);
qb=y(1:p.qbl);
cnn=y(p.qbl+1);cpp=y(p.qbl+2);
r0=y(p.qbl+2+1);q0=y(p.qbl+2+2);
jsn=y(p.qbl+2+2+2:end);
jn11=u/(p.ln);jp1=-u/(p.lp);
% d=qb(1)/(p.ln*p.nen);
% [uns,~,~,~] = ocp10t1(cnn/p.csn,cpp/p.csn);
% ecdn=real(mean(p.kn*sqrt((d'.*cnn).*(1-cnn/p.csn))));
% ajs=-p.ios*exp(-p.kb*(uns-p.uref));
% cjs=1./(2*ecdn);
% bjs=(-u/(p.ln))*cjs;
% yt.jsn1=((bjs+sqrt( bjs.^2+1-2.*cjs.*ajs )  )./(1./ajs-2.*cjs));
% yt.jsn=da.jsn;
yt.jsn1=jsn';
yt.jsn=jsn;
jn1=jn11-fm(jsn)';
%% electrode  model simplified
c1nn=cnn+(p.xm*t)*(p.f\(-jn11/(3*p.nsn) - (u.*p.mk)/p.ln));
c1pp=cpp+(p.xm*t)*(p.f\(-jp1/(3*p.nsp) + (u.*p.mk)/p.lp));
%y2=((eye(p.M)+t(2)/2*x)\(y0+t(2)/2*x*u1));
%c1nn=p.f\(-jn1/(3*p.nsn) - u/p.ln);
%c1pp=p.f\(-jp1/(3*p.nsp) + u/p.lp);
%% electrolyte simplified
g1=p.ca*([0;0;0;0;qb]);
%      qf(1,:)=(qb(1)+p.xm*((2e-2*p.tp1*u.*ones(p.M,1))/p.f+p.den*2*g1(2)*p.ln^2));
%      qf(2,:)=(qb(2)+p.xm*ones(p.M,1)*p.des*2*g1(5)*p.ls^2);
%     qf(3,:)=(qb(3)+p.xm*((-2e-2*p.tp1*u.*ones(p.M,1))/p.f+p.dep*2*g1(7)*p.lp^2));
 qf= [qb(1)*p.mk';qb(2)*p.mk';qb(3)*p.mk']+...
  [(p.xxm.*t.*((2e-2*p.tp1*u)/p.f+p.den*2*g1(2)*p.ln^2))';
   (p.xxm.*t.*p.des*2*g1(5)*p.ls^2)';
   (p.xxm.*t.*((-2e-2*p.tp1*u)/p.f+p.dep*2*g1(7)*p.lp^2))'];
%%
% b=-(jn1(:,end)*p.ln^2)/(p.f*p.dsn*6*p.nsn);
% a= c1nn-b/3;
% csn=(a+b*(p.zn./p.ln).^2);
% b1=-(jp1*p.lp^2)/(p.f*p.dsp*6*p.nsp);
% a1= c1pp-b1/3;
% csp=fliplr(a1+b1*((p.zp/p.lp).^2));
%% electrolyte simplified
rt=size(qf);
g=p.ca*([zeros(4,rt(1,2));qf]);
cen=(g(2,:)'.*((p.zn).^2)+g(1,:)'.*ones(length(p.zn),1)');
ces=(g(5,:)'.*((p.zs).^2)+g(4,:)'.*p.zs+g(3,:)'.*ones(length(p.zs),1)');
cep=fliplr(g(7,:)'.*((p.zp).^2)+g(6,:)'.*ones(length(p.zp),1)');
cel=[cen';ces';(cep)'];
yt.cel=cel;
%% Volts
[un,up,~,~] = ocp10t1(c1nn/p.csn,c1pp/p.csp);
ecdn=real((p.kn.*sqrt(((qf(1,:)'/(p.ln*p.nen))'.*c1nn').*(1-c1nn'/p.csn))));
ecdp=real((p.kp*sqrt(((qf(3,:)'/(p.lp*p.nep))'.*c1pp').*(1-c1pp'/p.csp))) );
opn=p.kb\asinh(jn11./(2*ecdn')); yt.opn=opn;yt.ecdn=ecdn;
opp=p.kb\asinh(jp1./(2*ecdp'));
phied=((p.ln+p.lp+2*p.ls)*u)/(2*p.ke) +...
    p.kb\p.tp*p.ke*( log(cel(end,:))-log(cel(1,:))  )';
yn=mean(c1nn/p.csn);
yp=mean(c1pp/p.csp);
yt.socn=(100*(yn-p.xn0)/(p.xn1-p.xn0));
yt.socp=(100*(yp-p.xp0)/(p.xp1-p.xp0));
   %% sei 
%yt.opns1=(-p.kb)\(log(-(jsn.*ones(1,p.M))/p.ios));
opns1=opn+un;-p.uref+0.355; yt.opns1=opns1;
%yt.opns=opn+un+(jn1*r0*p.ln)/(3*p.nsn);%  check this one
yt.un=un;yt.opn=opn;yt.un=un;
opns1=opn+un;-p.uref+0.355; yt.opns1=opns1;
jsn1=-p.an*p.ios*exp(-p.kb*opns1); %%1e8
qtt=2.1e-1*(p.a*p.ln*jsn1);yt.qtt=qtt;%3e-4
rfilmt=-2e-3*(p.mp*jsn1.*p.mk)/(p.pp*p.kps*p.f);
qt=q0+t*p.xxm.*fm(qtt)';
yt.soh=qt/p.c;
% yt.jsn=-p.ios*exp(-p.kb*opns1);
rfilm=r0+t*p.xxm.*fm(rfilmt)';yt.rfilmt=rfilmt;
yt.rfilm=rfilm;
yt.v=(opp-opn+phied+up-un-u*p.rc*p.a-0*u.*rfilm*p.a)';
yt.x=[qf;fm(c1nn);fm(c1pp);fm(rfilm);fm(qt);fm(rfilmt);fm(jsn1)]';
yt.t_inter = .5*p.xt*p.t+0.5*(p.t*2*da.t0);
yt.x0 = yt.x(1,:);
yt.t0 = da.t0+p.t;
% if yt.v==real(yt.v)
% set_param(gcs, 'SimulationCommand', 'pause')
% end
end
function o=fm(i)
o=reshape(i,1,length(i));
end
