clear all
load('BothDSIO_Struct_180920_EndoFilter_30s.mat')
YL=[0 10*10^4];
ClathMin=.5*10^4;
ylab='CALM Intensity at Internalization';
L={'Control','CALM siRNA'};

SIpre=find([DSIOfiles.TimeGroup]==0 & [DSIOfiles.siRNA]==1 & [DSIOfiles.MedianClath]>=ClathMin);   %Index preosmo files
WTpre=find([DSIOfiles.TimeGroup]==0 & [DSIOfiles.siRNA]==0 & [DSIOfiles.MedianClath]>=ClathMin);

SI3m66=find([DSIOfiles.TimeGroup]==1 & [DSIOfiles.siRNA]==1 & [DSIOfiles.pWater]==66 & [DSIOfiles.MedianClath]>=ClathMin);  %Index 3 min post osmo files
WT3m66=find([DSIOfiles.TimeGroup]==1 & [DSIOfiles.siRNA]==0 & [DSIOfiles.pWater]==66 & [DSIOfiles.MedianClath]>=ClathMin);
SI3m80=find([DSIOfiles.TimeGroup]==1 & [DSIOfiles.siRNA]==1 & [DSIOfiles.pWater]==80 & [DSIOfiles.MedianClath]>=ClathMin);
WT3m80=find([DSIOfiles.TimeGroup]==1 & [DSIOfiles.siRNA]==0 & [DSIOfiles.pWater]==80 & [DSIOfiles.MedianClath]>=ClathMin);

SI10m66=find([DSIOfiles.TimeGroup]==2 & [DSIOfiles.siRNA]==1 & [DSIOfiles.pWater]==66 & [DSIOfiles.MedianClath]>=ClathMin);  %Index 10 min post osmo files
WT10m66=find([DSIOfiles.TimeGroup]==2 & [DSIOfiles.siRNA]==0 & [DSIOfiles.pWater]==66 & [DSIOfiles.MedianClath]>=ClathMin);
SI10m80=find([DSIOfiles.TimeGroup]==2 & [DSIOfiles.siRNA]==1 & [DSIOfiles.pWater]==80 & [DSIOfiles.MedianClath]>=ClathMin);
WT10m80=find([DSIOfiles.TimeGroup]==2 & [DSIOfiles.siRNA]==0 & [DSIOfiles.pWater]==80 & [DSIOfiles.MedianClath]>=ClathMin);

SIpreMS=[];
for i=1:length(SIpre)
    SIpreMS=[SIpreMS MS_EF{SIpre(i)}];
end
WTpreMS=[];
for i=1:length(WTpre)
    WTpreMS=[WTpreMS MS_EF{WTpre(i)}];
end

SI3m66MS=[];
for i=1:length(SI3m66)
    SI3m66MS=[SI3m66MS MS_EF{SI3m66(i)}];
end
WT3m66MS=[];
for i=1:length(WT3m66)
    WT3m66MS=[WT3m66MS MS_EF{WT3m66(i)}];
end

SI10m66MS=[];
for i=1:length(SI10m66)
    SI10m66MS=[SI10m66MS MS_EF{SI10m66(i)}];
end
WT10m66MS=[];
for i=1:length(WT10m66)
    WT10m66MS=[WT10m66MS MS_EF{WT10m66(i)}];
end

SI3m80MS=[];
for i=1:length(SI3m80)
    SI3m80MS=[SI3m80MS MS_EF{SI3m80(i)}];
end
WT3m80MS=[];
for i=1:length(WT3m80)
    WT3m80MS=[WT3m80MS MS_EF{WT3m80(i)}];
end

SI10m80MS=[];
for i=1:length(SI10m80)
    SI10m80MS=[SI10m80MS MS_EF{SI10m80(i)}];
end
WT10m80MS=[];
for i=1:length(WT10m80)
    WT10m80MS=[WT10m80MS MS_EF{WT10m80(i)}];
end

PreC={WTpreMS,SIpreMS};
P3m66C={WT3m66MS,SI3m66MS};
P10m66C={WT10m66MS,SI10m66MS};
P3m80C={WT3m80MS,SI3m80MS};
P10m80C={WT10m80MS,SI10m80MS};



%%  66+80% combined figure in the style of Ema's dynamin one
bins=40;
FS=12;
YL=[0 25];
YT=[0 5 10 15 20];
XT=0:5;
XL=[0 5];
PRCs=[.25 .50 .75];
figure


