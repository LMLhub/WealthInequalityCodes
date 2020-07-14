clear;
tic;
close all;
load('tau_eqm_top1.mat')

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
[xx err]=moving_average(tautau1z,LOWE);
xxx1=1914:2014;
yyy1=(xx-err')';
yyy2=(xx+err')';
hh0=fill([xxx1 fliplr(xxx1)],[yyy1 fliplr(yyy2)],red1);
set(hh0,'facealpha',.25)
hold on;
plot([0 1e5],[0 0],'color',grey3,'linestyle','--','linewidth',2);

h1=plot(1914:2014,tautau1z,'k','linewidth',2);
h3=plot(1914:2014,xx,'color',red1,'linewidth',3);

hold off;
% grid
grid off;
box off
xlim([1914 2014]);
set(gca,'xtick',1920:10:2020);
ylim([-0.1 0.14]);
set(gca,'ytick',-0.1:0.02:0.14);
xlabel('Year');
ylabel('Reallocation rate (year^{-1})');

hhh1=legend([h1 h3],'$\tau_{1\%} \left(t\right)$','$\widetilde{\tau}_{1\%} \left(t\right)$');
set(hhh1,'interpreter','latex')
legend boxoff

subplot(2,1,2)
plot(1913:2014,zucmanUS(:,2),'color',blue1,'linewidth',3);
hold on;
plot(1913:2014,zucmanUS(:,2),'k--','linewidth',3);
plot(1913:2014,top_1_reprod_smooth,'color',red1,'linewidth',3);
grid off;
box off

% grid
xlim([1913 2014]);
set(gca,'xtick',1920:10:2020);
ylim([20 48]);
xlabel('Year');
ylabel('S_{1%}(t) (%)');
set(gca,'ytick',20:4:48);
hhh4=legend('$S^{\textrm{data}}_{1\%} \left(t\right)$','$S^{\textrm{model}}_{1\%} \left(t,\tau_{1\%} \left(t\right)\right)$','$S^{\textrm{model}}_{1\%} \left(t,\widetilde{\tau}_{1\%} \left(t\right)\right)$');
set(hhh4,'interpreter','latex')
legend boxoff

set(gcf,'color','w');
set(gcf, 'Position', [100 100 710 690])
toc;