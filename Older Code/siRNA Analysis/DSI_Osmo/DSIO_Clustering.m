clear all
load('BothDSIO_Struct_180831.mat')

FrameGap=2;
Tmast=0;
MinLTF=5;
ClathMin=.5*10^4;

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

used{1}=SIpre;
used{2}=WTpre;
used{3}=SI3m66;
used{4}=WT3m66;
used{5}=SI3m80;
used{6}=WT3m80;
used{7}=SI10m66;
used{8}=WT10m66;
used{9}=SI10m80;
used{10}=WT10m80;

FXYC_TOT={};
inds=1;
G=[];
C=[];
MSt=[];
for i0=1:10
    for i=1:length(used{i0})
        load(DSIOfiles(used{i0}(i)).file)
        [Nc,Fs,FXYCMS_Sel,~,~,~,~,MM,MSi]=CountConclusions_BySlope(FXYCMS,Tmast,MinLTF,FrameGap,Inf,1);
        for i2=1:length(FXYCMS_Sel)
            fxyc=FXYCMS_Sel{i2};
            if fxyc(1,4)==3
                FXYC_TOT{inds}=fxyc;
                G(inds)=i0;
                C(inds)=used{i0}(i);
                MSt(inds)=MSi(i2);
                inds=inds+1;
            end
        end
    end
end
save('DSIO_Data_ToCluster_180918.mat','FXYC_TOT','G','C','MSt')
%%
clear all
load('DSIO_Data_ToCluster_180918.mat')
FrameGap=2;

Clusts=10;

LTs=zeros(1,length(FXYC_TOT));
for i=1:length(FXYC_TOT)
    LTs(i)=length(FXYC_TOT{i}(:,1))*FrameGap;
end

[IntCellM,IntCellS]=FXYCMS2IntCells(FXYC_TOT,3,1,1);
[clusters] = createTraceLibrary_Temp(IntCellM,FrameGap,Clusts,10,0,1);
VisualizeClusterSplit_DSIO(clusters,G,LTs,[])
VisualizeClusterTraces_DSIO(clusters,G,FXYC_TOT)

%% Resort with only the traces from good clusters
FXYC_Good={};
Gs_Good=[];
Cs_Good=[];
GoodClusts=[1 2 3 9];
for i=GoodClusts
    Is=clusters(i).index;
    Gs=G(Is);
    Cs=C(Is);
    FXYC_Good=CombineCells(FXYC_Good,FXYC_TOT(Is));
    Gs_Good=[Gs_Good Gs];
    Cs_Good=[Cs_Good Cs];
end
save('DSIO_OnceClusteredData_ToCluster_180918.mat','FXYC_Good','Gs_Good','Cs_Good')

%%


Clusts=5;

LTs=zeros(1,length(FXYC_Good));
for i=1:length(FXYC_Good)
    LTs(i)=length(FXYC_Good{i}(:,1))*FrameGap;
end

[IntCellM,IntCellS]=FXYCMS2IntCells(FXYC_Good,3,1,1);
[clusters] = createTraceLibrary_Temp(IntCellM,FrameGap,Clusts,10,0,1);
Areas=SumGroupAreas(DSIOfiles,used);
VisualizeClusterSplit_DSIO(clusters,Gs_Good,LTs,Areas)
VisualizeClusterTraces_DSIO(clusters,Gs_Good,FXYC_TOT)

%%
GSel=[2 6 10];
Sel=[1 2 3];
px=2;
py=3;
Areas=SumGroupAreas(DSIOfiles,used);
VisualizeClusterSplit_DSIO(clusters,Gs_Good,LTs,Areas)
PlotClusterSlaveIntensities_Selected_Selected(IntCellS,IntCellM,clusters,Gs_Good,GSel,Sel,px,py)

%%
CP=zeros(1,length(DSIOfiles));
MSft=cell(1,length(DSIOfiles));
GoodClusts=[1 2 3 9];
for i=GoodClusts
    Is=clusters(i).index;
    Gs=G(Is);
    Cs=C(Is);
    for i2=1:length(Cs)
        CP(Cs(i2))=CP(Cs(i2))+1;
        MSft{Cs(i2)}=[MSft{Cs(i2)} MSt(Is(i2))];
    end
end

%%

for i=1:length(DSIOfiles)
    DSIOfiles(i).ClusteredFullTraces=CP(i);
    DSIOfiles(i).ClusteredFullTracesPerArea=CP(i)/DSIOfiles(i).area;
end

%%

figure
scatter([DSIOfiles.ClusteredFullTracesPerArea],[DSIOfiles.ConcsPerArea])

%%
MedS=[];
h=waitbar(0,'adfs');
for i=1:length(DSIOfiles)
    waitbar(i/length(DSIOfiles))
    load(DSIOfiles(i).file)
    [MedM{i},MedS{i}]=QuantifyStallIntensities(FXYCMS);
end
close(h)