clear h
Mc=median(PreC{1}/10^4);
[H,CBins]=hist(PreC{1}/10^4,bins);
subplot(2,3,4)
clear CDF
for i2=1:length(H)
    CDF(i2)=sum(H(1:i2))/sum(H);
end
plot(CBins,CDF)
hold on
Xs=CDF_PrctileLines(CBins,CDF,PRCs);
xlim([0 max(CBins)])
xlabel('Peak CALM Intensity (AU)')
ylabel('         Coated Pits \newline Cumulative Frequency')
xticks(XT)
xlim(XL)
line([Xs(2) Xs(2)],[0 .5],'Color','r','LineStyle','--')
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',FS)
subplot(2,3,1)
bar(CBins,H/sum(H)*100,1)

title('      Control Cells \newline Before Osmoshock')
xlim([0 max(CBins)])
ylim(YL)
ylabel('Coated Pits \newline % Events')
xlabel('Peak CALM Intensity (AU)')
xticks(XT)
xlim(XL)
yticks(YT)
line([Xs(2) Xs(2)],YL,'Color','r','LineStyle','--')
legend(strcat('N=',num2str(sum(H))))
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',FS)


subplot(2,3,2)

[H,CBins]=hist(P3m66C{1}/10^4,CBins);
bar(CBins,H/sum(H)*100,1)
title('                 Control Cells \newline 3 minutes after 66% Osmoshock')
xlim([0 max(CBins)])
ylim(YL)
yticks(YT)
line([Xs(2) Xs(2)],YL,'Color','r','LineStyle','--')
legend(strcat('N=',num2str(sum(H))))
%ylabel('Coated Pits \newline % Events')
xlabel('Peak CALM Intensity (AU)')
xticks(XT)
xlim(XL)
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',FS)
subplot(2,3,5)
clear CDF
for i2=1:length(H)
    CDF(i2)=sum(H(1:i2))/sum(H);
end
plot(CBins,CDF)
hold on
CDF_PrctileLines(CBins,CDF,PRCs);
xlim([0 max(CBins)])
xlabel('Peak CALM Intensity (AU)')
%ylabel('         Coated Pits \newline Cumulative Frequency')
xticks(XT)
xlim(XL)
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',FS)

subplot(2,3,3)

[H,CBins]=hist(P10m66C{1}/10^4,CBins);
bar(CBins,H/sum(H)*100,1)
title('                 Control Cells \newline 10 minutes after 66% Osmoshock')
xlim([0 max(CBins)])
ylim(YL)
yticks(YT)
line([Xs(2) Xs(2)],YL,'Color','r','LineStyle','--')
legend(strcat('N=',num2str(sum(H))))
%ylabel('Coated Pits \newline % Events')
xlabel('Peak CALM Intensity (AU)')
xticks(XT)
xlim(XL)
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',FS)
subplot(2,3,6)
clear CDF
for i2=1:length(H)
    CDF(i2)=sum(H(1:i2))/sum(H);
end
plot(CBins,CDF)
hold on
CDF_PrctileLines(CBins,CDF,PRCs);
xlim([0 max(CBins)])
xlabel('Peak CALM Intensity (AU)')
%ylabel('         Coated Pits \newline Cumulative Frequency')
xticks(XT)
xlim(XL)
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',FS)

