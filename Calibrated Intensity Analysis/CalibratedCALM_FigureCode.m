figure
hist(MMI_CALM,0:5:200)
hold on
xlim([0 200])
YL=ylim;
%line([60 60],YL,'Color','g','LineStyle','--')
ylabel('Events')
xlabel('Max # CALM')

%%
figure
hist(MMI_AP2,0:5:200)
hold on
xlim([0 200])
YL=ylim;
%line([60 60],YL,'Color','g','LineStyle','--')
ylabel('Events')
xlabel('Max # AP2')

%%
figure
HD=hist(MMI_DNM_pool,0:5:130);
plot(0:5:130,HD/sum(HD),'LineWidth',3)
hold on
xlim([0 130])
YL=ylim;
line([26 26],YL,'Color','g','LineStyle','--','LineWidth',3)
ylabel('Frequency','FontSize',18)
xlabel('Max # Dynamin','FontSize',18)
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',14)
ylim(YL)

%%
V=0:15:150;
CMMI_AP2_V=CohortMaxIntensities(MMI_AP2,LT_AP2,V);
CMMI_CALM_V=CohortMaxIntensities(MMI_CALM,LT_CALM,V);
figure
HA=hist(LT_AP2,V);
HC=hist(LT_CALM,V);
plot(V,HA/sum(HA))
hold on
plot(V,HC/sum(HC),'g')
xlabel('Lifetime (s)')
ylabel('Frequency')
legend({strcat('AP2, N=',num2str(sum(HA))),strcat('AP2, N=',num2str(sum(HC)))})

%%
LW=3;
figure
subst=3;
Med_AP2=StatCell_Fancy(CMMI_AP2_V,@median);
Med_CALM=StatCell_Fancy(CMMI_CALM_V,@median);
Med_CALM=Med_CALM*subst;
subplot(1,2,1)
plot(V(1:end-1),Med_AP2/Med_AP2(3),'LineWidth',LW)
hold on
plot(V(1:end-1),Med_CALM/Med_CALM(3),'c','LineWidth',LW)
xlim([30 135])
xticks([30 60 90 120 150])
xlabel('Lifetime (s)')
ylabel('         Median Peak Protein Count \newline (Normalized to Median of 30s Cohort)')
legend({'AP2','CALM'})
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',14)
subplot(1,2,2)
plot(V(1:end-1),Med_AP2./Med_CALM,'LineWidth',LW)
xlim([30 135])
xticks([30 60 90 120 150])
YL=ylim;
xlabel('Lifetime (s)')
ylabel('AP2:CALM Ratio')
a = get(gca,'XTickLabel');
ylim(YL)
set(gca,'XTickLabel',a,'fontsize',14)

%%
figure
scatter(Med_AP2,Med_CALM)
hold on
useda=find(~isnan(Med_AP2));
AddLinearRegLine_Color_0Intercept(Med_AP2(useda),Med_CALM(useda),[1 0 0])
xlabel('AP2 Number')
ylabel('CALM Number')

%%
figure
substit=1;
Range=0:5:350;
HC=hist(MMI_CALM*substit,Range);
median(MMI_CALM*substit)

%line([60 60],YL,'Color','g','LineStyle','--')


HA=hist(MMI_AP2,Range);
plot(Range,HA/sum(HA),'b','LineWidth',3)
hold on
plot(Range,HC/sum(HC),'c','LineWidth',3)
xlim([0 340])
xticks([0 40 80 120 160 200 240 280 320 360])
YL=ylim;
%line([60 60],YL,'Color','g','LineStyle','--')
ylabel('Frequency','FontSize',18)
xlabel('Peak Number Present','FontSize',18)
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',14)
legend({strcat('AP2, N=',num2str(sum(HA))),strcat('CALM, N=',num2str(sum(HC)))})
%%
figure
HC=hist(MMI_CALM,0:5:200);


%line([60 60],YL,'Color','g','LineStyle','--')


HA=hist(MMI_WT{2},0:5:200);
HA2=hist(MMI_SI{2},0:5:200);
HA3=hist(MMI_DSI{3},0:5:200);
plot(0:5:200,HA/sum(HA),'b')
hold on
plot(0:5:200,HC/sum(HC),'r')
plot(0:5:200,HA2/sum(HA2),'c')
plot(0:5:200,HA3/sum(HA3),'k')
xlim([0 200])
YL=ylim;
%line([60 60],YL,'Color','g','LineStyle','--')
ylabel('Frequency')
xlabel('Max Number Present')
legend({'SI Control','CALM','SI CALM','Super SI CALM'})

%%

figure
C={MMI_CALM,MMI_WT{2},MMI_SI{2},MMI_DSI{3}};
BoxPlotCell(C)

%%
clear all
[MMI_AP2,LT_AP2,A_AP2]=CalibratedIntensityAnalysis_F('AP2',3);
[MMI_CALM,LT_CALM,A_CALM]=CalibratedIntensityAnalysis_F('CALM',3);
[MMI_DNM,LT_DNM,A_DNM]=CalibratedIntensityAnalysis_F('Dynamin',3);
close all

%%
% used=find(LT_AP2>=40 & LT_AP2<90);
% MMI_AP2=MMI_AP2(used);
% used=find(LT_CALM>=40 & LT_CALM<90);
% MMI_CALM=MMI_CALM(used);

%%
figure
BoxPlotCell({MMI_AP2,MMI_CALM},@boxplot,'Symbol','','Widths',.9)
xticklabels({'AP2','CALM'})
ylabel('Max # per trace')

%%

median(MMI_DNM)
sqrt(var(MMI_DNM))

%%
for i=1:4
    [MMI_DNMc{i},LT_DNMc{i},A_DNMc{i}]=CalibratedIntensityAnalysis_F('Dynamin',i);
