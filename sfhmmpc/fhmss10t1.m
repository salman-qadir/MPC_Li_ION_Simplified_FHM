function [yt] = fhmss10t1(~,y,p)    
%p.u=p.u/p.a;
%%  
qb=y(1:p.qbl);
% cnn=y(p.qbl+1);cpp=y(p.qbl+2);
%%
% jn=p.u/(p.ln*p.f)*ones(1,p.n);
% jp=-p.u/(p.lp*p.f)*ones(1,p.p);
jn1=p.u/(p.ln);jp1=-p.u/(p.lp);
%% electrode  model simplified
c1nn=p.f\(-jn1/(3*p.nsn) - p.u/p.ln);
c1pp=p.f\(-jp1/(3*p.nsp) + p.u/p.lp);
%% electrolyte simplified
g1=p.ca*([0;0;0;0;qb]);
qf=[(2e-2*p.tp1*p.u)/p.f+p.den*2*g1(2)*p.ln^2;...
    p.des*2*g1(5)*p.ls^2;...
    -(2e-2*p.tp1*p.u)/p.f+p.dep*2*g1(7)*p.lp^2]; 
%% ODE Format
yt=[qf;c1nn;c1pp];
end
