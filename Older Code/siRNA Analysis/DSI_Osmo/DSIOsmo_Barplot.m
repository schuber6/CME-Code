clear all
%load('BothDSIO_Struct_180831.mat')
load('Misc\BothDSIO_Struct_180917_EndoFilter.mat')

YL=[0 .45];
ClathMin=.5*10^4;
sig=0;
ylab='Internalizations/um^2/5 min';
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

B80(1,2)=sum([DSIOfiles(SIpre).NConclusions])/sum([DSIOfiles(SIpre).area]);
B80(1,1)=sum([DSIOfiles(WTpre).NConclusions])/sum([DSIOfiles(WTpre).area]);
B80(2,2)=sum([DSIOfiles(SI3m80).NConclusions])/sum([DSIOfiles(SI3m80).area]);
B80(2,1)=sum([DSIOfiles(WT3m80).NConclusions])/sum([DSIOfiles(WT3m80).area]);
B80(3,2)=sum([DSIOfiles(SI10m80).NConclusions])/sum([DSIOfiles(SI10m80).area]);
B80(3,1)=sum([DSIOfiles(WT10m80).NConclusions])/sum([DSIOfiles(WT10m80).area]);

S80=[length(SIpre) length(WTpre) length(SI3m80) length(WT3m80) length(SI10m80) length(WT10m80)];
S66=[length(SIpre) length(WTpre) length(SI3m66) length(WT3m66) length(SI10m66) length(WT10m66)];


E80(1,2)=sqrt(var([DSIOfiles(SIpre).NConclusions]./[DSIOfiles(SIpre).area]))/sqrt(length(SIpre));
E80(1,1)=sqrt(var([DSIOfiles(WTpre).NConclusions]./[DSIOfiles(WTpre).area]))/sqrt(length(WTpre));
E80(2,2)=sqrt(var([DSIOfiles(SI3m80).NConclusions]./[DSIOfiles(SI3m80).area]))/sqrt(length(SI3m80));
E80(2,1)=sqrt(var([DSIOfiles(WT3m80).NConclusions]./[DSIOfiles(WT3m80).area]))/sqrt(length(WT3m80));
E80(3,2)=sqrt(var([DSIOfiles(SI10m80).NConclusions]./[DSIOfiles(SI10m80).area]))/sqrt(length(SI10m80));
E80(3,1)=sqrt(var([DSIOfiles(WT10m80).NConclusions]./[DSIOfiles(WT10m80).area]))/sqrt(length(WT10m80));

figure
subplot(1,2,1)
b=bar(B80/5,'FaceAlpha',.75);
hold on
b(1).FaceColor = 'c';
b(2).FaceColor = 'r';
errorbar([1 2 3]-.15,B80(:,1)/5,E80(:,1)/5,'.','Color','k')
errorbar([1 2 3]+.15,B80(:,2)/5,E80(:,2)/5,'.','Color','k')

legend('Control Cells','CALM siRNA Cells')
xticks(1:3)
xticklabels({'Before','3-8 min After','10-15 min After'})
ylabel('Internalizations/um^2/min')
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',16)
title('80% Osmotic Shock','FontSize',20)


B66(1,2)=sum([DSIOfiles(SIpre).NConclusions])/sum([DSIOfiles(SIpre).area]);
B66(1,1)=sum([DSIOfiles(WTpre).NConclusions])/sum([DSIOfiles(WTpre).area]);
B66(2,2)=sum([DSIOfiles(SI3m66).NConclusions])/sum([DSIOfiles(SI3m66).area]);
B66(2,1)=sum([DSIOfiles(WT3m66).NConclusions])/sum([DSIOfiles(WT3m66).area]);
B66(3,2)=sum([DSIOfiles(SI10m66).NConclusions])/sum([DSIOfiles(SI10m66).area]);
B66(3,1)=sum([DSIOfiles(WT10m66).NConclusions])/sum([DSIOfiles(WT10m66).area]);

