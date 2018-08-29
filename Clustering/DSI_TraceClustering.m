clear all
FrameGap=2;
MaxFrame=151;
Tmast=1000;
Tslave=0;
MinLTF=30/FrameGap;

load('DoubleSIRNA_ManualCytosolData.mat')
CBS_DSI=CBS_DSI([1 3 4 5 6 7 8]);
Area_DSI=Area_DSI([1 3 4 5 6 7 8]);

IncludeStalls=0;

folderwt='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath WT\Movies';
foldersi='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath SI\Movies';
folderdsi='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath SI Low CALM\Movies';
fileswt=FindFiles(folderwt,'*Red_FXYCMS.mat');
filessi=FindFiles(foldersi,'*Red_FXYCMS.mat');
filesdsi=FindFiles(folderdsi,'*Red_FXYCMS.mat');

%Resort cells into more accurate groups
tempsi{1}=filesdsi{5};
tempsi{2}=filesdsi{6};
tempdsi{1}=filessi{5};
filessi{5}=tempsi{1};
filessi{6}=tempsi{2};
filesdsi{5}=tempdsi{1};
inds=[1 2 3 4 5 7];
for i=1:6
    tfilesdsi{i}=filesdsi{inds(i)};
end
filesdsi=tfilesdsi;
ASI=[Area_SI(1:4) Area_DSI(5:6)];
ADSI=[Area_DSI([1 2 3 4 7]) Area_SI(5)];
Area_SI=ASI;
Area_DSI=ADSI;

FXYC_WT={};
FXYC_SI={};
indw=1;
inds=1;
for i=1:length(fileswt)
    load(fileswt{i})
    [Nc,Fs,FXYCMS_Sel]=CountConclusions_BySlope(FXYCMS,Tmast,MinLTF,FrameGap,Inf,1);
    for i2=1:length(FXYCMS_Sel)
        fxyc=FXYCMS_Sel{i2};
        if fxyc(1,4)==3
            FXYC_WT{indw}=fxyc;
            indw=indw+1;
        end
    end
end

for i=1:length(filessi)
    load(filessi{i})
    [Nc,Fs,FXYCMS_Sel]=CountConclusions_BySlope(FXYCMS,Tmast,MinLTF,FrameGap,Inf,1);
    for i2=1:length(FXYCMS_Sel)
        fxyc=FXYCMS_Sel{i2};
        if fxyc(1,4)==3
            FXYC_SI{inds}=fxyc;
            inds=inds+1;
        end
    end
end

%%
Clusts=5;
FXYC_TOT=CombineCells(FXYC_WT,FXYC_SI);
LTs=zeros(1,length(FXYC_TOT));
for i=1:length(FXYC_TOT)
    LTs(i)=length(FXYC_TOT{i}(:,1))*FrameGap;
end
N1=length(FXYC_WT);
N2=length(FXYC_SI);
[IntCellM,IntCellS]=FXYCMS2IntCells(FXYC_TOT,3,1,1);
[clusters] = createTraceLibrary_Temp(IntCellM,FrameGap,Clusts,10,0,1);
VisualizeClusterSplit(clusters,N1,N2,LTs);