clear all
file='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath WT\Movies\wt_018_BS_Red_Tr.mat';
fileS='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath WT\Movies\wt_018_BS_Bright_Traces.mat';
movieM='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath WT\Movies\wt_018_BS_Red.tif';
movieS='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath WT\Movies\wt_018_BS_Green.tif';
load(file);

for i=1:length(TraceINT(:,1))
    MI(i)=min(TraceINT(i,:));
    SI(i)=sum(TraceINT(i,:));
end
SIp=ReversePrctile(SI,0:1:100);
subset=find(SIp>=95);
TraceX=TraceX(subset,:);
TraceY=TraceY(subset,:);
TraceINT=TraceINT(subset,:); %Pass only top 5% of traces by integrated intensity

fxyc=TraceINT2fxyc(TraceX,TraceY,TraceINT);
[FXYCMS]=GenerateMasterSlaveINTs_PixelSum(fxyc,movieS,0,movieM);
save(fileS,'FXYCMS')

%%

PlotRandomFXYCMSF(FXYCMS);

%%
clear all

file='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath SI Low CALM\Movies\si_072_BS_Red_Tr.mat';
movieM='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath SI Low CALM\Movies\si_072_BS_Red.tif';
movieS='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath SI Low CALM\Movies\si_072_BS_Green.tif';
fileS='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath SI Low CALM\Movies\si_072_BS_Red_Bright_Traces.mat';
load(file);

for i=1:length(TraceINT(:,1))
    MI(i)=min(TraceINT(i,:));
    SI(i)=sum(TraceINT(i,:));
end
SIp=ReversePrctile(SI,0:1:100);
subset=find(SIp>=95);
TraceX=TraceX(subset,:);
TraceY=TraceY(subset,:);
TraceINT=TraceINT(subset,:); %Pass only top 5% of traces by integrated intensity

fxyc=TraceINT2fxyc(TraceX,TraceY,TraceINT);
[FXYCMS]=GenerateMasterSlaveINTs_PixelSum(fxyc,movieS,0,movieM);
save(fileS,'FXYCMS')

%%

PlotRandomFXYCMSF(FXYCMS);

%%
clear all

file='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath SI\Movies\si_024_BS_Red_Tr.mat';
movieM='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath SI\Movies\si_024_BS_Red.tif';
movieS='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath SI\Movies\si_024_BS_Green.tif';
fileS='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath SI\Movies\si_024_BS_Bright_Traces.mat';
load(file);

for i=1:length(TraceINT(:,1))
    MI(i)=min(TraceINT(i,:));
    SI(i)=sum(TraceINT(i,:));
end
SIp=ReversePrctile(SI,0:1:100);
subset=find(SIp>=95);
TraceX=TraceX(subset,:);
TraceY=TraceY(subset,:);
TraceINT=TraceINT(subset,:); %Pass only top 5% of traces by integrated intensity

fxyc=TraceINT2fxyc(TraceX,TraceY,TraceINT);
[FXYCMS]=GenerateMasterSlaveINTs_PixelSum(fxyc,movieS,0,movieM);
save(fileS,'FXYCMS')

%%

PlotRandomFXYCMSF(FXYCMS);