function [MAC,SAC,MCell,SCell,MSrCell]=QuantifyACRatios_Full_ReasonableFits(files)
%Finds mean and standard deviation of Log A:C ratio of all spots

for i0=1:length(files)
    load(files{i0})
    usedC=SelectReasonableZGaussFits(NSTAms);
    M=[];
    S=[];
    MSr=[];
    for i=1:length(NSTAms)
        if ~isempty(usedC{i})
            M=[M NSTAms(i).int(1)];
            S=[S NSTAms(i).sint(1)];
            
            MSr=[MSr log(NSTAms(i).int(1)/NSTAms(i).sint)];
        end
    end
    MAC(i0)=mean(MSr);
    SAC(i0)=sqrt(var(MSr));
    MCell{i0}=M;
    SCell{i0}=S;
    MSrCell{i0}=MSr;
end