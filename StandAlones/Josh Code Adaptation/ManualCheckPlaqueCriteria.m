file='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath WT\Movies\wt_018_BS_Red_Tr.mat';
movie='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath WT\Movies\wt_018_BS_Red.tif';
load(file)
for i=1:length(TraceINT(:,1))
    MI(i)=min(TraceINT(i,:));
    SI(i)=sum(TraceINT(i,:));
    L(i)=length(nonzeros((TraceINT(i,:))));
end
% u=find(MI>0);
% figure
% hist(SI,100)
% prctile(SI,90)
SIp=ReversePrctile(SI,0:1:100);
subset=find(SIp>=95 & L>=75);
SIp=SIp(subset);

ManualAnalysis_Tracker(file,movie,subset,SIp);

%%
sTraceINT=TraceINT(subset,:);
PlotRandomTraceINT(sTraceINT,SIp);


