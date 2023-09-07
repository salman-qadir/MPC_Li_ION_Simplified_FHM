function d =misca10t1(y1,p)
%%
y=reshape(y1,length(y1),1);
% d.qb=y(1:p.qbl);
% d.cnn=y(p.qbl+1);d.cpp=y(p.qbl+2);
% d.phicn=y(p.qbl+3);
% d.phicp=y(p.qbl+4);
% d.v=d.phicp-d.phicn;
% d.jn=y(p.qbl+4+1:p.qbl+4+p.n);
% d.jp=y(p.qbl+4+p.n+1:p.qbl+4+p.n+p.p);
d.qb=y(1:p.qbl);
d.cnn=y(p.qbl+1);d.cpp=y(p.qbl+2);
%d.g=y(p.qbl+2+1:p.qbl+2+p.gl);
%d.g=p.ca*[zeros(4,1);d.qb];
d.g=p.ca*([zeros(4,1);d.qb]);
jn=p.u/(p.ln);jp=-p.u/(p.lp);
%%
b=-(jn(end)*p.ln^2)/(p.f*p.dsn*6*p.nsn);
a= d.cnn-b/3;
d.csn=(a+b.*(p.zn'./p.ln).^2);
b1=-(jp(end)*p.lp^2)/(p.f*p.dsp*6*p.nsp);
a1= d.cpp-b1/3;
d.csp=wrev(a1+b1.*((p.zp'/p.lp).^2));
%% electrolyte simplified
d.cen=(d.g(2)'.*((p.zn).^2)+d.g(1)'.*ones(length(p.zn),1)');
d.ces=(d.g(5)'.*((p.zs).^2)+d.g(4)'.*p.zs+d.g(3)'.*ones(length(p.zs),1)');
d.cep=fliplr(d.g(7)'.*((p.zp).^2)+d.g(6)'.*ones(length(p.zp),1)');
d.cel=[d.cen';d.ces';(d.cep)'];
%%
[d.un,d.up,~,~] = ocp10t1(d.csn(1)/p.csn,d.csp(end)/p.csp);
d.ecdn=mean(p.kn*sqrt((d.cen'.*d.csn).*(1-d.csn/p.csn)));
d.ecdp=mean(p.kp*sqrt((d.cep'.*d.csp).*(1-d.csp/p.csp)));
d.opn=p.kb\asinh(jn(1)./(2*d.ecdn));
d.opp=p.kb\asinh(jp(1)./(2*d.ecdp));
d.phied=((p.ln+p.lp+2*p.ls)*p.u)/(2*p.ke) + p.kb\2*p.tp*p.ke*( log(d.cel(end))-log(d.cel(1))  );
d.v=d.opp-d.opn+d.phied+d.up-d.un-p.u*p.rc*p.a;
d.yn=mean(d.csn/p.csn);
d.yp=mean(fliplr(d.csp)/p.csp);
d.socn=100*(d.yn-p.xn0)/(p.xn1-p.xn0);
d.socp=100*(d.yp-p.xp0)/(p.xp1-p.xp0);
end