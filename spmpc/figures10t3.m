a1=load('C:\Users\salma\MATLAB Drive\T10_SEI\sfhmmpc\dsfhm10t1ss2cc.mat');
a2=load('C:\Users\salma\MATLAB Drive\T10_SEI\spmpc\dspm10t3ss.mat');
sqq=load('C:\Users\salma\MATLAB Drive\T9_ss_mpc\New Folder\sqq.mat');
dsfhm10t1ss=a1.dsfhm10t1ss2cc;
dspm10t3ss=a2.dspm10t3ss;
sq=sqq.sqq;
initial10t3
figure
%subplot(5,1,1)
%plot(sq.v(:,3),'-.','LineWidth',2);hold on;
plot(dsfhm10t1ss.v,'-','LineWidth',2);hold on;
plot(dspm10t3ss.v,'-','LineWidth',2);hold on;
legend('CCCV_{SFHM}','CCCV_{SPM}')
xlabel('Time[s]')
ylabel('Voltage[v]')
figure
plot(dsfhm10t1ss.x(:,6),'-','LineWidth',2);hold on;
plot(dspm10t3ss.x(:,6),'-','LineWidth',2);hold on;
xlabel('Time[s]')
ylabel('R film[\ohm m^{-2}]')
legend('SFHM Model','SPM Model')
figure
plot(abs(p.a*dsfhm10t1ss.u),'-','LineWidth',2);hold on;
plot(abs(p.a*dspm10t3ss.u),'-','LineWidth',2);hold on;
xlabel('Time[s]')
ylabel('Input current[A]')
legend('CCCV_{SFHM}','CCCV_{SPM}')
figure
 plot(dsfhm10t1ss.opns(3:end),'-','LineWidth',2);hold on;
 plot(dspm10t3ss.opns(3:end),'-','LineWidth',2);hold on;
xlabel('Time[s]')
ylabel('Over potential[V]')
legend('CCCV_{SFHM}','CCCV_{SPM}')
figure
plot(abs(dsfhm10t1ss.socn),'-','LineWidth',2);hold on;
plot(abs(dspm10t3ss.socn),'-','LineWidth',2);hold on;
plot(abs(p.socr),'-','LineWidth',2);hold on;
xlabel('Time')
ylabel('SoC[%]')
legend('CCCV_{SFHM}','CCCV_{SPM}')
figure
plot(100*abs(dsfhm10t1ss.soh),'-','LineWidth',2);hold on;
%plot(abs(p.soh),'-','LineWidth',2);hold on;
plot(100*abs(dspm10t3ss.soh),'-','LineWidth',2);hold on;
xlabel('Time[s]')
ylabel('SoH[%]')
legend('SFHM  Model','SPM Model')
% figure
% plot(dsfhm10t1ss.x(:,6),'-.','LineWidth',2);hold on;
% plot(dsfhm10t1ss1.x(:,6),'-.','LineWidth',2);hold on;
% legend('rfilm')
% figure
% plot(abs(dsfhm10t1ss.u),'-.','LineWidth',2);hold on;
% plot(abs(dsfhm10t1ss1.u),'-.','LineWidth',2);hold on;
% legend('Input 1', 'Input 2')
% xlabel('time')
% ylabel('Input Current[A]')
% figure
% plot(dsfhm10t1ss.opns(3:end),'-.','LineWidth',2);hold on;
% plot(dsfhm10t1ss1.opns(3:end),'-.','LineWidth',2);hold on;
% % plot(dsfhm10t1ss.opn,'-.','LineWidth',2);hold on;
% legend('\eta_{nsr,1}','\eta_{nsr,2}')
% xlabel('Time')
% ylabel('\eta[Volt]')
% figure
% plot(abs(dsfhm10t1ss.socn),'-.','LineWidth',2);hold on;
% plot(abs(dsfhm10t1ss1.socn),'-.','LineWidth',2);hold on;
% legend('SoC 1', 'SoC 2')
% xlabel('Time')
% ylabel('SoC')
