function [MCell,SCell,MSrCell,MAC,SAC,Sample]=QuantifyACRatios_Add_Options(files,MCell,SCell,MSrCell,fits,ZGauss)
%Finds mean and standard deviation of Log A:C ratio of all spots

for i0=1:length(files)
    load(files{i0})
    if strcmp(fits,"VeryGood")
        usedC=SelectVeryGoodZGaussFits(NSTAms);
    else
        if strcmp(fits,"Reasonable")
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
        for i=1:length(NSTAms)
            Mast=NSTAms(i).ZGaussA(1);
            Slav=NSTAms(i).SZGaussA(1);
            if ~isempty(usedC{i}) && Mast>0 && Slav>0
                M=[M Mast];
                S=[S Slav];
                
                MSr=[MSr log(Mast/Slav)];
            end
        end
    end
    MAC(i0)=mean(MSrCell{i0});
    SAC(i0)=sqrt(var(MSrCell{i0}));
    Sample(i0)=length(MSrCell{i0});
    MCell{i0}=[MCell{i0} M];
    SCell{i0}=[SCell{i0} S];
    MSrCell{i0}=[MSrCell{i0} MSr];
end