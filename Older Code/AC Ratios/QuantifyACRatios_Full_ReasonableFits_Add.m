function [M,S,MSr,MAC,SAC,Sample]=QuantifyACRatios_Full_ReasonableFits_Add(files,M,S,MSr)
%Finds mean and standard deviation of Log A:C ratio of all spots

for i0=1:length(files)
    load(files{i0})
    usedC=SelectReasonableZGaussFits(NSTAms);
    for i=1:length(NSTAms)
        if ~isempty(usedC{i})
            M{i0}=[M{i0} NSTAms(i).int(1)];
            S{i0}=[S{i0} NSTAms(i).sint(1)];
            
            MSr{i0}=[MSr{i0} log(NSTAms(i).int(1)/NSTAms(i).sint)];
        end
    end
    MAC(i0)=mean(MSr{i0});
    SAC(i0)=sqrt(var(MSr{i0}));
    Sample(i0)=length(MSr{i0});

end