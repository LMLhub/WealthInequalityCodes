clear;
tic;
close all;

% load('SZ_res_Dec16.mat')
% tautau3_fixed_zucman=tautau1;
% tautau3_changed_zucman=tautau2;
% tautau5_fixed_zucman=tautau3;
% tautau5_changed_zucman=tautau4;
% load('ES_res_Dec16.mat')
% tautau1_fixed_estate=tautau1;
% tautau1_changed_estate=tautau2;
% tautau4_fixed_estate=tautau3;
% tautau4_changed_estate=tautau4;
% load('PR_res_Dec16.mat')
% tautau1_fixed_preferred=tautau1;
% tautau1_changed_preferred=tautau2;
% tautau2_fixed_preferred=tautau3;
% tautau2_changed_preferred=tautau4;

load('sigma_fixed_notfixed_1_0i1.mat')

%LOWE=0.2;
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

subplot(2,1,1)
[xx1 err1]=moving_average(tautau3_fixed_zucman,LOWE);
[xx2 err2]=moving_average(tautau1_fixed_estate,LOWE);
[xx3 err3]=moving_average(tautau1_fixed_preferred,LOWE);
plot([0 1e5],[0 0],'color',grey3,'linestyle','--','linewidth',2);
hold on;
h1=plot(1914:2014,xx1,'color',blue1,'linewidth',3);
h2=plot(1917:2000,xx2,'color',black,'linewidth',1);
h3=plot(1990:2013,xx3,'color',grey4,'linewidth',3);

[xx1 err1]=moving_average(tautau3_changed_zucman,LOWE);
[xx2 err2]=moving_average(tautau1_changed_estate,LOWE);
[xx3 err3]=moving_average(tautau1_changed_preferred,LOWE);
plot(1914:2014,xx1,'linestyle',':','color',blue1,'linewidth',3);
plot(1917:2000,xx2,'linestyle',':','color',black,'linewidth',1);
plot(1990:2013,xx3,'linestyle',':','color',grey4,'linewidth',3);

grid
grid off;
box off
xlim([1914 2014]);
set(gca,'xtick',1920:10:2020);
ylim([-0.03 0.06]);
set(gca,'ytick',-0.03:0.01:0.06);
title('Top 1%')
xlabel('Year');
ylabel('Reallocation rate (year^{-1})');
legend([h1 h2 h3],'Income tax','Estate tax','Survey-based data')

subplot(2,1,2)
[xx1 err1]=moving_average(tautau5_fixed_zucman,LOWE);
[xx2 err2]=moving_average(tautau4_fixed_estate,LOWE);
[xx3 err3]=moving_average(tautau2_fixed_preferred,LOWE);
plot([0 1e5],[0 0],'color',grey3,'linestyle','--','linewidth',2);
hold on;
h1=plot(1918:2012,xx1,'color',blue1,'linewidth',3);
h2=plot(1917:2000,xx2,'color',black,'linewidth',1);
h3=plot(1990:2013,xx3,'color',grey4,'linewidth',3);


[xx1 err1]=moving_average(tautau5_changed_zucman,LOWE);
[xx2 err2]=moving_average(tautau4_changed_estate,LOWE);
[xx3 err3]=moving_average(tautau2_changed_preferred,LOWE);
plot(1918:2012,xx1,'linestyle',':','color',blue1,'linewidth',3);
plot(1917:2000,xx2,'linestyle',':','color',black,'linewidth',1);
plot(1990:2013,xx3,'linestyle',':','color',grey4,'linewidth',3);

grid
grid off;
box off
xlim([1914 2014]);
set(gca,'xtick',1920:10:2020);
ylim([-0.05 0.07]);
set(gca,'ytick',-0.05:0.01:0.07);
xlabel('Year');
title('Top 0.1%')
ylabel('Reallocation rate (year^{-1})');
legend([h1 h2 h3],'Income tax','Estate tax','Survey-based data')

set(gcf, 'Position', [100 100 710 690])

set(gcf,'color','w');
toc;