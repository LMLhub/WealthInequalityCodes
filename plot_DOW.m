clear;
close all;
load('DOW.mat');

plot(years,stds,'linewidth',3);

xlim([1913 2014]);

ylabel('DJIA annual volatility (year^{-1/2})');
xlabel('Year');

box off
set(gcf, 'Position', [100 100 710 690/2])
set(gcf,'color','w');