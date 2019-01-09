function [MS_WT,MS_SI]=ClusteredMSDists(clusters,MSs,Good,Gs)

MS_WT=[];
MS_SI=[];
for i=1:length(Good)
    Is=clusters(Good(i)).index;
    usedWT=find(Gs(Is)==1);
    usedSI=find(Gs(Is)==2);
    MS_WT=[MS_WT MSs(Is(usedWT))];
    MS_SI=[MS_SI MSs(Is(usedSI))];
end