E66(1,2)=sqrt(var([DSIOfiles(SIpre).NConclusions]./[DSIOfiles(SIpre).area]))/sqrt(length(SIpre));
E66(1,1)=sqrt(var([DSIOfiles(WTpre).NConclusions]./[DSIOfiles(WTpre).area]))/sqrt(length(WTpre));
E66(2,2)=sqrt(var([DSIOfiles(SI3m66).NConclusions]./[DSIOfiles(SI3m66).area]))/sqrt(length(SI3m66));
E66(2,1)=sqrt(var([DSIOfiles(WT3m66).NConclusions]./[DSIOfiles(WT3m66).area]))/sqrt(length(WT3m66));
E66(3,2)=sqrt(var([DSIOfiles(SI10m66).NConclusions]./[DSIOfiles(SI10m66).area]))/sqrt(length(SI10m66));
E66(3,1)=sqrt(var([DSIOfiles(WT10m66).NConclusions]./[DSIOfiles(WT10m66).area]))/sqrt(length(WT10m66));

subplot(1,2,2)
b=bar(B66/5,'FaceAlpha',.75);
hold on
b(1).FaceColor = 'c';
b(2).FaceColor = 'r';
errorbar([1 2 3]-.15,B66(:,1)/5,E66(:,1)/5,'.','Color','k')
errorbar([1 2 3]+.15,B66(:,2)/5,E66(:,2)/5,'.','Color','k')
legend('Control Cells','CALM siRNA Cells')
ylabel('Internalizations/um^2/min')
xticks(1:3)
xticklabels({'Before','3-8 min After','10-15 min After'})
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',16)
title('66% Osmotic Shock','FontSize',20)

%%  Stalled Structures
clear all
%load('BothDSIO_Struct_180831.mat')
load('Misc\DSIOfiles_WStall_181203_159.mat')

YL=[0 .12];
ClathMin=.5*10^4;
sig=0;
ylab='Stalled Structures/um^2';
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

B80(1,2)=sum([DSIOfiles(SIpre).NStall])/sum([DSIOfiles(SIpre).area]);
B80(1,1)=sum([DSIOfiles(WTpre).NStall])/sum([DSIOfiles(WTpre).area]);
B80(2,2)=sum([DSIOfiles(SI3m80).NStall])/sum([DSIOfiles(SI3m80).area]);
B80(2,1)=sum([DSIOfiles(WT3m80).NStall])/sum([DSIOfiles(WT3m80).area]);
B80(3,2)=sum([DSIOfiles(SI10m80).NStall])/sum([DSIOfiles(SI10m80).area]);
B80(3,1)=sum([DSIOfiles(WT10m80).NStall])/sum([DSIOfiles(WT10m80).area]);

S80=[length(SIpre) length(WTpre) length(SI3m80) length(WT3m80) length(SI10m80) length(WT10m80)];
S66=[length(SIpre) length(WTpre) length(SI3m66) length(WT3m66) length(SI10m66) length(WT10m66)];


E80(1,2)=sqrt(var([DSIOfiles(SIpre).NStall]./[DSIOfiles(SIpre).area]))/sqrt(length(SIpre));
E80(1,1)=sqrt(var([DSIOfiles(WTpre).NStall]./[DSIOfiles(WTpre).area]))/sqrt(length(WTpre));
E80(2,2)=sqrt(var([DSIOfiles(SI3m80).NStall]./[DSIOfiles(SI3m80).area]))/sqrt(length(SI3m80));
E80(2,1)=sqrt(var([DSIOfiles(WT3m80).NStall]./[DSIOfiles(WT3m80).area]))/sqrt(length(WT3m80));
E80(3,2)=sqrt(var([DSIOfiles(SI10m80).NStall]./[DSIOfiles(SI10m80).area]))/sqrt(length(SI10m80));
E80(3,1)=sqrt(var([DSIOfiles(WT10m80).NStall]./[DSIOfiles(WT10m80).area]))/sqrt(length(WT10m80));

