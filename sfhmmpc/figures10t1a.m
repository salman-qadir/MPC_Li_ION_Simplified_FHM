clearvars; close all; 
a1=load('C:\Users\salma\MATLAB Drive\T10_SEI\sfhmmpc\dsfhm10t1ss2c.mat');
a2=load('C:\Users\salma\MATLAB Drive\T10_SEI\sfhmmpc\dsfhm10t1ss2cc.mat');
%a3=load('C:\Users\salma\MATLAB Drive\T10_SEI\sfhmmpc\dsfhm10t1ss4c.mat');
%a4=load('C:\Users\salma\MATLAB Drive\T10_SEI\sfhmmpc\dsfhm10t1ss4cc.mat');
sqq=load('C:\Users\salma\MATLAB Drive\T9_ss_mpc\New Folder\sqq.mat');
dsfhm10t1ss=a1.dsfhm10t1ss2c;
dsfhm10t1sscc=a2.dsfhm10t1ss2cc;
%dsfhm10t1ss3c=a3.dsfhm10t1ss4c;
%dsfhm10t1ss3cv=a4.dsfhm10t1ss4cc;
sq=sqq.sqq;
p=param10t1;
ab=p.c;bc=p.rsei;soh=1;rs=p.rsei;
p.cr=-2;
initial10t1
soc2r=p.socr;
%p.cr=-4;
initial10t1
soc4r=p.socr;
t1=linspace(1,dsfhm10t1ss.ij*p.t1,length(dsfhm10t1ss.v));
t2=linspace(1,dsfhm10t1sscc.ij*p.t1,length(dsfhm10t1sscc.v));
%t3=linspace(1,dsfhm10t1ss3c.ij*p.t1,length(dsfhm10t1ss3c.v));
%t4=linspace(1,dsfhm10t1ss3cv.ij*p.t1,length(dsfhm10t1ss3cv.v));
t5=linspace( 1,length(p.socr)*p.t1,length(p.socr));
%subplot(5,1,1)
%plot(sq.v(:,3),'-.','LineWidth',2);hold on;
figure
%subplot(2,1,1)
plot(t1(1:2357),abs(p.a*dsfhm10t1ss.u(1:2357)),'LineWidth',2);hold on;
plot(t2(1:2357),abs(p.a*dsfhm10t1sscc.u(1:2357)),'-.','LineWidth',2);hold on;
%plot(t3,abs(p.a*dsfhm10t1ss3c.u),'--','LineWidth',2);hold on;
%plot(t4,abs(p.a*dsfhm10t1ss3cv.u),':','LineWidth',2);hold on;
grid on;
xlabel('Time[s]')
ylabel('Input current[A]')
%legend('Controller 1, 2C Constraint ','CCCV, 2C Constraint ')
legend('HC controller ','SA controller ')
%legend('SEI optimal 2C current input ','CCCV 2C current input ')
% subplot(2,1,2)
%  plot(t1,dsfhm10t1ss.opns1(1:end),'LineWidth',2);hold on;
%  plot(t2,dsfhm10t1sscc.opns1(1:end),'-.','LineWidth',2);hold on;
%   plot(t3,dsfhm10t1ss3c.opns1(1:end),'--','LineWidth',2);hold on;
%   plot(t4,dsfhm10t1ss3cv.opns1 (1:end),'-.','LineWidth',2);hold on;
% grid on;
% xlabel('Time[s]')
% ylabel('Over potential[V]')
% legend('SEI optimal 2C current input ','CCCV 2C current input ','SEI optimal 4C current input ','CCCV 4C current input ')
%legend('SEI optimal 2C current input ','CCCV 2C current input ')
figure
subplot(2,1,1)
plot(t1(1:2357),abs(dsfhm10t1ss.socn(1:2357)),'LineWidth',2);hold on;
plot(t2(1:2357),abs(dsfhm10t1sscc.socn(1:2357)),'-.','LineWidth',2);hold on;
%plot(t3,dsfhm10t1ss3c.socn,'--','LineWidth',2);hold on;
%plot(t4,abs(dsfhm10t1ss3cv.socn),':','LineWidth',2);hold on;
plot(soc2r((1:2357)),'-','LineWidth',2);hold on;
%plot(soc4r,'-','LineWidth',2);hold on;
grid on;
xlabel('Time')
ylabel('SoC[%]')
%legend('SEI optimal 2C current input ','CCCV 2C current input ','{SoC_{Reference 2}} ','SEI optimal 4C current input ','CCCV 4C current input ')
legend('Controller 1, 2C Constraint ','CCCV, 2C Constraint ','{SoC_{Reference 1}} ')
% figure
%legend('SEI optimal 2C current input ','CCCV 2C current input ')
subplot(2,1,2)
plot(t1(1:2357),dsfhm10t1ss.x((1:2357),6),'LineWidth',2);hold on;
plot(t2(1:2357),dsfhm10t1sscc.x((1:2357),6),'-.','LineWidth',2);hold on;
% plot(t3,dsfhm10t1ss3c.x(:,6),'--','LineWidth',2);hold on;
% plot(t4,dsfhm10t1ss3cv.x(:,6),':','LineWidth',2);hold on;
grid on;
xlabel('Time[s]')
ylabel('R film[\ohm m^{2}]')
legend('Controller 1, 2C Constraint ','CCCV, 2C Constraint ')
%legend('SEI optimal 2C current input ','CCCV 2C current input ')
figure
subplot(2,1,1) 
plot(t1(1:2357),dsfhm10t1ss.v(1:2357),'LineWidth',2);hold on;
plot(t2(1:2357),dsfhm10t1sscc.v(1:2357),'-.','LineWidth',2);hold on;
% plot(t3,dsfhm10t1ss3c.v,'--','LineWidth',2);hold on;
% plot(t4,dsfhm10t1ss3cv.v,':','LineWidth',2);hold on;
%legend('a ','b ','c ','d ','e')
%legend('Controller 1, 2C Constraint ','CCCV, 2C Constraint ','Controller 1, 4C Constraint ','CCCV, 4C Constraint ')
%legend('SEI optimal 2C current input ','CCCV 2C current input ')
legend('HC controller ','SA controller ')
grid on;
xlabel('Time[s]')
ylabel('Voltage[v]')
% subplot(2,1,2) 
% plot(t1,100*dsfhm10t1ss.soh,'--','LineWidth',2);hold on;
% plot(t2,100*dsfhm10t1sscc.soh,'-.','LineWidth',2);hold on;
% plot(t3,100*dsfhm10t1ss3c.soh,'--','LineWidth',2);hold on;
% plot(t4,100*dsfhm10t1ss3cv.soh,'-.','LineWidth',2);hold on;
% xlabel('Time[s]')
% ylabel('SoH[%]')
% legend('SEI optimal 2C current input ','CCCV 2C current input ','SEI optimal 4C current input ','CCCV 4C current input ')
% figure
subplot(2,1,2) 
plot(t1(1:2357),100*dsfhm10t1ss.soh(1:2357),'LineWidth',2);hold on;
plot(t2(1:2357),100*dsfhm10t1sscc.soh(1:2357),'-.','LineWidth',2);hold on;
%plot(100*p.soh,'LineWidth',2);hold on;
% plot(t3,100*dsfhm10t1ss3c.soh,'--','LineWidth',2);hold on;
% plot(t4,100*dsfhm10t1ss3cv.soh,':','LineWidth',2);hold on;
grid on;
xlabel('Time[s]')
ylabel('SoH[%]')
legend('HC controller ','SA controller ')
%legend('SEI optimal 2C current input ','CCCV 2C current input ')
grid on;
