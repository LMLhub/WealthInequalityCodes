clear
tic
load('tau_eqm_top1.mat')
load('convergence.mat');

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

close all;
[xx err]=moving_average(tautau1z,LOWE);
xxx1=1914:2014;
yyy1=(xx-err')';
yyy2=(xx+err')';
%hh0=fill([xxx1 fliplr(xxx1)],[yyy1 fliplr(yyy2)],red1);
%set(hh0,'facealpha',.25)
%hold on;
%plot([0 1e5],[0 0],'color',grey3,'linestyle','--','linewidth',2);
%h1=plot(1914:2014,tautau1z,'k','linewidth',2);
conv_time=interp1(taus,TT(:,2),xx,'pchip','extrap');
indinf1=find(xx<=0);
indinf2=find(xx>0);
years=1914:2014;
conv_time(indinf1)=Inf;
%h3=plot(1914:2014,conv_time,'color',red1,'linewidth',3);

h1=plot(years,conv_time,'color','k','linewidth',3);
hold on
conv_time(indinf1)=500;
ind1=intersect(indinf1,find(years<1960));
ind1=[ind1(1)-1; ind1; ind1(end)+1];
ind2=intersect(indinf1,find(years>1960));
ind2=[ind2(1)-1; ind2];
%hh0=fill([(years(ind1))' fliplr((years(ind1))')],[zeros(size((years(ind1))')) 300*ones(size((years(ind1))'))],red1);
hh0=rectangle('Position',[years(ind1(1)) 0 years(ind1(end))-years(ind1(1)) 500],'LineStyle','none','FaceColor', [0.5 0.5 0.5 0.5]);
hh1=rectangle('Position',[years(ind2(1)) 0 years(ind2(end))-years(ind2(1)) 500],'LineStyle','none','FaceColor', [0.5 0.5 0.5 0.5]);
%set(hh0,'facealpha',.25)

ha=annotation('arrow',[0.1845 0.1845],[0.35 (0.9235+0.35)/2],'LineStyle','--','LineWidth',2);
ha=annotation('line',[0.1845 0.1845],[(0.9235+0.35)/2 0.9235],'LineStyle','--','LineWidth',2);
ha=annotation('arrow',[0.277 0.277],[0.9235 (0.9235+0.18)/2],'LineStyle','--','LineWidth',2);
ha=annotation('line',[0.277 0.277],[(0.9235+0.225)/2  0.225],'LineStyle','--','LineWidth',2);
ha=annotation('arrow',[0.6495 0.6495],[0.345 (0.9235+0.345)/2],'LineStyle','--','LineWidth',2);
ha=annotation('line',[0.6495 0.6495],[(0.9235+0.345)/2 0.9235],'LineStyle','--','LineWidth',2);

box off
xlim([1914 2014]);
set(gca,'xtick',1920:10:2020);
ylim([0 500]);
set(gca,'Ytick',[0:50:200 500])
yticklabels(gca, {'0','50','100','150','200','\infty'})
%set(gca,'ytick',-0.1:0.02:0.14);
xlabel('Year');
ylabel('Convergence time (years)');

%plot(1900:2100,ones(size(1900:2100))*5,':','LineWidth',2);
%plot(1900:2100,ones(size(1900:2100))*40,':','LineWidth',2);
%plot(1900:2100,ones(size(1900:2100))*80,':','LineWidth',2);


set(gcf, 'Position', [100 100 710 690/2])
set(gcf,'color','w')

break_axis('position',350)
ylim([0 500]);
set(gca,'Ytick',[0:50:200 500])
yticklabels(gca, {'0','50','100','150','200','\infty'})

toc

function break_axis(varargin)
ax = gca;
extent = 0.6;
width = get(ax, 'ticklength');
width = width(1)*2;
bottom_reset = '';
xy = 'y';
position = cell2mat(varargin(2));

f = get(ax, 'parent');
n = length(get(ax, strcat(xy, 'ticklabel'))) - 1;
pos = get(ax, 'position');
spacing = pos(4)/n;
cent = pos(2) + 0.5*spacing;
if position < Inf
    lims = get(gca, 'ylim');
    cent = pos(2) + pos(4) * (position - lims(1))/(diff(lims));
end
X1 = [pos(1) - 0.005;
    pos(1) + 0.005];
X2 = [pos(1) - width/2;
    pos(1) + width/2];
Y = [cent - extent*spacing/2;
    cent + extent*spacing/2];

h1 = annotation(f, 'rectangle', [X1(1), Y(1), diff(X1), diff(Y)]);
annotation(f, 'line', [X2(1) X2(2)], [Y(1) Y(1)]);
annotation(f, 'line', [X2(1) X2(2)], [Y(2) Y(2)]);

h1.FaceColor = 'w';
h1.Color = 'w';

if strcmp(bottom_reset, '')
    list = get(ax, [xy 'ticklabel']);
    list(1) = {bottom_reset};
    set(gca, [xy 'ticklabel'], list);
end

end