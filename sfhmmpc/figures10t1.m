a1=load('C:\Users\salma\MATLAB Drive\T10_SEI\sfhmmpc\dsfhm10t1ss.mat');
a2=load('C:\Users\salma\MATLAB Drive\T10_SEI\sfhmmpc\dsfhm10t1sscc.mat');
sqq=load('C:\Users\salma\MATLAB Drive\T9_ss_mpc\New Folder\sqq.mat');
p=param10t1;
ab=p.c;bc=p.rsei;soh=1;rs=p.rsei;
dsfhm10t1ss=a1.dsfhm10t1ss;
dsfhm10t1sscc=a2.dsfhm10t1sscc;
sq=sqq.sqq;
initial10t1
t1=linspace(1,dsfhm10t1ss.ij*p.t1,length(dsfhm10t1ss.v));
t2=linspace(1,dsfhm10t1sscc.ij*p.t1,length(dsfhm10t1sscc.v));
t3=linspace( 1,length(p.socr)*p.t1,length(p.socr));
%subplot(5,1,1)
%plot(sq.v(:,3),'-.','LineWidth',2);hold on;
% figure
% plot(t1,dsfhm10t1ss.v,'-.','LineWidth',2);hold on;
% plot(t2,dsfhm10t1sscc.v,'--','LineWidth',2);hold on;
% legend('proposed controller','CCCV')
% xlabel('Time[s]')
% ylabel('Voltage[v]')
figure
plot(t1,dsfhm10t1ss.x(:,6),'-.','LineWidth',2);hold on;
plot(t2,dsfhm10t1sscc.x(:,6),'--','LineWidth',2);hold on;
xlabel('Time[s]')
ylabel('R film[\ohm m^{2}]')
legend('proposed controller','CCCV')
% figure
% plot(t1,abs(p.a*dsfhm10t1ss.u),'-.','LineWidth',2);hold on;
% plot(t2,abs(p.a*dsfhm10t1sscc.u),'--','LineWidth',2);hold on;
% xlabel('Time[s]')
% ylabel('Input current[A]')
% legend('proposed controller','CCCV')
%  figure
%  plot(t1,dsfhm10t1ss.opns(1:end),'-.','LineWidth',2);hold on;
%  plot(t2,dsfhm10t1sscc.opns (1:end),'--','LineWidth',2);hold on;
% xlabel('Time[s]')
% ylabel('Over potential[V]')
% legend('proposed controller','CCCV')
figure
plot(t1,abs(dsfhm10t1ss.socn),'-.','LineWidth',2);hold on;
plot(t2,abs(dsfhm10t1sscc.socn),'--','LineWidth',2);hold on;
plot(t2,99.5*ones(1,length(t2)),'-','LineWidth',2);hold on;
xlabel('Time')
ylabel('SoC[%]')
legend('proposed controller','CCCV','Reference')
figure
plot(t1,100*(dsfhm10t1ss.soh),'-.','LineWidth',2);hold on;
%plot(abs(p.soh),'-','LineWidth',2);hold on;
plot(t2,100*(dsfhm10t1sscc.soh),'--','LineWidth',2);hold on;
xlabel('Time[s]')
ylabel('SoH[%]')
% legend('proposed controller','CCCV')
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
