function [dsfhmss, dsfhmd] = test10t1(df)
initial10t1;
%%
p.te=3786;p.t2=p.te;
p.xm=p.xm2;p.xxm=p.xxm2;p.t=p.t2;p.tc=p.t2/2;p.mk=p.mk2;
t=linspace(0,p.te,p.te+1);
%t=[0,p.te];
y.x0=p.y0.x;y.t0=1;
tc=1900;
tic
% for i=1:p.te+1 
y2  = fhmss10t1ss(p,y,p.u);
 % yt(:,i)=y(:,p.M)';
%  yt0= yt(:,i)';
% end
% dsfhmss=misc10t1(yt,p,t);
toc
%socn=100*(yt(4,:)/p.csn-p.xn0)/(p.xn1-p.xn0);
%ocp=100*(yt(5,:)/p.csp-p.xp0)/(p.xp1-p.xp0);
%figure
%plot(t,socn)
%figure
%plot(t,socp)
%tr=wrev(t*p.xt+t);


%%
%d.M=[eye(p.qbl+2),zeros(p.qbl+2,2+p.n+p.p);...
 %   zeros(2+p.n+p.p,p.qbl+2),0*eye(2+p.n+p.p)];
%event = @(t,y) cutoff(t,y,p);
%options = odeset('Mass',d.M,'AbsTol',100e-0,'RelTol',100e-0,'Events',event);
%odeset('RelTol',1e0,'AbsTol',1e-0);
%%
% tic
% options = odeset('AbsTol',10e-0,'RelTol',30e-0);
% yt1(:,1)=p.y0;yt0=p.y0;
% for i=1:p.te
% [ta,y] = ode15s(@(t,y) fhmss10t1(t,y,p), [t(i),t(i+1)],yt0, options);
%  yt1(:,i+1)=y(length(ta),:)';
%  yt0= yt1(:,i+1)';
% end
% dsfhmd=misc10t1(yt1,p,t);
% toc
%%
% %[t,y,te,ye,ie] 
%  [t,y] = ode15s(@(t,y) fhmss9t1(t,y,p), p.ts,yt0, options);
% toc

% d.ye=ye';d.ie=ie';d.te=te';
end
%%
 %figures9t1;
% figure 
% plot(d.t,d.v,'LineWidth',1);hold on;
% plot(dt.t,dt.v,'-.','LineWidth',2);hold on;
% % legend('Pseudo spectral','Pspectral','Finite difference')
% % xlabel('Time[s]')
% % ylabel('Volts[v]')
% 
% figure;plot(d.t,d.socn,'-+','LineWidth',2);hold on;
% plot(dt.t,dt.socn,'-.','LineWidth',2);hold on;