function d = nmpcss10t1(w)
%atol_ode_real = 1e-9;rtol_ode_real = 1e-9;
d=w.y0; da=w.y0;da.x0=w.y0.x; d.t = []; d.u = [];
da.t0=w.tme;u0=w.y0.u0;da.u0=u0;opt=optt(1,u0);d.u = da.u0(1);
%% loop
for ij=1:w.iter-1
%     d1.x0=d1.x(end,:);
    w.ij=ij;
    %% optimal control design
   [ua, ~, ~, ~] = solveocp(w,da,opt);
   %%  apply controller
   u2=ua(:,1);  % u2=w.u;
   w.xm=w.xm1;w.xxm=w.xxm1;w.t=w.t1;w.tc=w.t1;w.mk=w.mk1;
   da= fhmss10t1ss(w,da,u2);
   da.u0 = [ua(:,2:size(ua,2)) ua(:,size(ua,2))];
   d = store(d,da,u2,w); d.ij=ij;
   g = loop(w,d,da,ij,u2); if g==0; break;  end
end
end
function [u, V, flag, out] = solveocp(w, da, options)
    w.xm=w.xm2;w.xxm=w.xxm2;w.t=w.t2;w.tc=w.t2/2;w.mk=w.mk2;
    A   = [];b   = [];
    Aeq = [];beq = [];p=0;
    lb  = -(((abs(w.cr)+p)*w.c)/w.a)*ones(1,w.M);
    ub  = (((abs(w.cr))*w.c)/w.a)*ones(1,w.M)*0;
    [u,V,flag,out]=fmincon(@(u) costf(w,da,u),da.u0,A,...
    b,Aeq,beq,lb,ub,@(u) constraint(w,da,u), options);
end
function cost = costf(w,da,u)
    y = fhmss10t1ss(w,da,u);
    %jj=ij+w.N
    %t=t0+w.tn
%% a
%     q=1e-1;j1=1e1*0;
%     k=1e3;j=1e4*0; 
%                 costr=sum( k*(y.socn-w.socr(w.ij)).^2 +...
%               q*((fm(y.x(:,9))).^2) +   j1*u.^2);
%    costt =j*(105-y.socn(1)).^2;
    %% b
%    q=1e5;j1=1e-1;
%     k=4e1;j=1e0; 
%                 costr=sum( k*(y.socn-w.socr(w.ij)).^2 +...
%               q*((fm(y.x(:,6)))) +   j1*u.^2);
%    costt =0*j*(100-y.socn(1)).^2;
%%  c
    q=1e3; k=8e1; j=0e0; %q=1e9; k=1.5e1;
     if(y.socn>80)
     q=1e0;k=1e1;j=1;    
     end
               costr=sum( k*(y.socn-w.socr(w.ij)).^2 +...
               q*abs(fm(y.x(:,9))) + 0*j*u.^2);
               costt =j*(100-y.socn(1)).^2;
%     q=6e0; k=1e2; j=0e0; %q=1e9; k=1.5e1;
% %      if(y.socn>80)
% %      q=1e0;k=.5e1;j=1;    
% %      end
%                costr=sum( k*(y.socn-100).^2 +...
%                -q*abs(fm(y.x(:,5))) + 0*j*u.^2);
%                costt =0*j*(100-y.socn(1)).^2;
% for  rfilm cost function q =1e-12 to 9.97e7 works. k=1e0
%  for   jsn   cost function  input varies around
% q=1e0 and k=6.31e1
%% cccv
%       k=1.7e1;j=1e-1; 
%                costr=sum( k*(y.socn-100).^2);
%                costt =0*j*(100-y.socn(1)).^2;
     %%
%      %t=da.t0+(w.N+1)*w.t
%    %u=da.u0(:,w.N)
   cost=costr+costt;
end
function [c,ceq] = constraint(w,da,u)
     y = fhmss10t1ss(w,da,u);
     cr   = [-y.socn;y.socn-100;-y.socp;y.socp-100;
     y.v(1)-4.3; -y.v(1)+1.125];% 4.118
