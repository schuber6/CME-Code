
protein='AP2';
if strcmp(protein,'AP2')
    exp_name='E:\CME Superfolder\CME Data\171010_Calibrated_AP2_DNM';
    Good=[8 10 11]; %Best AP2 cells
    PCol='r';
end
if strcmp(protein,'CALM')
    exp_name='E:\CME Superfolder\CME Data\SinlgeGFP\orig_movies';
    Good=[11 22 25]; %Best CALM cells
    PCol='g';
end
if strcmp(protein,'Dynamin')
    exp_name='E:\CME Superfolder\CME Data\171010_Calibrated_AP2_DNM';
    Good=[15 16 17 18]; %Best DNM cells
    PCol='b';
end
%Good=[15 16 17 18]; %Best DNM cells

tmpd = dir(fullfile(exp_name,'*.mat'));
LastN=10;
N=9;
GFPInt=31;
MGFPINT=18400/80;

MinNum=3;
xbins=1:2:200;

i0=Good(3);
movies{i0} = fullfile(exp_name,tmpd(i0).name);
files{i0}=strcat(movies{i0}(1:end-4),'.tif');
newfiles{i0}=strcat(movies{i0}(1:end-4),'_Boxed','.tif');
load(movies{i0});

[MI3,Fs3,LTs3,TraceFXY3,TraceA3]=FindGoodTraceMaxInts(Threshfxyc,10,50);
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
[Is3,Bs3]=ManualFitEvents_BackR(FullFXY3,files{i0},3,0,'sum');
ManI3=cell(1,length(TraceFXY3));
for i2=1:length(TraceFXY3)
    ManI3{i2}=Is3(indices3{i2});
    MMI3(i2)=max(ManI3{i2});
end

[MI,Fs,LTs,TraceFXY,TraceA]=Find123TraceMaxInts(Threshfxyc,10,50);
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
[Is,Bs]=ManualFitEvents_BackR(FullFXY,files{i0},3,0,'sum');
ManI=cell(1,length(TraceFXY));
for i2=1:length(TraceFXY)
    ManI{i2}=Is(indices{i2});
    MMI(i2)=max(ManI{i2});
end

LTs=LTs*3;
MI=MI/GFPInt;
MMI=MMI/MGFPINT;
Cohort_AverageTraces_NoPlot;