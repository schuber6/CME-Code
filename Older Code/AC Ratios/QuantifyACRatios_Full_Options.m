function [MAC,SAC,MCell,SCell,MSrCell]=QuantifyACRatios_Full_Options(files,fits,ZGauss)
%Finds mean and standard deviation of Log A:C ratio of all spots

for i0=1:length(files)
    load(files{i0})
    if fits=="VeryGood"
        usedC=SelectVeryGoodZGaussFits(NSTAms);
    else
        if fits=="Reasonable"
            usedC=SelectReasonableZGaussFits(NSTAms);
        end
    end
    M=[];
    S=[];
    MSr=[];
    if ~ZGauss
        for i=1:length(NSTAms)
            if ~isempty(usedC{i})
                M=[M NSTAms(i).int(1)];
                S=[S NSTAms(i).sint(1)];
                
                MSr=[MSr log(NSTAms(i).int(1)/NSTAms(i).sint)];
            end
        end
    else
        for i=1:length(usedC)
            Mast=NSTAms(i).ZGaussA(1);
            Slav=NSTAms(i).SZGaussA(1);
            if ~isempty(usedC{i}) && Mast>0 && Slav>0
                M=[M Mast];
                S=[S Slav];
                
                MSr=[MSr log(Mast/Slav)];
            end
            
        end
    end
    MAC(i0)=mean(MSr);
    SAC(i0)=sqrt(var(MSr));
    MCell{i0}=M;
    SCell{i0}=S;
    MSrCell{i0}=MSr;
end