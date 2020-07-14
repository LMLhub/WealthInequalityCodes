clear;
tic;
close all;
load('tau_with_earnings.mat')
plot(1929:2010,earnings./xave','linewidth',3);
xlim([1930 2010]);
xlabel('Year');
ylabel('Earnings-to-wealth ratio');
set(gcf,'color','w');
set(gcf, 'Position', [100 100 710 690/2]);
box off;

toc;