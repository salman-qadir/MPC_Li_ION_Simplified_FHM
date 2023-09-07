%clearvars; close all; clc;
p=param10t1;
%ab=p.c;bc=p.rsei;soh=1;rs=p.rsei;socn=1;
 a6=load('C:\Users\salma\MATLAB Drive\T10_SEI\sfhmmpc\dsfhm2com.mat');
 dsfhm4cv=a6.dsfhm2com;
 soh=dsfhm4cv.soh;
 ab=soh(1,end)*p.c;
 rs=dsfhm4cv.rs;
 bc=rs(1,end);
for i=470:550
initial10t1;
tic
ds= nmpcss10t1a(p); 
i
ds.et=toc;
ab=ds.x(end,7);
bc=ds.x(end,6);
cd=ds.socn(end);
socn=[socn,cd];
soh=[soh,ab/p.c];
rs=[rs,bc'];
% save('C:\Users\salma\MATLAB Drive\T10_SEI\sfhmmpc\dsfhm10t1sscc','dsfhm10t1sscc')
end
% figures10t1
% rs1= [dsfhm4cv.rs,rs];soh1=[dsfhm4cv.soh,soh];
% rs2=[rs1(1:401),rs1(403:end)];soh2=[soh1(1:401),soh1(403:end)];
dsfhm2com.rs=rs; dsfhm2com.soh=soh;dsfhm2com.soc=socn;
save('C:\Users\salma\MATLAB Drive\T10_SEI\sfhmmpc\dsfhm2com','dsfhm2com')