% figure
% %subplot(1,2,1)
% b=bar(B80,'FaceAlpha',.75);
% hold on
% b(1).FaceColor = 'c';
% b(2).FaceColor = 'r';
% errorbar([1 2 3]-.15,B80(:,1),E80(:,1),'.','Color','k')
% errorbar([1 2 3]+.15,B80(:,2),E80(:,2),'.','Color','k')
% 
% legend({'Control Cells','CALM siRNA Cells'},'location','northwest')
% xticks(1:3)
% xticklabels({'Before','3-8 min After','10-15 min After'})
% ylabel(ylab)
% ylim(YL)
% a = get(gca,'XTickLabel');
% set(gca,'XTickLabel',a,'fontsize',16)
% title('80% Osmotic Shock','FontSize',20)
figure
%subplot(1,2,1)
spacing=.7;
X=spacing:spacing:(spacing*3);
W=.38;
b(1)=bar(X-.15,B80(:,1),W,'FaceAlpha',.75);
hold on
b(2)=bar(X+.15,B80(:,2),W,'FaceAlpha',.75);
hold on
b(1).FaceColor = 'c';
b(2).FaceColor = 'r';
errorbar(X-.15,B80(:,1),E80(:,1),'.','Color','k')
errorbar(X+.15,B80(:,2),E80(:,2),'.','Color','k')

legend({'Control Cells','CALM siRNA Cells'},'location','northwest')
xticks(X)
xlim([X(1)-.35 X(end)+.35])
xticklabels({'Before','3-8 min After','10-15 min After'})
ylabel(ylab)
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',16)
title('80% Osmotic Shock','FontSize',20)


B66(1,2)=sum([DSIOfiles(SIpre).NStall])/sum([DSIOfiles(SIpre).area]);
B66(1,1)=sum([DSIOfiles(WTpre).NStall])/sum([DSIOfiles(WTpre).area]);
B66(2,2)=sum([DSIOfiles(SI3m66).NStall])/sum([DSIOfiles(SI3m66).area]);
B66(2,1)=sum([DSIOfiles(WT3m66).NStall])/sum([DSIOfiles(WT3m66).area]);
B66(3,2)=sum([DSIOfiles(SI10m66).NStall])/sum([DSIOfiles(SI10m66).area]);
B66(3,1)=sum([DSIOfiles(WT10m66).NStall])/sum([DSIOfiles(WT10m66).area]);

E66(1,2)=sqrt(var([DSIOfiles(SIpre).NStall]./[DSIOfiles(SIpre).area]))/sqrt(length(SIpre));
E66(1,1)=sqrt(var([DSIOfiles(WTpre).NStall]./[DSIOfiles(WTpre).area]))/sqrt(length(WTpre));
E66(2,2)=sqrt(var([DSIOfiles(SI3m66).NStall]./[DSIOfiles(SI3m66).area]))/sqrt(length(SI3m66));
E66(2,1)=sqrt(var([DSIOfiles(WT3m66).NStall]./[DSIOfiles(WT3m66).area]))/sqrt(length(WT3m66));
E66(3,2)=sqrt(var([DSIOfiles(SI10m66).NStall]./[DSIOfiles(SI10m66).area]))/sqrt(length(SI10m66));
E66(3,1)=sqrt(var([DSIOfiles(WT10m66).NStall]./[DSIOfiles(WT10m66).area]))/sqrt(length(WT10m66));

figure
%subplot(1,2,1)
spacing=.7;
X=spacing:spacing:(spacing*3);
W=.38;
b(1)=bar(X-.15,B66(:,1),W,'FaceAlpha',.75);
hold on
b(2)=bar(X+.15,B66(:,2),W,'FaceAlpha',.75);
hold on
b(1).FaceColor = 'c';
b(2).FaceColor = 'r';
errorbar(X-.15,B66(:,1),E66(:,1),'.','Color','k')
errorbar(X+.15,B66(:,2),E66(:,2),'.','Color','k')

legend({'Control Cells','CALM siRNA Cells'},'location','northwest')
xticks(X)
xlim([X(1)-.35 X(end)+.35])
xticklabels({'Before','3-8 min After','10-15 min After'})
ylabel(ylab)
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',16)
title('66% Osmotic Shock','FontSize',20)
% % 
%%  Only plot osmo bit
xlim([1 2.5])
ylim([0 .025])


