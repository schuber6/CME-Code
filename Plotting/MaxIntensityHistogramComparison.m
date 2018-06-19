clear all
load('DataWT_SI.mat')

file=DataWT(2).file;
load(file)
MinLT=10;
Range=1:100;
[FXYCMS_Sel,~,MMs,MSs]=SelectFullOnes(FXYCMS,MinLT,Range);
[HwtM,xbinsM]=hist(MMs,20);
[HwtS,xbinsS]=hist(MSs,20);
mean(MMs)
sqrt(var(MMs))

file=DataSI(3).file;
load(file)
MinLT=10;
Range=1:100;
[FXYCMS_Sel,~,MMs,MSs]=SelectFullOnes(FXYCMS,MinLT,Range);
[HsiM,~]=hist(MMs,xbinsM);
[HsiS,~]=hist(MSs,xbinsS);
mean(MMs)
sqrt(var(MMs))

figure
subplot(1,2,1)
plot(xbinsM,HwtM/sum(HwtM),'g')
hold on
plot(xbinsM,HsiM/sum(HsiM),'r')
subplot(1,2,2)
plot(xbinsS,HwtS/sum(HwtS),'g')
hold on
plot(xbinsS,HsiS/sum(HsiS),'r')
