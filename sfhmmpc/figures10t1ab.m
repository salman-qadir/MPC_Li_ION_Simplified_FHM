clearvars; close all; 
a1=load('C:\Users\salma\MATLAB Drive\T10_SEI\sfhmmpc\dsfhm10t1ss2c2e1.mat');
a2=load('C:\Users\salma\MATLAB Drive\T10_SEI\sfhmmpc\dsfhm10t1ss2c4e1.mat');
a3=load('C:\Users\salma\MATLAB Drive\T10_SEI\sfhmmpc\dsfhm10t1ss2c4e2.mat');
a4=load('C:\Users\salma\MATLAB Drive\T10_SEI\sfhmmpc\dsfhm10t1ss2c4e3.mat');
a5=load('C:\Users\salma\MATLAB Drive\T10_SEI\sfhmmpc\dsfhm10t1ss2c8e1.mat');
a6=load('C:\Users\salma\MATLAB Drive\T10_SEI\sfhmmpc\dsfhm10t1ss2c8e2.mat');
dsfhm10t1ss2c2e1=a1.dsfhm10t1ss2c2e1;
dsfhm10t1ss2c4e1=a2.dsfhm10t1ss2c4e1;
dsfhm10t1ss2c4e2=a3.dsfhm10t1ss2c4e2;
dsfhm10t1ss2c4e3=a4.dsfhm10t1ss2c4e3;
dsfhm10t1ss2c8e1=a5.dsfhm10t1ss2c8e1;
dsfhm10t1ss2c8e2=a6.dsfhm10t1ss2c8e2;
% dsfhm10t1ss3c=a3.dsfhm10t1ss3c;
% dsfhm10t1ss3cv=a4.dsfhm10t1ss3cc;
%sq=sqq.sqq;
p=param10t1;
ab=p.c;bc=p.rsei;soh=1;rs=p.rsei;
initial10t1

% t1=linspace(1,dsfhm10t1ss2c1e4.ij*p.t1,length(dsfhm10t1ss.v));
% t2=linspace(1,dsfhm10t1sscc.ij*p.t1,length(dsfhm10t1sscc.v));
% t5=linspace( 1,length(p.socr)*p.t1,length(p.socr));
% figure
subplot(2,1,1)
%plot(abs(p.a*dsfhm10t1ss2c1e4.u),'LineWidth',2);hold on;
%plot(abs(p.a*dsfhm10t1ss2c1e3.u),'LineWidth',2);hold on;
%plot(abs(p.a*dsfhm10t1ss2c1e2.u),'LineWidth',2);hold on;
plot(abs(p.a*dsfhm10t1ss2c2e1.u),'LineWidth',2);hold on;
plot(abs(p.a*dsfhm10t1ss2c4e1.u),'--','LineWidth',2);hold on;
plot(abs(p.a*dsfhm10t1ss2c8e1.u),':','LineWidth',2);hold on;
plot(abs(p.a*dsfhm10t1ss2c4e2.u),'-.','LineWidth',2);hold on;
plot(abs(p.a*dsfhm10t1ss2c8e2.u),'--','LineWidth',2);hold on;
plot(abs(p.a*dsfhm10t1ss2c4e3.u),':','LineWidth',2);hold on;
grid on;
xlabel('Time[s]')
ylabel('Input current[A]')
legend('Q_1 = 2x10^1','Q_1 = 4x10^1',...
    'Q_1 = 8x10^1','Q_1 = 4x10^2','Q_1 = 8x10^2','Q_1 = 4x10^3')
% t9=1:length(dsfhm10t1ss2c9e1.u);
% t7=1:length(dsfhm10t1ss2c7e1.u);
% t66=1:length(dsfhm10t1ss2c6p6e1.u);
% t63=1:length(dsfhm10t1ss2c6p3e1.u);
% id9 = length(t9)-50 < t9 ;
% id7 = length(t7)-150 < t7 ;
% id66 = length(t66)-200 < t66 ;
% id63 = length(t63)-350 < t63 ;
% 
% axes('Position',[.2 .17 .4 .4])
% box on
% plot(t9(id9),abs(p.a*dsfhm10t1ss2c9e1.u(id9)),'LineWidth',2);hold on;
% plot(t7(id7),abs(p.a*dsfhm10t1ss2c7e1.u(id7)),'LineWidth',2);hold on;
% plot(t66(id66),abs(p.a*dsfhm10t1ss2c6p6e1.u(id66)),'LineWidth',2);hold on;
% plot(t63(id63),abs(p.a*dsfhm10t1ss2c6p3e1.u(id63)),'LineWidth',2);hold on;
%%
figure
%subplot(2,1,1)
plot((100*dsfhm10t1ss2c2e1.soh),'LineWidth',2);hold on;
plot((100*dsfhm10t1ss2c4e1.soh),'--','LineWidth',2);hold on;
plot((100*dsfhm10t1ss2c8e1.soh),':','LineWidth',2);hold on;
plot((100*dsfhm10t1ss2c4e2.soh),'-.','LineWidth',2);hold on;
plot((100*dsfhm10t1ss2c8e2.soh),':','LineWidth',2);hold on;
plot((100*dsfhm10t1ss2c4e3.soh),'-.','LineWidth',2);hold on;
 grid on;
% title('a')
 xlabel('Time[s]')
 ylabel('SoH[%]')
legend('Q_1 = 2x10^1','Q_1 = 4x10^1',...
    'Q_1 = 8x10^1','Q_1 = 4x10^2','Q_1 = 8x10^2','Q_1 = 4x10^3')
figure
%subplot(2,1,2)
plot((dsfhm10t1ss2c2e1.socn),'LineWidth',2);hold on;
plot((dsfhm10t1ss2c4e1.socn),'--','LineWidth',2);hold on;
plot((dsfhm10t1ss2c8e1.socn),':','LineWidth',2);hold on;
plot((dsfhm10t1ss2c4e2.socn),'-.','LineWidth',2);hold on;
plot((dsfhm10t1ss2c8e2.socn),':','LineWidth',2);hold on;
plot((dsfhm10t1ss2c4e3.socn),'-.','LineWidth',2);hold on;
 grid on;
 %title('b')
 xlabel('Time[s]')
 ylabel('SoC[%]')
legend('Q_1 = 2x10^1','Q_1 = 4x10^1',...
    'Q_1 = 8x10^1','Q_1 = 4x10^2','Q_1 = 8x10^2','Q_1 = 4x10^3')
% 
% axes('Position',[.25 .3 .4 .4])
% box on
% plot(t9(id9),(dsfhm10t1ss2c9e1.opns(id9)),'LineWidth',2);hold on;
% plot(t7(id7),(dsfhm10t1ss2c7e1.opns(id7)),'LineWidth',2);hold on;
% plot(t66(id66),(dsfhm10t1ss2c6p6e1.opns(id66)),'LineWidth',2);hold on;
% plot(t63(id63),(dsfhm10t1ss2c6p3e1.opns(id63)),'LineWidth',2);hold on;

%%
%subplot(2,1,2)
%plot(dsfhm10t1ss2c1e4.u,'LineWidth',2);hold on;
%plot(dsfhm10t1ss2c1e3.u,'LineWidth',2);hold on;
%  plot(t3,dsfhm10t1ss3c.opns(1:end),'--','LineWidth',2);hold on;
%  plot(t4,dsfhm10t1ss3cv.opns (1:end),'-.','LineWidth',2);hold on;
% grid on;
% xlabel('Time[s]')
% ylabel('Over potential[V]')

