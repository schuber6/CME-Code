function [ConcsMI,ConcsSI,MI,SI,ConcsLT]=TabulateConclusionIntensity(Inits,Concs,FXYCMS,MinL)
    
    ConcsMI=cell(1,length(Concs));
    ConcsSI=cell(1,length(Concs));
    ConcsLT=cell(1,length(Concs));
    for i=1:length(Concs)
        TempMI=[];
        TempSI=[];
        TempLT=[];
        for i2=1:length(Concs{i})
            ind=Concs{i}(i2);
            [MasterMax,SlaveMax,LT]=FindConclusionMaxIntensity(FXYCMS,ind,MinL);
            TempMI(i2)=MasterMax;
            TempSI(i2)=SlaveMax;
            TempLT(i2)=LT;
        end
        ConcsMI{i}=TempMI;
        ConcsSI{i}=TempSI;
        ConcsLT{i}=TempLT;
    end
    MI=zeros(1,length(Concs));
    SI=zeros(1,length(Concs));
    for i=1:length(Concs)
        if ~isempty(Concs{i})
            MI(i)=median(ConcsMI{i});
            SI(i)=median(ConcsSI{i});
        end
    end