function [ConcsMI,ConcsSI,MI,SI]=TabulateConclusionIntensity(Inits,Concs,FXYCMS)
    
    ConcsMI=cell(1,length(Concs));
ConcsSI=cell(1,length(Concs));
for i=1:length(Concs)
    TempMI=[];
    TempSI=[];
    for i2=1:length(Concs{i})
        ind=Concs{i}(i2);
        [MasterMax,SlaveMax]=FindConclusionMaxIntensity(FXYCMS,ind);
        TempMI(i2)=MasterMax;
        TempSI(i2)=SlaveMax;
    end
    ConcsMI{i}=TempMI;
    ConcsSI{i}=TempSI;
end
MI=zeros(1,length(Concs));
SI=zeros(1,length(Concs));
for i=1:length(Concs)
    if ~isempty(Concs{i})
        MI(i)=median(ConcsMI{i});
        SI(i)=median(ConcsSI{i});
    end
end