% subplot(2,3,4)
% 
% [H,CBins]=hist(P3m80C{1}/10^4,CBins);
% bar(CBins,H/sum(H)*100,1)
% title('                 Control Cells \newline 3 minutes after 80% Osmoshock')
% xlim([0 max(CBins)])
% ylim(YL)
% yticks(YT)
% line([Xs(2) Xs(2)],YL,'Color','r','LineStyle','--')
% %ylabel('Coated Pits \newline % Events')
% xlabel('Peak CALM Intensity (AU)')
% xticks(XT)
% xlim(XL)
% a = get(gca,'XTickLabel');
% set(gca,'XTickLabel',a,'fontsize',FS)
% subplot(2,3,9)
% clear CDF
% for i2=1:length(H)
%     CDF(i2)=sum(H(1:i2))/sum(H);
% end
% plot(CBins,CDF)
% hold on
% CDF_PrctileLines(CBins,CDF,PRCs);
% xlim([0 max(CBins)])
% xlabel('Peak CALM Intensity (AU)')
% %ylabel('         Coated Pits \newline Cumulative Frequency')
% xticks(XT)
% xlim(XL)
% a = get(gca,'XTickLabel');
% set(gca,'XTickLabel',a,'fontsize',FS)
% 
% subplot(2,3,5)
% 
% [H,CBins]=hist(P10m80C{1}/10^4,CBins);
% bar(CBins,H/sum(H)*100,1)
% title('                 Control Cells \newline 10 minutes after 80% Osmoshock')
% xlim([0 max(CBins)])
% ylim(YL)
% yticks(YT)
% line([Xs(2) Xs(2)],YL,'Color','r','LineStyle','--')
% %ylabel('Coated Pits \newline % Events')
% xlabel('Peak CALM Intensity (AU)')
% xticks(XT)
% xlim(XL)
% a = get(gca,'XTickLabel');
% set(gca,'XTickLabel',a,'fontsize',FS)
% subplot(2,3,10)
% clear CDF
% for i2=1:length(H)
%     CDF(i2)=sum(H(1:i2))/sum(H);
% end
% plot(CBins,CDF)
% hold on
% CDF_PrctileLines(CBins,CDF,PRCs);
% xlim([0 max(CBins)])
% xlabel('Peak CALM Intensity (AU)')
% %ylabel('         Coated Pits \newline Cumulative Frequency')
% xticks(XT)
% xlim(XL)
% a = get(gca,'XTickLabel');
% set(gca,'XTickLabel',a,'fontsize',FS)



figure
[H]=hist(PreC{2}/10^4,CBins);
subplot(2,3,4)
clear CDF
for i2=1:length(H)
    CDF(i2)=sum(H(1:i2))/sum(H);
end
plot(CBins,CDF)
hold on
Xs=CDF_PrctileLines(CBins,CDF,PRCs);
xlim([0 max(CBins)])
xlabel('Peak CALM Intensity (AU)')
ylabel('         Coated Pits \newline Cumulative Frequency')
xticks(XT)
xlim(XL)
line([Xs(2) Xs(2)],[0 .5],'Color','r','LineStyle','--')
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',FS)
subplot(2,3,1)
bar(CBins,H/sum(H)*100,1)
title(' CALM siRNA Cells \newline Before Osmoshock')
xlim([0 max(CBins)])
ylim(YL)
yticks(YT)
line([Xs(2) Xs(2)],YL,'Color','r','LineStyle','--')
ylabel('Coated Pits \newline % Events')
xlabel('Peak CALM Intensity (AU)')
legend(strcat('N=',num2str(sum(H))))
xticks(XT)
xlim(XL)
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',FS)


subplot(2,3,2)

[H,CBins]=hist(P3m66C{2}/10^4,CBins);
bar(CBins,H/sum(H)*100,1)
title('             CALM siRNA Cells \newline 3 minutes after 66% Osmoshock')
xlim([0 max(CBins)])
ylim(YL)
yticks(YT)
line([Xs(2) Xs(2)],YL,'Color','r','LineStyle','--')
%ylabel('Coated Pits \newline % Events')
xlabel('Peak CALM Intensity (AU)')
legend(strcat('N=',num2str(sum(H))))
xticks(XT)
xlim(XL)
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',FS)
subplot(2,3,5)
clear CDF
for i2=1:length(H)
    CDF(i2)=sum(H(1:i2))/sum(H);
end
plot(CBins,CDF)
hold on
CDF_PrctileLines(CBins,CDF,PRCs);
xlim([0 max(CBins)])
xlabel('Peak CALM Intensity (AU)')
%ylabel('         Coated Pits \newline Cumulative Frequency')
xticks(XT)
xlim(XL)
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',FS)

subplot(2,3,3)

[H,CBins]=hist(P10m66C{2}/10^4,CBins);
bar(CBins,H/sum(H)*100,1)
title('             CALM siRNA Cells \newline 10 minutes after 66% Osmoshock')
xlim([0 max(CBins)])
ylim(YL)
yticks(YT)
line([Xs(2) Xs(2)],YL,'Color','r','LineStyle','--')
%ylabel('Coated Pits \newline % Events')
xlabel('Peak CALM Intensity (AU)')
legend(strcat('N=',num2str(sum(H))))
xticks(XT)
xlim(XL)
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',FS)
subplot(2,3,6)
clear CDF
for i2=1:length(H)
    CDF(i2)=sum(H(1:i2))/sum(H);
end
plot(CBins,CDF)
hold on
CDF_PrctileLines(CBins,CDF,PRCs);
xlim([0 max(CBins)])
xlabel('Peak CALM Intensity (AU)')
%ylabel('         Coated Pits \newline Cumulative Frequency')
xticks(XT)
xlim(XL)
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',FS)

