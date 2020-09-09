close all;
clear;
load('convergence.mat');
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

%subplot(2,1,1);
positionVector1 = [0.1, 0.45, 0.85, 0.5];
subplot('Position',positionVector1)

h1=plot(t,reshape(shs1(:,1,1),length(t),1),'color',black,'linewidth',3);
hold on;
h2=plot(t,reshape(shs1(:,1,6),length(t),1),'--','color',black,'linewidth',3);
h3=plot(t,reshape(shs1(:,1,11),length(t),1),':','color',black,'linewidth',3);
h4=plot(t,reshape(shs1(:,2,1),length(t),1),'color',grey3,'linewidth',3);
h5=plot(t,reshape(shs1(:,2,6),length(t),1),'--','color',grey3,'linewidth',3);
h6=plot(t,reshape(shs1(:,2,11),length(t),1),':','color',grey3,'linewidth',3);
h7=plot(t,reshape(shs1(:,3,1),length(t),1),'color',black,'linewidth',1);
h8=plot(t,reshape(shs1(:,3,6),length(t),1),'--','color',black,'linewidth',1);
h9=plot(t,reshape(shs1(:,3,11),length(t),1),':','color',black,'linewidth',1);

grid
grid off;
box off
%xlim([0 0.03]);
%set(gca,'xtick',0:0.005:0.03);
%ylim([-0.03 0.05]);
%set(gca,'ytick',-0.03:0.01:0.05);
%title('Top 1%')
xlabel('Time (year)');
ylabel('Wealth share (%)');
ll2=legend([h1 h2 h3 h4 h5 h6 h7 h8 h9],'$S_{10\%} \left(t\right)$, $\tau=3\%$ year$^{-1}$','$S_{10\%} \left(t\right)$, $\tau=2.5\%$ year$^{-1}$','$S_{10\%} \left(t\right)$, $\tau=2\%$ year$^{-1}$',...
    '$S_{1\%} \left(t\right)$, $\tau=3\%$ year$^{-1}$','$S_{1\%} \left(t\right)$, $\tau=2.5\%$ year$^{-1}$','$S_{1\%} \left(t\right)$, $\tau=2\%$ year$^{-1}$',...
    '$S_{0.1\%} \left(t\right)$, $\tau=3\%$ year$^{-1}$','$S_{0.1\%} \left(t\right)$, $\tau=2.5\%$ year$^{-1}$','$S_{0.1\%} \left(t\right)$, $\tau=2\%$ year$^{-1}$','location','east');
set(ll2,'interpreter','latex');

%subplot(2,1,2);
positionVector2 = [0.1, 0.1, 0.85, 0.25];
subplot('Position',positionVector2)

h1=plot(taus,TT(:,1),'color',black,'linewidth',3);
hold on;
h2=plot(taus,TT(:,2),'--','color',grey3,'linewidth',3);
h3=plot(taus,TT(:,3),':','color',black,'linewidth',1);

grid
grid off;
box off
xlim([0 0.03]);
set(gca,'xtick',0:0.005:0.03);
%ylim([-0.03 0.05]);
%set(gca,'ytick',-0.03:0.01:0.05);
%title('Top 1%')
ylabel('Convergence time (years)');
xlabel('Reallocation rate (year^{-1})');
ll2=legend([h1 h2 h3],'$q=10\%$','$q=1\%$','$q=0.1\%$');
set(ll2,'interpreter','latex');

set(gcf, 'Position', [100 100 710 690])

set(gcf,'color','w');