%%  Only plot control bit
xlim([.3 1.1])
ylim([0 .04])
title('')
xticks([.55 .85])
xticklabels({'Control','CALM siRNA'})
legend([])
%%
% %%
% 
% clear all
% %load('BothDSIO_Struct_180831.mat')
% load('DSIOfiles_WStall_181203_159.mat')
% 
% YL=[0 .45];
% ClathMin=.5*10^4;
% sig=0;
% ylab='Internalizations/um^2/5 min';
% L={'Control','CALM siRNA'};
% 
% SIpre=find([DSIOfiles.TimeGroup]==0 & [DSIOfiles.siRNA]==1 & [DSIOfiles.MedianClath]>=ClathMin);   %Index preosmo files
% WTpre=find([DSIOfiles.TimeGroup]==0 & [DSIOfiles.siRNA]==0 & [DSIOfiles.MedianClath]>=ClathMin);
% 
% SI3m66=find([DSIOfiles.TimeGroup]==1 & [DSIOfiles.siRNA]==1 & [DSIOfiles.pWater]==66 & [DSIOfiles.MedianClath]>=ClathMin);  %Index 3 min post osmo files
% WT3m66=find([DSIOfiles.TimeGroup]==1 & [DSIOfiles.siRNA]==0 & [DSIOfiles.pWater]==66 & [DSIOfiles.MedianClath]>=ClathMin);
% SI3m80=find([DSIOfiles.TimeGroup]==1 & [DSIOfiles.siRNA]==1 & [DSIOfiles.pWater]==80 & [DSIOfiles.MedianClath]>=ClathMin);
% WT3m80=find([DSIOfiles.TimeGroup]==1 & [DSIOfiles.siRNA]==0 & [DSIOfiles.pWater]==80 & [DSIOfiles.MedianClath]>=ClathMin);
% 
% SI10m66=find([DSIOfiles.TimeGroup]==2 & [DSIOfiles.siRNA]==1 & [DSIOfiles.pWater]==66 & [DSIOfiles.MedianClath]>=ClathMin);  %Index 10 min post osmo files
% WT10m66=find([DSIOfiles.TimeGroup]==2 & [DSIOfiles.siRNA]==0 & [DSIOfiles.pWater]==66 & [DSIOfiles.MedianClath]>=ClathMin);
% SI10m80=find([DSIOfiles.TimeGroup]==2 & [DSIOfiles.siRNA]==1 & [DSIOfiles.pWater]==80 & [DSIOfiles.MedianClath]>=ClathMin);
% WT10m80=find([DSIOfiles.TimeGroup]==2 & [DSIOfiles.siRNA]==0 & [DSIOfiles.pWater]==80 & [DSIOfiles.MedianClath]>=ClathMin);
% 
% B80(1,2)=median([DSIOfiles(SIpre).MedLT]);
% B80(1,1)=median([DSIOfiles(WTpre).MedLT]);
% B80(2,2)=median([DSIOfiles(SI3m80).MedLT]);
% B80(2,1)=median([DSIOfiles(WT3m80).MedLT]);
% B80(3,2)=median([DSIOfiles(SI10m80).MedLT]);
% B80(3,1)=median([DSIOfiles(WT10m80).MedLT]);
% 
% S80=[length(SIpre) length(WTpre) length(SI3m80) length(WT3m80) length(SI10m80) length(WT10m80)];
% S66=[length(SIpre) length(WTpre) length(SI3m66) length(WT3m66) length(SI10m66) length(WT10m66)];
% 
% 
% E80(1,2)=sqrt(var([DSIOfiles(SIpre).MedLT]))/sqrt(length(SIpre));
% E80(1,1)=sqrt(var([DSIOfiles(WTpre).MedLT]))/sqrt(length(WTpre));
% E80(2,2)=sqrt(var([DSIOfiles(SI3m80).MedLT]))/sqrt(length(SI3m80));
% E80(2,1)=sqrt(var([DSIOfiles(WT3m80).MedLT]))/sqrt(length(WT3m80));
% E80(3,2)=sqrt(var([DSIOfiles(SI10m80).MedLT]))/sqrt(length(SI10m80));
% E80(3,1)=sqrt(var([DSIOfiles(WT10m80).MedLT]))/sqrt(length(WT10m80));
% 
% figure
% subplot(1,2,1)
% b=bar(B80,'FaceAlpha',.75);
% hold on
% b(1).FaceColor = 'c';
% b(2).FaceColor = 'r';
% errorbar([1 2 3]-.15,B80(:,1),E80(:,1),'.','Color','k')
% errorbar([1 2 3]+.15,B80(:,2),E80(:,2),'.','Color','k')
% 
% legend('Control Cells','CALM siRNA Cells')
% xticks(1:3)
% xticklabels({'Before','3-8 min After','10-15 min After'})
% ylabel('Internalizations/um^2/min')
% a = get(gca,'XTickLabel');
% set(gca,'XTickLabel',a,'fontsize',16)
% title('80% Osmotic Shock','FontSize',20)
% 
% 
% B66(1,2)=median([DSIOfiles(SIpre).MedLT]);
% B66(1,1)=median([DSIOfiles(WTpre).MedLT]);
% B66(2,2)=median([DSIOfiles(SI3m66).MedLT]);
% B66(2,1)=median([DSIOfiles(WT3m66).MedLT]);
% B66(3,2)=median([DSIOfiles(SI10m66).MedLT]);
% B66(3,1)=median([DSIOfiles(WT10m66).MedLT]);
% 
% E66(1,2)=sqrt(var([DSIOfiles(SIpre).MedLT]))/sqrt(length(SIpre));
% E66(1,1)=sqrt(var([DSIOfiles(WTpre).MedLT]))/sqrt(length(WTpre));
% E66(2,2)=sqrt(var([DSIOfiles(SI3m66).MedLT]))/sqrt(length(SI3m66));
% E66(2,1)=sqrt(var([DSIOfiles(WT3m66).MedLT]))/sqrt(length(WT3m66));
% E66(3,2)=sqrt(var([DSIOfiles(SI10m66).MedLT]))/sqrt(length(SI10m66));
% E66(3,1)=sqrt(var([DSIOfiles(WT10m66).MedLT]))/sqrt(length(WT10m66));
% 
% subplot(1,2,2)
% b=bar(B66,'FaceAlpha',.75);
% hold on
% b(1).FaceColor = 'c';
% b(2).FaceColor = 'r';
% errorbar([1 2 3]-.15,B66(:,1),E66(:,1),'.','Color','k')
% errorbar([1 2 3]+.15,B66(:,2),E66(:,2),'.','Color','k')
% legend('Control Cells','CALM siRNA Cells')
% ylabel('Internalizations/um^2/min')
% xticks(1:3)
% xticklabels({'Before','3-8 min After','10-15 min After'})
% a = get(gca,'XTickLabel');
% set(gca,'XTickLabel',a,'fontsize',16)
% title('66% Osmotic Shock','FontSize',20)

