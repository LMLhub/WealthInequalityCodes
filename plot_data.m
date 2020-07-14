clear;
load('data.mat');
close all;

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


subplot(2,1,1);
h=plot(1913:2014,zucmanUS(:,2),1916:2000,estate(:,1),1989:2013,preferred(:,1),'linewidth',3);
set(h(1),'Color',blue1);
set(h(2),'Color',black);
set(h(3),'Color',grey4);
xlim([1913 2014]);
set(gca,'xtick',1910:10:2020);
ylim([18 54]);
set(gca,'ytick',18:4:54);
legend('Income tax data','Estate tax data','Survey-based data');
title('Top 1%')
xlabel('Year');
ylabel('Wealth share (%)');
grid off;
box off;

subplot(2,1,2);
h=plot(1917:2012,data(:,5),1916:2000,estate(:,4),1989:2013,preferred(:,2),'linewidth',3);
set(h(1),'Color',blue1);
set(h(2),'Color',black);
set(h(3),'Color',grey4);
legend('Income tax data','Estate tax data','Survey-based data');
xlim([1913 2014]);
set(gca,'xtick',1910:10:2020);
ylim([7 25]);
set(gca,'ytick',7:2:25);
title('Top 0.1%')
xlabel('Year');
ylabel('Wealth share (%)');
grid off;
box off;

set(gcf, 'Position', [100 100 710 690])

set(gcf,'color','w');