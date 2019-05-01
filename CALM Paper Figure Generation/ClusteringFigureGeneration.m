clear all
load('Z:\Scott\CME Data\BothDSIO_DSIOFilesStruct.mat')
ClathMin=.5*10^4;
MinLTF=6;
FrameGap=2;
Tmast=0;
ylab='CALM Intensity at Internalization';
L={'Control','CALM siRNA'};

SIpre=find([DSIOfiles.TimeGroup]==0 & [DSIOfiles.siRNA]==1 & [DSIOfiles.MedianClath]>=ClathMin);   %Index preosmo files
WTpre=find([DSIOfiles.TimeGroup]==0 & [DSIOfiles.siRNA]==0 & [DSIOfiles.MedianClath]>=ClathMin);

AreaSIpre=[DSIOfiles(SIpre).area];
AreaWTpre=[DSIOfiles(WTpre).area];

ClathSIpre=[DSIOfiles(SIpre).MedianClath];
ClathWTpre=[DSIOfiles(WTpre).MedianClath];

CALMSIpre=[DSIOfiles(SIpre).MedianCALM];
CALMWTpre=[DSIOfiles(WTpre).MedianCALM];

ConcSIpre=[DSIOfiles(SIpre).ConcsPerArea];
ConcWTpre=[DSIOfiles(WTpre).ConcsPerArea];

FXYC_WT={};
FXYC_SI={};
indw=1;
inds=1;
indt=1;

for i=1:length(WTpre)
    load(DSIOfiles(WTpre(i)).file)
    [Nc,Fs,FXYCMS]=CountConclusions_BySlope(FXYCMS,Tmast,MinLTF,FrameGap,Inf,1,2);
    for i2=1:length(FXYCMS)
        fxyc=FXYCMS{i2};
        if fxyc(1,4)==3 && length(fxyc(:,1))>=MinLTF
            FXYC_WT{indw}=fxyc;
            Cell(indt)=i;
            indt=indt+1;
            indw=indw+1;
        end
    end
end

for i=1:length(SIpre)
    load(DSIOfiles(SIpre(i)).file)
    [Nc,Fs,FXYCMS]=CountConclusions_BySlope(FXYCMS,Tmast,MinLTF,FrameGap,Inf,1,2);
    for i2=1:length(FXYCMS)
        fxyc=FXYCMS{i2};
        if fxyc(1,4)==3 && length(fxyc(:,1))>=MinLTF
            FXYC_SI{inds}=fxyc;
            Cell(indt)=i+length(WTpre);
            indt=indt+1;
            inds=inds+1;
        end
    end
end

%%
figure
N=median(ClathWTpre);
BoxPlotCell({ClathWTpre/N,ClathSIpre/N})
xticklabels({'Control','siRNA'})
a = get(gca,'XTickLabel');

set(gca,'XTickLabel',a,'fontsize',16)
ylabel('Median Clathrin Intensity','FontSize',18)
YL=ylim;
ylim([0 YL(2)])
figure
N=median(CALMWTpre);
BoxPlotCell({CALMWTpre/N,CALMSIpre/N})
xticklabels({'Control','siRNA'})

a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',16)
ylabel('Median CALM Intensity','FontSize',18)
YL=ylim;
ylim([0 YL(2)])
figure
BoxPlotCell({ConcWTpre/5,ConcSIpre/5},@notBoxPlot)
xticklabels({'Control','siRNA'})
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',16)
ylabel('Internalizations/um^2/min','FontSize',18)
YL=ylim;
ylim([0 YL(2)])
%%  2
%Sample=10000;
FrameGap=2;
Clusts=10;
FXYC_TOT=CombineCells(FXYC_WT,FXYC_SI);
Gs=[zeros(1,length(FXYC_WT))+1 zeros(1,length(FXYC_SI))+2];
%Gs=[zeros(1,Sample)+1 zeros(1,Sample)+2];
LTs=zeros(1,length(FXYC_TOT));
for i=1:length(FXYC_TOT)
    LTs(i)=length(FXYC_TOT{i}(:,1))*FrameGap;
    MSs(i)=max(FXYC_TOT{i}(:,7));
end
N1=length(FXYC_WT);
N2=length(FXYC_SI);
% N1=Sample;
% N2=Sample;
[IntCellM,IntCellS]=FXYCMS2IntCells(FXYC_TOT,3,1,1);
[IntCellMus,IntCellSus]=FXYCMS2IntCells(FXYC_TOT,3,0,1);
[IntCellMus2,IntCellSus2]=FXYCMS2IntCells(FXYC_TOT,3,0,0);
[clusters] = createTraceLibrary_Temp(IntCellM,FrameGap,Clusts,10,0,1);
%save DSI_Clusters.mat clusters N1 N2 LTs Cell IntCellS IntCellM Gs
%%
%clear all
load('Z:\Scott\CME Data\DSI_Clusters.mat')
NC1=length(WTpre);
%VisualizeClusterSplit(clusters,N1,N2,LTs,Cell,NC1);
VisualizeClusterSplit_Unclust(clusters,N1,N2,LTs,Cell,NC1);
%PlotClusterSlaveIntensities(IntCellSus2,clusters,Gs);
PlotClusterSlaveIntensities_Selected(IntCellS,IntCellM,clusters,Gs,[1 2 3],2,3);

%%

GoodClusts=[1 2 3];
[LT_WT,LT_SI]=ClusteredLifetimeDists(clusters,LTs,GoodClusts,Gs);
[MS_WT,MS_SI]=ClusteredLifetimeDists(clusters,MSs,GoodClusts,Gs);
figure
CDFCell({LT_WT,LT_SI},50,{'c','r'})
legend({'Control','siRNA'},'Location','southeast')



a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',14)
xlabel('Lifetime (s)','FontSize',20)
xlim([0 200])
ylabel('CDF','FontSize',20)
xticks(20:40:200)
xticklabels(20:40:200)
%[h,p]=kstest2(LT_WT,LT_WT)
figure
CDFCell({MS_WT,MS_SI},50,{'c','r'})
legend({'Control','siRNA'},'Location','southeast')

a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',14)
xticks(0:10^4:8*10^4)
xticklabels(0:1:8)
xlabel('Peak CALM Intensity (AU)','FontSize',20)
%xlim([0 200])
ylabel('CDF','FontSize',20)
%[h,p]=kstest2(LT_WT,LT_WT)
figure
HistCell({LT_WT,LT_SI},50)
[h,p]=ttest2(LT_WT,LT_SI)