%%  Lifetimes

clear all
%load('BothDSIO_Struct_180831.mat')
load('Misc\DSIOfiles_WStall_181203_159.mat')

YL=[0 120];
ClathMin=.5*10^4;
sig=0;
ylab='Average Lifetime (s)';
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

B80(1,2)=median([DSIOfiles(SIpre).MedLT_Naive]);
B80(1,1)=median([DSIOfiles(WTpre).MedLT_Naive]);
B80(2,2)=median([DSIOfiles(SI3m80).MedLT_Naive]);
B80(2,1)=median([DSIOfiles(WT3m80).MedLT_Naive]);
B80(3,2)=median([DSIOfiles(SI10m80).MedLT_Naive]);
B80(3,1)=median([DSIOfiles(WT10m80).MedLT_Naive]);

S80=[length(SIpre) length(WTpre) length(SI3m80) length(WT3m80) length(SI10m80) length(WT10m80)];
S66=[length(SIpre) length(WTpre) length(SI3m66) length(WT3m66) length(SI10m66) length(WT10m66)];


E80(1,2)=sqrt(var([DSIOfiles(SIpre).MedLT_Naive]))/sqrt(length(SIpre));
E80(1,1)=sqrt(var([DSIOfiles(WTpre).MedLT_Naive]))/sqrt(length(WTpre));
E80(2,2)=sqrt(var([DSIOfiles(SI3m80).MedLT_Naive]))/sqrt(length(SI3m80));
E80(2,1)=sqrt(var([DSIOfiles(WT3m80).MedLT_Naive]))/sqrt(length(WT3m80));
E80(3,2)=sqrt(var([DSIOfiles(SI10m80).MedLT_Naive]))/sqrt(length(SI10m80));
E80(3,1)=sqrt(var([DSIOfiles(WT10m80).MedLT_Naive]))/sqrt(length(WT10m80));

