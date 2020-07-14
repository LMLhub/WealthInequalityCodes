clear;
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

sigmas=[0.1 0.16 0.2];
n=length(sigmas);
K=1000;
h=zeros(n,1);

for i=1:n
    sigma=sigmas(i);
    taus2=linspace(sigma^2/2,10*sigma^2,K);
    h(i)=plot(taus2,1./(2*taus2-sigma^2),'linewidth',3);
    hold on;
end
ylim([0 400]);
set(gca,'ytick',0:50:400)
xlim([0 0.04]);
ylabel('Convergence time (years)');
xlabel('Reallocation rate (year^{-1})');
legend('\sigma=0.1 year^{-1/2}','\sigma=0.16 year^{-1/2}','\sigma=0.2 year^{-1/2}');
box off
set(h(1),'Color',blue3,'linestyle','-');
set(h(2),'Color',blue3,'linestyle','--');
set(h(3),'Color',blue3,'linestyle',':');

set(gcf, 'Position', [100 100 710 690/2])

set(gcf,'color','w');