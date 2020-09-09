clear;
tic;
close all;
load('tau_with_earnings.mat')

LOWE=5;
grey1=[0.3 0.3 0.3];
grey2=[0.4 0.4 0.4];
grey3=[0.5 0.5 0.5];
grey4=[0.6 0.6 0.6];
black=[0 0 0];
blue1=[0 0 1];
blue2=[0 0 0.5];
blue3=[0 0.45 0.74];
blue4=[0.3 0.75 0.93];
blue5=[0.68 0.92 1];
red1=[1 0 0];
red2=[0.5 0 0];
red3=[0.85 0.33 0.1];
red4=[0.64 0.08 0.18];
purple1=[0.75 0 0.75];
purple2=[0.49 0.18 0.56];
purple3=[1 0 1];
purple4=[0.85 0.7 1];
purple5=[1 0.6 0.78];
yellow1=[1 1 0];
yellow2=[1 0.84 0];
yellow3=[0.93 0.69 0.13];
yellow4=[0.87 0.49 0];
green1=[0 1 0];
green2=[0 0.5 0];
green3=[0.47 0.67 0.19];

hhhhh1=subplot(2,5,1:3);
[xx err]=moving_average(tautau3,LOWE);
xxx1=1929:2009;
yyy1=(xx3-err3')';
yyy2=(xx3+err3')';
hh0=fill([xxx1 fliplr(xxx1)],[yyy1 fliplr(yyy2)],red1);
set(hh0,'facealpha',.25)
hold on;
plot([0 1e5],[0 0],'color',grey3,'linestyle','--','linewidth',2);
%plot(1929:2009,-(moving_average(diff(earnings)./earnings(1:end-1)-(diff(xave)./xave(1:end-1))',LOWE*2)),'color',grey1,'linestyle',':','linewidth',2);
h1=plot(1929:2009,tautau3',':k','linewidth',1);
h3=plot(1929:2009,xx3,'color',red1,'linewidth',3);
h4=plot(1929:2009,xx1,'-.','color',blue4,'linewidth',3);
h5=plot(1929:2009,xx2,':','color',yellow2,'linewidth',3);
hold off;
% grid
grid off;
box off
xlim([1930 2010]);
set(gca,'xtick',1920:10:2020);
ylim([-0.1 0.14]);
set(gca,'ytick',-0.1:0.02:0.14);
xlabel('Year');
ylabel('Reallocation rate (year^{-1})');
hhh1=legend([h1 h3 h4 h5],'$\tau_{1\%} \left(t\right)$ -- no earnings','$\widetilde{\tau}_{1\%} \left(t\right)$ -- no earnings','$\widetilde{\tau}_{1\%} \left(t\right)$ -- correlated earnings','$\widetilde{\tau}_{1\%} \left(t\right)$ -- anti-correlated earnings');
set(hhh1,'interpreter','latex')
tit1=title('Top 1%');P=get(tit1,'Position');set(tit1,'Position',[P(1)+45 P(2) P(3)]);

hhhhh2=subplot(2,5,4:5);
[xx err]=moving_average(tautau3,LOWE);
xxx1=1929:2009;
yyy1=(xx3-err3')';
yyy2=(xx3+err3')';
hh0=fill([xxx1 fliplr(xxx1)],[yyy1 fliplr(yyy2)],red1);
set(hh0,'facealpha',.25)
hold on;
plot([0 1e5],[0 0],'color',grey3,'linestyle','--','linewidth',2);
%h1=plot(1929:2009,tautau3','k','linewidth',2);
h3=plot(1929:2009,xx3,'color',red1,'linewidth',3);
h4=plot(1929:2009,xx1,'-.','color',blue4,'linewidth',3);
h5=plot(1929:2009,xx2,':','color',yellow2,'linewidth',3);
hold off;
% grid
grid off;
box off
xlim([1980 2010]);
set(gca,'xtick',1920:10:2020);
ylim([-0.04 0.01]);
set(gca,'ytick',-0.04:0.01:0.02);
xlabel('Year');
ylabel('Reallocation rate (year^{-1})');
%hhh1=legend([h3 h4 h5],'$\widetilde{\tau}_{1\%} \left(t\right)$ -- no earnings','$\widetilde{\tau}_{1\%} \left(t\right)$ -- correlated earnings','$\widetilde{\tau}_{1\%} \left(t\right)$ -- anti-correlated earnings');
%set(hhh1,'interpreter','latex')

hhhhh3=subplot(2,5,6:8);
[xx err]=moving_average(tautau6,LOWE);
xxx1=1929:2009;
yyy1=(xx6-err6')';
yyy2=(xx6+err6')';
hh0=fill([xxx1 fliplr(xxx1)],[yyy1 fliplr(yyy2)],red1);
set(hh0,'facealpha',.25)
hold on;
plot([0 1e5],[0 0],'color',grey3,'linestyle','--','linewidth',2);
h1=plot(1929:2009,tautau6',':k','linewidth',1);
h3=plot(1929:2009,xx6,'color',red1,'linewidth',3);
h4=plot(1929:2009,xx4,'-.','color',blue4,'linewidth',3);
h5=plot(1929:2009,xx5,':','color',yellow2,'linewidth',3);
hold off;
% grid
grid off;
box off
xlim([1930 2010]);
set(gca,'xtick',1920:10:2020);
ylim([-0.15 0.2]);
set(gca,'ytick',-0.15:0.05:0.20);
xlabel('Year');
ylabel('Reallocation rate (year^{-1})');
hhh1=legend([h1 h3 h4 h5],'$\tau_{0.1\%} \left(t\right)$ -- no earnings','$\widetilde{\tau}_{0.1\%} \left(t\right)$ -- no earnings','$\widetilde{\tau}_{0.1\%} \left(t\right)$ -- correlated earnings','$\widetilde{\tau}_{0.1\%} \left(t\right)$ -- anti-correlated earnings');
set(hhh1,'interpreter','latex')
tit2=title('Top 0.1%');P=get(tit2,'Position');set(tit2,'Position',[P(1)+45 P(2) P(3)]);

hhhhh4=subplot(2,5,9:10);
[xx err]=moving_average(tautau6,LOWE);
xxx1=1929:2009;
yyy1=(xx6-err6')';
yyy2=(xx6+err6')';
hh0=fill([xxx1 fliplr(xxx1)],[yyy1 fliplr(yyy2)],red1);
set(hh0,'facealpha',.25)
hold on;
plot([0 1e5],[0 0],'color',grey3,'linestyle','--','linewidth',2);
%h1=plot(1929:2009,tautau6','k','linewidth',2);
h3=plot(1929:2009,xx6,'color',red1,'linewidth',3);
h4=plot(1929:2009,xx4,'-.','color',blue4,'linewidth',3);
h5=plot(1929:2009,xx5,':','color',yellow2,'linewidth',3);
hold off;
% grid
grid off;
box off
xlim([1980 2010]);
set(gca,'xtick',1920:10:2020);
ylim([-0.07 0.01]);
set(gca,'ytick',-0.07:0.01:0.01);
xlabel('Year');
ylabel('Reallocation rate (year^{-1})');
%hhh1=legend([h3 h4 h5],'$\widetilde{\tau}_{0.1\%} \left(t\right)$ -- no earnings','$\widetilde{\tau}_{0.1\%} \left(t\right)$ -- correlated earnings','$\widetilde{\tau}_{0.1\%} \left(t\right)$ -- anti-correlated earnings');
%set(hhh1,'interpreter','latex')

set(gcf,'color','w');
set(gcf, 'Position', [20 20 750 610])

p=get(hhhhh1,'position');p(3)=p(3)*0.87;set(hhhhh1,'position',p);
p=get(hhhhh3,'position');p(3)=p(3)*0.87;set(hhhhh3,'position',p);
%p=get(hhhhh1,'position');p(3)=p(3)*0.85;set(hhhhh1,'position',p);
%p=get(hhhhh1,'position');p(3)=p(3)*0.85;set(hhhhh1,'position',p);

toc;