% subplot(2,3,4)
% 
% [H,CBins]=hist(P3m80C{2}/10^4,CBins);
% bar(CBins,H/sum(H)*100,1)
% title('             CALM siRNA Cells \newline 3 minutes after 80% Osmoshock')
% xlim([0 max(CBins)])
% ylim(YL)
% yticks(YT)
% line([Xs(2) Xs(2)],YL,'Color','r','LineStyle','--')
% %ylabel('Coated Pits \newline % Events')
% xlabel('Peak CALM Intensity (AU)')
% xticks(XT)
% xlim(XL)
% a = get(gca,'XTickLabel');
% set(gca,'XTickLabel',a,'fontsize',FS)
% subplot(2,3,9)
% clear CDF
% for i2=1:length(H)
%     CDF(i2)=sum(H(1:i2))/sum(H);
% end
% plot(CBins,CDF)
% hold on
% CDF_PrctileLines(CBins,CDF,PRCs);
% xlim([0 max(CBins)])
% xlabel('Peak CALM Intensity (AU)')
% %ylabel('         Coated Pits \newline Cumulative Frequency')
% xticks(XT)
% xlim(XL)
% a = get(gca,'XTickLabel');
% set(gca,'XTickLabel',a,'fontsize',FS)
% 
% subplot(2,3,5)
% 
% [H,CBins]=hist(P10m80C{2}/10^4,CBins);
% bar(CBins,H/sum(H)*100,1)
% title('             CALM siRNA Cells \newline 10 minutes after 80% Osmoshock')
% xlim([0 max(CBins)])
% ylim(YL)
% yticks(YT)
% line([Xs(2) Xs(2)],YL,'Color','r','LineStyle','--')
% %ylabel('Coated Pits \newline % Events')
% xlabel('Peak CALM Intensity (AU)')
% xticks(XT)
% xlim(XL)
% a = get(gca,'XTickLabel');
% set(gca,'XTickLabel',a,'fontsize',FS)
% subplot(2,3,10)
% clear CDF
% for i2=1:length(H)
%     CDF(i2)=sum(H(1:i2))/sum(H);
% end
% plot(CBins,CDF)
% hold on
% CDF_PrctileLines(CBins,CDF,PRCs);
% xlim([0 max(CBins)])
% xlabel('Peak CALM Intensity (AU)')
% %ylabel('         Coated Pits \newline Cumulative Frequency')
% xticks(XT)
% xlim(XL)
% a = get(gca,'XTickLabel');
% set(gca,'XTickLabel',a,'fontsize',FS)

%%  Individual siRNA pre cells
bins=100;
figure
for i=1:length(SIpre)
    figure(1)
    [H,CBins]=hist(MS_EF{SIpre(i)}/10^4,CBins);
    clear CDF
    for i2=1:length(H)
        CDF(i2)=sum(H(1:i2))/sum(H);
    end
    figure(2)
    if i==1
    Obj(1)=plot(CBins,CDF,'r');
    else
      plot(CBins,CDF,'r')  
    end
    hold on
    %CDF_PrctileLines(CBins,CDF,PRCs);
    xlim([0 max(CBins)])
    xlabel('Peak CALM Intensity (AU)')
    %ylabel('         Coated Pits \newline Cumulative Frequency')
    xticks(XT)
    xlim(XL)
    a = get(gca,'XTickLabel');
    set(gca,'XTickLabel',a,'fontsize',FS)
end

for i=1:length(WTpre)
    figure(1)
    [H,CBins]=hist(MS_EF{WTpre(i)}/10^4,CBins);
    clear CDF
    for i2=1:length(H)
        CDF(i2)=sum(H(1:i2))/sum(H);
    end
    figure(2)
    if i==1
    Obj(2)=plot(CBins,CDF,'b');
    else
      plot(CBins,CDF,'b')  
    end
    hold on
    %CDF_PrctileLines(CBins,CDF,PRCs);
    xlim([0 max(CBins)])
    xlabel('Peak CALM Intensity (AU)')
    %ylabel('         Coated Pits \newline Cumulative Frequency')
    xticks(XT)
    xlim(XL)
    ylabel('CDF')
    a = get(gca,'XTickLabel');
    set(gca,'XTickLabel',a,'fontsize',FS)
end
title('Individual Cells Before Osmotic Shock')
legend(Obj,{'siRNA','Control'})
