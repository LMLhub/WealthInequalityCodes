mu=0.0;
sigma=0.14;
dt=0.1;
sdt=sqrt(.1);
N=1000;
T=10/dt;
tauc=sigma^2/(2*log(N));
tau=0.15;
%generate N GBM trajectories, length T
x=ones(T,N);
noise=sigma*sdt*randn(T,N);
w1=zeros(T,1);
%w1(1)=middle_class(x(1,:),0);
for i=2:T
    x(i,:)=x(i-1,:)+x(i-1,:).*(mu*dt-tau*dt+noise(i,:))+tau*mean(x(i-1,:))*dt;
    %w1(i)=middle_class(x(i,:),0);
end
y=mean(x,2);
rich=max(x,[],2);
poor=min(x,[],2);
t=dt*ones(T,1);
t=cumsum(t)-dt;
close all;

subplot(2,2,1);
plot(t,y,'k','linewidth',3);
hold on;
plot(t,x(:,1),'b');
plot(t,x(:,2),'b');
plot(t,x(:,3),'b');
plot(t,x(:,4),'b');
plot(t,x(:,5),'b');
plot(t,rich,'m','linewidth',2);
plot(t,poor,'m','linewidth',2);
xlabel('Time (year)');
ylabel('Wealth');
xlim([0 10]);
ylim([-2 8]);
set(gca,'xtick',0:2:10);
set(gca,'ytick',-2:2:8);
set(gca,'FontSize',12)
set(gcf,'color','w');
box off
mu=0.0;
sigma=0.14;
dt=0.1;
sdt=sqrt(.1);
N=1000;
T=10/dt;
tauc=sigma^2/(2*log(N));
tau=-0.15;
%generate N GBM trajectories, length T
x=ones(T,N);
noise=sigma*sdt*randn(T,N);
w1=zeros(T,1);
for i=2:T
    x(i,:)=x(i-1,:)+x(i-1,:).*(mu*dt-tau*dt+noise(i,:))+tau*mean(x(i-1,:))*dt;
end
y=mean(x,2);
rich=max(x,[],2);
poor=min(x,[],2);
t=dt*ones(T,1);
t=cumsum(t)-dt;
set(gca, 'Position', [0.1, 0.6, 0.3, 0.3]);

subplot(2,2,3);
plot(t,y,'k','linewidth',3);
hold on;
plot(t,x(:,1),'b');
plot(t,x(:,2),'b');
plot(t,x(:,3),'b');
plot(t,x(:,4),'b');
plot(t,x(:,5),'b');
plot(t,rich,'m','linewidth',2);
plot(t,poor,'m','linewidth',2);
xlabel('Time (year)');
ylabel('Wealth');
xlim([0 10]);
ylim([-2 8]);
set(gca,'xtick',0:2:10);
set(gca,'ytick',-2:2:8);
set(gca,'FontSize',12)
set(gcf,'color','w');
box off
set(gca, 'Position', [0.1, 0.1, 0.3, 0.3]);

subplot(2,2,2);
mu=0.02;
sigma=0.14;
tau=0.15;
y=10.^(-2:0.02:10);
zeta=1+2*tau/sigma^2;
p=exp(-(zeta-1)./y).*(y.^(-(1+zeta)));
loglog(y,p/trapz(y,p),'b','linewidth',3)
xlabel('y');
ylabel('p(y)');
xlim([1e-2 1e7]);
ylim([1e-100 1e100]);
set(gca,'xtick',[1e-2 1e1 1e4 1e7]);
set(gca,'ytick',[1e-100 1e0 1e100]);
set(gca,'FontSize',12)
set(gcf,'color','w');
box off
set(gca, 'Position', [0.6, 0.6, 0.3, 0.3]);

% create smaller axes in top right, and plot on it
axes('Position',[0.75 .75 0.15 0.15])
box on
plot(y,p/trapz(y,p),'b','linewidth',3)
box off
xlabel('y');
ylabel('p(y)');
xlim([0 5]);
set(gca,'xtick',[0 2.5 5]);
set(gca,'FontSize',10)

subplot(2,2,4);
mu=0.02;
sigma=0.14;
tau=0.15;
y=10.^(-2:0.02:10);
zeta=1+2*tau/sigma^2;
p=exp(-(zeta-1)./y).*(y.^(-(1+zeta)));
loglog(y,p/trapz(y,p),'w','linewidth',3,'linestyle','none')
hold on;
plot(10^2.5,1,'rx','MarkerSize',120,'linewidth',6)
xlabel('y');
ylabel('p(y)');
xlim([1e-2 1e7]);
ylim([1e-100 1e100]);
set(gca,'xtick',[1e-2 1e1 1e4 1e7]);
set(gca,'ytick',[1e-100 1e0 1e100]);
set(gca,'FontSize',12)
set(gcf,'color','w');
box off
set(gca, 'Position', [0.6, 0.1, 0.3, 0.3]);


set(gcf, 'Position', [100 100 700 600])
%set(gcf, 'Position', [100 100 750 650])