%    cr   = [ -y.socn;y.socn-100;-y.socp;y.socp-100;
%      y.v-4.5; -y.v+1.3;(-min(y.cel))+1e-3;-0+fm(y.jsn)];
     ceqr = [];
     ct   = [];
     ceqt = [];
     c = [cr ct];
     ceq = [ceqr ceqt];
end
function d = store(d,da,u2,~)
d.t = [ d.t; da.t0 ];d.socp=[d.socp,da.socp];
d.opns1=[d.opns1,fm(da.opns1)];%d.opns=[d.opns,fm(da.opns)];
d.cel=[d.cel,da.cel];d.u = [ d.u; u2 ];
d.v=[d.v,da.v];d.x=[d.x;da.x];d.jsn=[d.jsn,fm(da.jsn)];d.jsn1=[d.jsn1,fm(da.jsn1)];
d.socn=[d.socn,da.socn];d.opn=[d.opn,fm(da.opn)];d.soh=[d.soh,fm(da.soh)];
d.rfilm=[d.rfilm,da.rfilm'];d.un=[d.un,fm(da.un)];
end
function g = loop(w,d,d1,ij,u2)
    g=1;
     if rem(ij,100)==0
         fprintf('\rij\t=\t%5.1f',ij); fprintf('\rVolt\t=\t%5.2f',d1.v(end));
         fprintf('\rSOCN\t=\t%5.2f',d1.socn(end));
         fprintf('\rSOCR\t=\t%5.2f',w.socr(ij));
         fprintf('\rinput\t=\t%5.2f  \r',u2);
     end     
     if (max(d1.v)>4.5)||(min(d1.v)<1.4)||(min(min(d1.cel))<1e-3)||max(abs(d1.socn-100))<.8||max(abs(d1.socp-100))<.8||ij==length(w.iter)-w.N      
         fprintf('\rij\t=\t%1f',ij); fprintf('\rVolt\t=\t%5.2f',d.v(end));
         fprintf('\rSOCN\t=\t%5.2f',d.socn(end));g=0; 
     end
end
%%
function opt= optt(i,u0)
tol_opt = 2.16e-6; %.00216e-5
switch i
   case 1
    opt = optimset('Display','off','TolFun', tol_opt,...
    'MaxIter', 500,'Algorithm', 'active-set',...
    'FinDiffType', 'forward','RelLineSrchBnd', [],...
    'RelLineSrchBndDuration', 7,'TolConSQP', tol_opt);
   case 2
    opt = optimset('Display','off','TolFun', tol_opt,...
    'MaxIter', 2000,'Algorithm', 'interior-point',...
    'AlwaysHonorConstraints','bounds','FinDiffType','forward',...
    'HessFcn', [],'Hessian', 'bfgs','HessMult', [],...
    'InitBarrierParam', 0.1,'InitTrustRegionRadius', ...
    sqrt(size(u0,1)*size(u0,2)),'MaxProjCGIter',...
    2*size(u0,1)*size(u0,2),'ObjectiveLimit', -tol_opt,...
    'ScaleProblem', 'obj-and-constr','SubproblemAlgorithm', ...
    'cg','TolProjCG', 1e-2,'TolProjCGAbs', tol_opt);
   case 3
    opt = optimset('Display','off','TolFun', tol_opt,...
    'MaxIter', 2000,'Algorithm', 'trust-region-reflective',...
    'Hessian', 'off','MaxPCGIter', max(1,floor(size(u0,1)*size(u0,2)/2)),...
    'PrecondBandWidth', 0,'tolPCG', 1e-1);
   case 4
    opt = optimset('Display','off','TolFun', tol_opt,...
    'MaxIter', 10000,'Algorithm', 'sqp',...
    'FinDifftype', 'forward','RelLineSrchBnd', [],...
    'RelLineSrchBndDuration', 1,'TolConSQP', 1e-30);
 end
end
function o=fm(i)
o=reshape(i,1,length(i));
end
% 
% function o=avg(v,n)
% k=length(v);
% if k<=n
%     n=k-1;
% end
% o=mean(v(k-n:end));
% end