figure
subplot(1,2,1)
b=bar(B80,'FaceAlpha',.75);
hold on
b(1).FaceColor = 'c';
b(2).FaceColor = 'r';
errorbar([1 2 3]-.15,B80(:,1),E80(:,1),'.','Color','k')
errorbar([1 2 3]+.15,B80(:,2),E80(:,2),'.','Color','k')

legend('Control Cells','CALM siRNA Cells')
xticks(1:3)
xticklabels({'Before','3-8 min After','10-15 min After'})
ylabel(ylab)
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',16)
title('80% Osmotic Shock','FontSize',20)
ylim(YL)


B66(1,2)=median([DSIOfiles(SIpre).MedLT_Naive]);
B66(1,1)=median([DSIOfiles(WTpre).MedLT_Naive]);
B66(2,2)=median([DSIOfiles(SI3m66).MedLT_Naive]);
B66(2,1)=median([DSIOfiles(WT3m66).MedLT_Naive]);
B66(3,2)=median([DSIOfiles(SI10m66).MedLT_Naive]);
B66(3,1)=median([DSIOfiles(WT10m66).MedLT_Naive]);

E66(1,2)=sqrt(var([DSIOfiles(SIpre).MedLT_Naive]))/sqrt(length(SIpre));
E66(1,1)=sqrt(var([DSIOfiles(WTpre).MedLT_Naive]))/sqrt(length(WTpre));
E66(2,2)=sqrt(var([DSIOfiles(SI3m66).MedLT_Naive]))/sqrt(length(SI3m66));
E66(2,1)=sqrt(var([DSIOfiles(WT3m66).MedLT_Naive]))/sqrt(length(WT3m66));
E66(3,2)=sqrt(var([DSIOfiles(SI10m66).MedLT_Naive]))/sqrt(length(SI10m66));
E66(3,1)=sqrt(var([DSIOfiles(WT10m66).MedLT_Naive]))/sqrt(length(WT10m66));

subplot(1,2,2)
b=bar(B66,'FaceAlpha',.75);
hold on
b(1).FaceColor = 'c';
b(2).FaceColor = 'r';
errorbar([1 2 3]-.15,B66(:,1),E66(:,1),'.','Color','k')
errorbar([1 2 3]+.15,B66(:,2),E66(:,2),'.','Color','k')
legend('Control Cells','CALM siRNA Cells')
ylabel(ylab)
xticks(1:3)
xticklabels({'Before','3-8 min After','10-15 min After'})
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',16)
title('66% Osmotic Shock','FontSize',20)
ylim(YL)

%%  Internalizations by median

clear all
%load('BothDSIO_Struct_180831.mat')
load('Misc\BothDSIO_Struct_180917_EndoFilter.mat')

YL=[0 .45];
ClathMin=.5*10^4;
sig=0;
ylab='Internalizations/um^2/5 min';
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

B80(1,2)=median([DSIOfiles(SIpre).NConclusions]./[DSIOfiles(SIpre).area]);
B80(1,1)=median([DSIOfiles(WTpre).NConclusions]./[DSIOfiles(WTpre).area]);
B80(2,2)=median([DSIOfiles(SI3m80).NConclusions]./[DSIOfiles(SI3m80).area]);
B80(2,1)=median([DSIOfiles(WT3m80).NConclusions]./[DSIOfiles(WT3m80).area]);
B80(3,2)=median([DSIOfiles(SI10m80).NConclusions]./[DSIOfiles(SI10m80).area]);
B80(3,1)=median([DSIOfiles(WT10m80).NConclusions]./[DSIOfiles(WT10m80).area]);

S80=[length(SIpre) length(WTpre) length(SI3m80) length(WT3m80) length(SI10m80) length(WT10m80)];
S66=[length(SIpre) length(WTpre) length(SI3m66) length(WT3m66) length(SI10m66) length(WT10m66)];


E80(1,2)=sqrt(var([DSIOfiles(SIpre).NConclusions]./[DSIOfiles(SIpre).area]))/sqrt(length(SIpre));
E80(1,1)=sqrt(var([DSIOfiles(WTpre).NConclusions]./[DSIOfiles(WTpre).area]))/sqrt(length(WTpre));
E80(2,2)=sqrt(var([DSIOfiles(SI3m80).NConclusions]./[DSIOfiles(SI3m80).area]))/sqrt(length(SI3m80));
E80(2,1)=sqrt(var([DSIOfiles(WT3m80).NConclusions]./[DSIOfiles(WT3m80).area]))/sqrt(length(WT3m80));
E80(3,2)=sqrt(var([DSIOfiles(SI10m80).NConclusions]./[DSIOfiles(SI10m80).area]))/sqrt(length(SI10m80));
E80(3,1)=sqrt(var([DSIOfiles(WT10m80).NConclusions]./[DSIOfiles(WT10m80).area]))/sqrt(length(WT10m80));

