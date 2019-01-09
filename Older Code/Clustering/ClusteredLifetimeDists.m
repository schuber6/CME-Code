function [LT_WT,LT_SI]=ClusteredLifetimeDists(clusters,LTs,Good,Gs)

LT_WT=[];
LT_SI=[];
for i=1:length(Good)
    Is=clusters(Good(i)).index;
    usedWT=find(Gs(Is)==1);
    usedSI=find(Gs(Is)==2);
    LT_WT=[LT_WT LTs(Is(usedWT))];
    LT_SI=[LT_SI LTs(Is(usedSI))];
end