end
MMI_DNM_pool=[];
A_DNM={};
for i=1:4
MMI_DNM_pool=[MMI_DNM_pool MMI_DNMc{i}];
A_DNM=CombineCells(A_DNM,A_DNMc{i});
end

%%

median(MMI_DNM_pool)
prctile(MMI_DNM_pool,25)
prctile(MMI_DNM_pool,75)

%%

median(MMI_CALM)
prctile(MMI_CALM,25)
prctile(MMI_CALM,75)

%%

median(MMI_AP2)
prctile(MMI_AP2,25)
prctile(MMI_AP2,75)

%%

sqrt(var(MMI_DNM_pool))/median(MMI_DNM_pool)
sqrt(var(MMI_AP2))/median(MMI_AP2)
sqrt(var(MMI_CALM))/median(MMI_CALM)

%%

(prctile(MMI_DNM_pool,75)-prctile(MMI_DNM_pool,25))/median(MMI_DNM_pool)
(prctile(MMI_AP2,75)-prctile(MMI_AP2,25))/median(MMI_AP2)
(prctile(MMI_CALM,75)-prctile(MMI_CALM,25))/median(MMI_CALM)

%%

Trace_AP2=AverageTraceEndAligned(A_AP2);
Trace_CALM=AverageTraceEndAligned(A_CALM);
Trace_DNM=AverageTraceEndAligned(A_DNM);
MGFPINT=18400/80;
Trace_AP2=Trace_AP2/MGFPINT;
Trace_CALM=Trace_CALM/MGFPINT;
Trace_DNM=Trace_DNM/MGFPINT;
t=(1:100)*3;
figure
plot(t,Trace_AP2,'b')
hold on
plot(t,Trace_CALM,'r')
plot(t,Trace_DNM,'k')
legend({'AP2','CALM','Dynamin'})
ylabel('Number Present')
xlabel('Time (s)')

%%

CohortEdges=0:30:150;
for i=1:length(CohortEdges)-1
    L{i}=strcat(num2str(CohortEdges(i)),'-',num2str(CohortEdges(i+1)),'s Cohort');
end
L{i+1}='All Data';
CMMI_AP2=CohortMaxIntensities(nmMMI_AP2,nmLT_AP2,CohortEdges);
CMMI_CALM=CohortMaxIntensities(nmMMI_CALM,nmLT_CALM,CohortEdges);
%CMMI=CombineCells(CMMI_AP2,CMMI_CALM);
CMMI_AP2{length(CMMI_AP2)+1}=nmMMI_AP2;
CMMI_CALM{length(CMMI_CALM)+1}=nmMMI_CALM;

figure
subplot(1,2,1)
BoxPlotCell(CMMI_CALM,@boxplot);
hold on
xticklabels(L)
ylabel('Max # CALM')
subplot(1,2,2)
BoxPlotCell(CMMI_AP2,@boxplot);
hold on
xticklabels(L)
ylabel('Max # AP2')


%%

[nmMMI_AP2,nmLT_AP2,nmA_AP2]=CalibratedIntensityAnalysis_NoMin_F('AP2',3);
[nmMMI_CALM,nmLT_CALM,nmA_CALM]=CalibratedIntensityAnalysis_NoMin_F('CALM',3);
[nmMMI_DNM,nmLT_DNM,nmA_DNM]=CalibratedIntensityAnalysis_NoMin_F('Dynamin',3);
close all

%%
V=0:15:150;
CMMI_AP2_V=CohortMaxIntensities(nmMMI_AP2,nmLT_AP2,V);
CMMI_CALM_V=CohortMaxIntensities(nmMMI_CALM,nmLT_CALM,V);
figure
HA=hist(nmLT_AP2,V);
HC=hist(nmLT_CALM,V);
plot(V,HA/sum(HA))
hold on
plot(V,HC/sum(HC),'g')
xlabel('Lifetime (s)')
ylabel('Frequency')
legend({'AP2','CALM'})

%%

figure
Med_AP2=StatCell_Fancy(CMMI_AP2_V,@median);
Med_CALM=StatCell_Fancy(CMMI_CALM_V,@median);
subplot(1,2,1)
plot(V(2:end),Med_AP2)
hold on
plot(V(2:end),Med_CALM,'g')
xlabel('Lifetime (s)')
ylabel('Median Max Protein Count')
legend({'AP2','CALM'})
subplot(1,2,2)
plot(V(2:end),Med_AP2./Med_CALM)
xlabel('Lifetime (s)')
ylabel('AP2:CALM Ratio at Internalization')

%%

SD_AP2=StatCell_Fancy(CMMI_AP2_V,@StandardDeviation);
SD_CALM=StatCell_Fancy(CMMI_CALM_V,@StandardDeviation);
figure
plot(V(2:end),SD_AP2./Med_AP2)
hold on
plot(V(2:end),SD_CALM./Med_CALM,'g')
xlabel('Lifetime (s)')
ylabel('St. Dev / Median')
legend({'AP2','CALM'})

%%

figure
hist(nmMMI_CALM,0:5:200)
hold on
xlim([0 200])
YL=ylim;
%line([60 60],YL,'Color','g','LineStyle','--')
ylabel('Events')
xlabel('Max # CALM')

%%

figure
hist(nmMMI_CALM,0:5:200)
hold on
xlim([0 200])
YL=ylim;
%line([60 60],YL,'Color','g','LineStyle','--')
ylabel('Events')
xlabel('Max # CALM')
%%
figure
hist(nmMMI_DNM,0:5:120)
hold on
xlim([0 120])
YL=ylim;
%line([60 60],YL,'Color','g','LineStyle','--')
ylabel('Events')
xlabel('Max # AP2')