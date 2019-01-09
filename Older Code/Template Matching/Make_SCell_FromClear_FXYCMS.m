i=2;

folder='E:\CME Superfolder\CME Data\180412_SUM_CALM_AP2_GoodData\RedTraces\AP2 CALM';
files=FindFiles(folder,'*.mat').';
load(files{i})

movie{1}='E:\CME Superfolder\CME Data\180412_SUM_CALM_AP2_GoodData\RedTraces\AP2 CALM\movies\170409_osmo85p_2dt_009_BS_Cell1_Red.tif';
movie{2}='E:\CME Superfolder\CME Data\180412_SUM_CALM_AP2_GoodData\RedTraces\AP2 CALM\movies\ap2_sirna_osmo85p_2dt_50pred_005_BS_Cell1_Red.tif';


LastN=10;
N=9;
GFPInt=31;
MGFPINT=18400/80;

MinNum=3;
xbins=1:2:200;

[MI3,Fs3,LTs3,TraceFXY3,TraceA3]=FindGoodTraceMaxInts_FXYCMS(FXYCMS,10,50);
MMI=[];
indices=cell(1,length(TraceFXY3));
FullFXY3=[];
for i2=1:length(TraceFXY3)
    %waitbar(i2/length(TraceFXY))
    if ~isempty(FullFXY3)
        Lb3=length(FullFXY3(:,1));
    else
        Lb3=0;
    end
    FullFXY3=[FullFXY3 ; TraceFXY3{i2}];
    La3=length(FullFXY3(:,1));
    indices3{i2}=Lb3+1:La3;
end
[Is3,Bs3]=ManualFitEvents_BackR(FullFXY3,movie{i},3,0,'sum');
ManI3=cell(1,length(TraceFXY3));
for i2=1:length(TraceFXY3)
    ManI3{i2}=Is3(indices3{i2});
    MMI3(i2)=max(ManI3{i2});
end

[MI,Fs,LTs,TraceFXY,TraceA]=Find123TraceMaxInts_FXYCMS(FXYCMS,10,50);
MMI=[];
indices=cell(1,length(TraceFXY));
FullFXY=[];
for i2=1:length(TraceFXY)
    %waitbar(i2/length(TraceFXY))
    if ~isempty(FullFXY)
        Lb=length(FullFXY(:,1));
    else
        Lb=0;
    end
    FullFXY=[FullFXY ; TraceFXY{i2}];
    La=length(FullFXY(:,1));
    indices{i2}=Lb+1:La;
end
[Is,Bs]=ManualFitEvents_BackR(FullFXY,movie{i},3,0,'sum');
ManI=cell(1,length(TraceFXY));
for i2=1:length(TraceFXY)
    ManI{i2}=Is(indices{i2});
    MMI(i2)=max(ManI{i2});
end

LTs=LTs*3;
MI=MI/GFPInt;
MMI=MMI/MGFPINT;
Cohort_AverageTraces_NoPlot;