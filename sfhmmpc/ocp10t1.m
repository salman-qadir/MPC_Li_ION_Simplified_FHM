function [un,up,dn,dp] = ocp10t1(xn,xp)


 un=.1493+.8493.*exp(-61.79.*xn)+.3824.*exp(-665.8.*xn)-...
 exp(39.42.*xn-41.92)-.03131.*atan(25.59.*xn-4.099)-...
 .009434*atan(32.49.*xn-15.74);
 up=-10.72.*xp.^4+23.88.*xp.^3-16.77.*xp.^2+2.595.*xp+4.563;
  
  dn=1;dp=1;
%  dp=(-4*10.72.*(xp.^3)+3*23.88.*(xp.^2)-2*16.77.*xp+2.595);
% dn=-61.79*0.8493.*exp(-61.79.*xn)-665.8*0.3824*exp(-665.8.*xn)-...
% 39.42.*exp(39.42.*xn-41.92)-25.59*.03131.*(1./(1+(25.59.*xp-4.099).^2))-...
%     32.49*.009434.*(1./(1+(32.49.*xp-15.74).^2));


% x=[6611086620.09960,-69028263671.7802,328236538999.499,-931401492903.281,...
%     1720336928105.19,-2060152086623.29,1315255879203.55,369587885165.580,....
%     -2020789072955.12,2717562632605.36,-2355658466095.10,1499230531776.84,....
%     -730679813036.586,276604196352.595,-81292607749.2033,18308840708.0111,...
%     -3066329432.35848,357234157.883879,-23631860.5928548,-190107.740083961,...
%     224142.853663549,-24838.6956133922,1486.99298839729,-51.7526001019525,...
%     1.05542548379191];
% un=(x(1).*xn.^24)+(x(2).*xn.^23)+(x(3).*xn.^22)+(x(4).*xn.^21)+...
%     (x(5).*xn.^20)+(x(6).*xn.^19)+(x(7).*xn.^18)+(x(8).*xn.^17)+...
% (x(9).*xn.^16)+(x(10).*xn.^15)+(x(11).*xn.^14)+(x(12).*xn.^13)+...
%     (x(13).*xn.^12)+(x(14).*xn.^11)+(x(15).*xn.^10)+(x(16).*xn.^9)+...
% (x(17).*xn.^8)+(x(18).*xn.^7)+(x(19).*xn.^6)+(x(20).*xn.^5)+...
%     (x(21).*xn.^4)+(x(22).*xn.^3)+(x(23).*xn.^2)+(x(24).*xn)+x(25);  

%  xn=csn/p.csn;
%   xp=csp/p.csp;
% p=par;
% xn=p.xn1:(p.xn0-p.xn1)/999:p.xn0;
% xp=p.xp1:(p.xp0-p.xp1)/999:p.xp0;
%     for i = 1:length(xn)
%  set(gca,'XDir','reverse') 
%  plot((xn-p.xn0)/(p.xn1-p.xn0),up-un);
%  p=par;
%  xn=p.xn1:(p.xn0-p.xn1)/999:p.xn0;
% un(1,:)=((-4.6e10).*(xn.^24))+((4.86e11).*(xn.^23))-((2.32e12).*(xn.^22))+...
% ((6.51e12).*(xn.^21))-((1.15e13).*(xn.^20))+((1.16e13).*(xn.^19))-...
% ((1.37e12).*(xn.^18))-((1.72e13).*(xn.^17))+((3.42e13).*(xn.^16))-...
% ((4e13).*(xn.^15))+((3.38e13).*(xn.^14))-((2.18e13).*(xn.^13))+...
% (1.1e13).*(xn.^12)-(4.41e12).*(xn.^11)+(1.4e14).*(xn.^10)-...
% ((3.52e11).*(xn.^9))+((6.95e10).*(xn.^8))-((1.06e10).*(xn.^7))+...
% ((1.24e9).*(xn.^6))-((1.06e8).*(xn.^5))+((6.57e6).*(xn.^4))-...
% ((2.78e5).*(xn.^3))+((7.67e3).*(xn.^2))-((131.06).*xn)+1.4367;

% dn(i,:)=-1.1e12.*xn.^23+1.12e13.*xn.^22-5.11e13.*xn.^21+1.37e14.*xn.^20-2.29e14.*xn.^19+...
% 2.2e14.*xn.^18-2.47e13.*xn.^17-2.92e14.*xn.^16+5.74e14.*xn.^15-6.01e14.*xn.^14+...
% 4.73e14.*xn.^13-2.83e14.*xn.^12+1.32e14.*xn.^11-4.85e13.*xn.^10+1.4e13.*xn.^9-...
% 3.17e12.*xn.^8+5.56e11.*xn.^7-7.44e10.*xn.^6+7.41e9.*xn.^5-5.32e8.*xn.^4+...
% 2.63e7.*xn.^3-8.34e5.*xn.^2+1.53e4.*xn-131.06;
%     end
end

