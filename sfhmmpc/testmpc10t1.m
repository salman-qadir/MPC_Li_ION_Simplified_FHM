clearvars; close all; clc;
p=param10t1;
ab=p.c;bc=p.rsei;soh=1;rs=p.rsei;
% for i=1:400
initial10t1;
tic
dsfhm10t1ss2c= nmpcss10t1(p);     
dsfhm10t1ss2c.et=toc;
% ab=dsfhm10t1sscc.x(end,7);
% bc=dsfhm10t1sscc.x(end,6);
% soh=[soh,ab/p.c];        
% s=[rs,bc'];
save('C:\Users\salma\MATLAB Drive\T10_SEI\sfhmmpc\dsfhm10t1ss2c',...
    'dsfhm10t1ss2c')
%end
% format long
% dsfhm10t1ss2c.soh(end)
% dsfhm10t1ss2c.x(end,6)
figures10t1a
%dsfhm4cc.rs=rs; dsfhm4cc.soh=soh;rs= [dsfhm4cv.rs,rs];soh=[dsfhm4cv.soh,soh];
%save('C:\Users\salma\MATLAB Drive\T10_SEI\sfhmmpc\dsfhm4cc','dsfhm4cc')
