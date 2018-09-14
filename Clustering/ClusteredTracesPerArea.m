function [TpA_WT,TpA_SI]=ClusteredTracesPerArea(clusters,Good,AreaWT,AreaSI,Cell)

T_WT=zeros(1,length(AreaWT));
T_SI=zeros(1,length(AreaSI));
for i=1:length(Good)
    Is=clusters(Good(i)).index;
    for i2=1:max(Cell)
        usedC=find(Cell(Is)==i2);
        if i2<=length(AreaWT)
            T_WT(i2)=T_WT(i2)+length(usedC);
        else
            T_SI(i2-length(AreaWT))=T_SI(i2-length(AreaWT))+length(usedC);
        end
    end
end
TpA_WT=T_WT./AreaWT;
TpA_SI=T_SI./AreaSI;