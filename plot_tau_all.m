clear;
tic;
close all;
load('tau_all.mat')

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

cc2=blue4;
cc3=black;

[xx err]=moving_average(tautau1z,LOWE);
xxx1=1914:2014;
yyy1=(xx-err')';
yyy2=(xx+err')';
hh0=fill([xxx1 fliplr(xxx1)],[yyy1 fliplr(yyy2)],red1);
set(hh0,'facealpha',.25)
hold on;
plot([0 1e5],[0 0],'color',grey3,'linestyle','--','linewidth',2);

h31=plot(1914:2014,xx,'color',red1,'linewidth',3);

[xx err]=moving_average(prctile(tautau_all',50)',LOWE);
xxx1=1918:2012;
yyy1=(xx-err')';
yyy2=(xx+err')';
hh0=fill([xxx1 fliplr(xxx1)],[yyy1 fliplr(yyy2)],'m');
set(hh0,'facealpha',.25)
set(hh0,'facecolor',cc2)
h32=plot(1918:2012,xx,'color',cc2,'linewidth',3);

[xx err]=moving_average(median(tautau_sigma')',LOWE);
xxx1=1918:2012;
yyy1=(xx-err')';
yyy2=(xx+err')';
hh0=fill([xxx1 fliplr(xxx1)],[yyy1 fliplr(yyy2)],'b');
set(hh0,'facealpha',.25)
set(hh0,'facecolor',cc3)
h33=plot(1918:2012,xx,'color',cc3,'linewidth',3);
hhh1=legend([h31,h32,h33],'$\widetilde{\tau}_{1\%} \left(t\right)$','$\widetilde{\tau}_{all\%} \left(t\right)$','$\widetilde{\tau}_{all\%+\sigma} \left(t\right)$','location','northeast');
set(hhh1,'interpreter','latex')
xlim([1914 2013]);
set(gca,'xtick',1920:10:2020);
ylim([-0.06 0.06]);
set(gca,'ytick',-0.06:0.02:0.06);
xlabel('Year');
ylabel('Reallocation rate (year^{-1})');
grid
box off
legend boxoff

%set(gcf, 'Position',[50 50 500 400]);
set(gcf, 'Position', [100 100 710 690/2])
set(gcf,'color','w');
toc;