%%  Look at CALM intensities from day 3
clear all
%load('BothDSIO_Struct_180831.mat')
load('BothDSIO_DSIOFilesStruct_181119_EndoFilter.mat')
YL=[0 .45];
ClathMin=0*10^4;
sig=0;
ylab='Internalizations/um^2/5 min';
L={'Control','CALM siRNA'};

SIpre=find([DSIOfiles.Day]>0 & [DSIOfiles.Day]<3 & [DSIOfiles.siRNA]==1);   %Index preosmo files
WTpre=find([DSIOfiles.Day]>0 & [DSIOfiles.Day]<3 & [DSIOfiles.siRNA]==0);

SIpred3=find([DSIOfiles.Day]==3 & [DSIOfiles.siRNA]==1);   %Index preosmo files
WTpred3=find([DSIOfiles.Day]==3 & [DSIOfiles.siRNA]==0);

B66(1,2)=mean([DSIOfiles(SIpre).MedianCALM]);
B66(1,1)=mean([DSIOfiles(WTpre).MedianCALM]);
B66(2,2)=mean([DSIOfiles(SIpred3).MedianCALM]);
B66(2,1)=mean([DSIOfiles(WTpred3).MedianCALM]);

E66(1,2)=sqrt(var([DSIOfiles(SIpre).MedianCALM]))/sqrt(length(SIpre));
E66(1,1)=sqrt(var([DSIOfiles(WTpre).MedianCALM]))/sqrt(length(WTpre));
E66(2,2)=sqrt(var([DSIOfiles(SIpred3).MedianCALM]))/sqrt(length(SIpred3));
E66(2,1)=sqrt(var([DSIOfiles(WTpred3).MedianCALM]))/sqrt(length(WTpred3));

figure
b=bar(B66,'FaceAlpha',.75);
hold on
b(1).FaceColor = 'c';
b(2).FaceColor = 'r';
errorbar([1 2]-.15,B66(:,1),E66(:,1),'.','Color','k')
errorbar([1 2]+.15,B66(:,2),E66(:,2),'.','Color','k')
legend('Control Cells','CALM siRNA Cells')
ylabel('Median CALM Intensity')
xticks(1:2)
xticklabels({'Old Data','New Data'})
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',16)
%title('66% Osmotic Shock (Old Data)','FontSize',20)

%%  Look at Clathrin intensities from day 3
clear all
%load('BothDSIO_Struct_180831.mat')
load('BothDSIO_DSIOFilesStruct_181119_EndoFilter.mat')
YL=[0 .45];
ClathMin=0*10^4;
sig=0;
ylab='Internalizations/um^2/5 min';
L={'Control','CALM siRNA'};

SIpre=find([DSIOfiles.Day]>0 & [DSIOfiles.Day]<3 & [DSIOfiles.siRNA]==1);   %Index preosmo files
WTpre=find([DSIOfiles.Day]>0 & [DSIOfiles.Day]<3 & [DSIOfiles.siRNA]==0);

SIpred3=find([DSIOfiles.Day]==3 & [DSIOfiles.siRNA]==1);   %Index preosmo files
WTpred3=find([DSIOfiles.Day]==3 & [DSIOfiles.siRNA]==0);

B66(1,2)=mean([DSIOfiles(SIpre).MedianClath]);
B66(1,1)=mean([DSIOfiles(WTpre).MedianClath]);
B66(2,2)=mean([DSIOfiles(SIpred3).MedianClath]);
B66(2,1)=mean([DSIOfiles(WTpred3).MedianClath]);

E66(1,2)=sqrt(var([DSIOfiles(SIpre).MedianClath]))/sqrt(length(SIpre));
E66(1,1)=sqrt(var([DSIOfiles(WTpre).MedianClath]))/sqrt(length(WTpre));
E66(2,2)=sqrt(var([DSIOfiles(SIpred3).MedianClath]))/sqrt(length(SIpred3));
E66(2,1)=sqrt(var([DSIOfiles(WTpred3).MedianClath]))/sqrt(length(WTpred3));

figure
b=bar(B66,'FaceAlpha',.75);
hold on
b(1).FaceColor = 'c';
b(2).FaceColor = 'r';
errorbar([1 2]-.15,B66(:,1),E66(:,1),'.','Color','k')
errorbar([1 2]+.15,B66(:,2),E66(:,2),'.','Color','k')
legend('Control Cells','CALM siRNA Cells')
ylabel('Median Clathrin Intensity')
xticks(1:2)
xticklabels({'Old Data','New Data'})
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',16)
%title('66% Osmotic Shock (Old Data)','FontSize',20)
