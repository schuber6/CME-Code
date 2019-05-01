% clear all
% [MMI_AP2,LT_AP2,A_AP2]=CalibratedIntensityAnalysis_F('AP2',3,7);
% [MMI_CALM,LT_CALM,A_CALM]=CalibratedIntensityAnalysis_F('CALM',3,7);
% [MMI_DNM,LT_DNM,A_DNM]=CalibratedIntensityAnalysis_F('Dynamin',3,7);
% close all
% save CalibratedIntensityData.mat
%%
clear all
load('CalibratedIntensityData.mat')
MGFPINT=18400/80;
framegap=3;
YL=[0 180];
XL=[0 126];
YL2=[0 250];
figure(1)

Ls=(20:20:120)/3;
%Temp_PlotSingleCohortAverageTraces(A_AP2,MGFPINT,Ls);
[Cs,SDs,NumAP2,SEs,MCs,MSDs,MSEs]=CohortAverageTraces(A_AP2,MGFPINT,Ls);
%PlotCohortTraces(Cs,Ls);
figure(2)
subplot(1,2,1)
PlotCohortBars_Errors(MCs,MSEs)
title('AP2','FontSize',18)
ylim(YL2)
yticks(0:30:240)
figure(1)
subplot(1,2,1)
PlotCohortTraces_Errors(Cs,SEs,Ls);
ylim(YL)
xlim(XL)
xticks(Ls*framegap)
yticks(30:30:180)
ylabel('# Proteins','FontSize',18)
xlabel('Time (s)','FontSize',18)
title('AP2','FontSize',18)
[Cs,SDs,NumAP2,SEs,MCs,MSDs,MSEs]=CohortAverageTraces(A_CALM,MGFPINT/3,Ls);
set(gca,'linewidth',1)
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',14)
figure(2)
subplot(1,2,2)
PlotCohortBars_Errors(MCs,MSEs)
title('CALM','FontSize',18)
ylim(YL2)
yticks(0:30:240)
figure(1)
subplot(1,2,2)
%PlotCohortTraces(Cs,Ls);
PlotCohortTraces_Errors(Cs,SEs,Ls);
ylim(YL)
xlim(XL)
xticks(Ls*framegap)
yticks(30:30:180)
ylabel('# Proteins','FontSize',18)
xlabel('Time (s)','FontSize',18)
title('CALM','FontSize',18)
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',14)
set(gca,'linewidth',1)

figure
substit=1;
Range=0:5:205;
HC=hist(MMI_CALM*substit,Range);
median(MMI_CALM*substit)
HA=hist(MMI_AP2,Range);
plot(Range,HA/sum(HA),'b','LineWidth',1)
hold on
plot(Range,HC/sum(HC),'c','LineWidth',1)
xlim([0 200])
xticks([0 40 80 120 160 200 240 280 320 360])
YL=ylim;
%line([60 60],YL,'Color','g','LineStyle','--')
ylabel('Frequency','FontSize',18)
xlabel('Peak Number Present','FontSize',18)
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',14)
legend({strcat('AP2, N=',num2str(sum(HA))),strcat('CALM, N=',num2str(sum(HC)))})
set(gca,'linewidth',1)

figure
substit=3;
Range=0:5:350;
HC=hist(MMI_CALM*substit,Range);
median(MMI_CALM*substit)
HA=hist(MMI_AP2,Range);
plot(Range,HA/sum(HA),'b','LineWidth',1)
hold on
plot(Range,HC/sum(HC),'c','LineWidth',1)
xlim([0 320])
xticks([0 40 80 120 160 200 240 280 320 360])
YL=ylim;
%line([60 60],YL,'Color','g','LineStyle','--')
ylabel('Frequency','FontSize',18)
xlabel('Peak Number Present','FontSize',18)
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',14)
legend({strcat('AP2, N=',num2str(sum(HA))),strcat('CALM, N=',num2str(sum(HC)))})
set(gca,'linewidth',1)