figure
%subplot(1,2,1)
spacing=.7;
X=spacing:spacing:(spacing*3);
W=.38;
b(1)=bar(X-.15,B80(:,1)/5,W,'FaceAlpha',.75);
hold on
b(2)=bar(X+.15,B80(:,2)/5,W,'FaceAlpha',.75);
hold on
b(1).FaceColor = 'c';
b(2).FaceColor = 'r';
errorbar(X-.15,B80(:,1)/5,E80(:,1)/5,'.','Color','k')
errorbar(X+.15,B80(:,2)/5,E80(:,2)/5,'.','Color','k')

legend('Control Cells','CALM siRNA Cells')
xticks(X)
xlim([X(1)-.35 X(end)+.35])
xticklabels({'Before','3-8 min After','10-15 min After'})
ylabel('Internalizations/um^2/min')
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',16)
title('80% Osmotic Shock','FontSize',20)



B66(1,2)=median([DSIOfiles(SIpre).NConclusions]./[DSIOfiles(SIpre).area]);
B66(1,1)=median([DSIOfiles(WTpre).NConclusions]./[DSIOfiles(WTpre).area]);
B66(2,2)=median([DSIOfiles(SI3m66).NConclusions]./[DSIOfiles(SI3m66).area]);
B66(2,1)=median([DSIOfiles(WT3m66).NConclusions]./[DSIOfiles(WT3m66).area]);
B66(3,2)=median([DSIOfiles(SI10m66).NConclusions]./[DSIOfiles(SI10m66).area]);
B66(3,1)=median([DSIOfiles(WT10m66).NConclusions]./[DSIOfiles(WT10m66).area]);

E66(1,2)=sqrt(var([DSIOfiles(SIpre).NConclusions]./[DSIOfiles(SIpre).area]))/sqrt(length(SIpre));
E66(1,1)=sqrt(var([DSIOfiles(WTpre).NConclusions]./[DSIOfiles(WTpre).area]))/sqrt(length(WTpre));
E66(2,2)=sqrt(var([DSIOfiles(SI3m66).NConclusions]./[DSIOfiles(SI3m66).area]))/sqrt(length(SI3m66));
E66(2,1)=sqrt(var([DSIOfiles(WT3m66).NConclusions]./[DSIOfiles(WT3m66).area]))/sqrt(length(WT3m66));
E66(3,2)=sqrt(var([DSIOfiles(SI10m66).NConclusions]./[DSIOfiles(SI10m66).area]))/sqrt(length(SI10m66));
E66(3,1)=sqrt(var([DSIOfiles(WT10m66).NConclusions]./[DSIOfiles(WT10m66).area]))/sqrt(length(WT10m66));

figure
%subplot(1,2,1)
spacing=.7;
X=spacing:spacing:(spacing*3);
W=.38;
b(1)=bar(X-.15,B66(:,1)/5,W,'FaceAlpha',.75);
hold on
b(2)=bar(X+.15,B66(:,2)/5,W,'FaceAlpha',.75);
hold on
b(1).FaceColor = 'c';
b(2).FaceColor = 'r';
errorbar(X-.15,B66(:,1)/5,E66(:,1)/5,'.','Color','k')
errorbar(X+.15,B66(:,2)/5,E66(:,2)/5,'.','Color','k')

legend('Control Cells','CALM siRNA Cells')
xticks(X)
xlim([X(1)-.35 X(end)+.35])
xticklabels({'Before','3-8 min After','10-15 min After'})
ylabel('Internalizations/um^2/min')
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',16)
title('66% Osmotic Shock','FontSize',20)
%%  Only plot osmo bit
xlim([1 2.5])


%%  Only plot control bit
xlim([.3 1.1])
title('')
xticks([.55 .85])
xticklabels({'Control','CALM siRNA'})
legend([])