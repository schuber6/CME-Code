function [NData,Data]=QuantifyACInts(files)
%Finds mean and standard deviation of Log A:C ratio of all spots

figure
Data=[];
for i0=1:length(files)
    load(files{i0})
    M=[];
    S=[];
    MSr=[];
    for i=1:length(NSTAms)
        if NSTAms(i).sclass==0 && NSTAms(i).class==0
            M=[M NSTAms(i).int(1)];
            S=[S NSTAms(i).sint(1)];
            
            MSr=[MSr log(NSTAms(i).int(1)/NSTAms(i).sint)];
        end
    end
    MAC(i0)=mean(MSr);
    SAC(i0)=sqrt(var(MSr));
    for i=1:length(S)
        Data=[Data ; [S(i) i0]];
    end
end
boxplot(Data(:,1),Data(:,2))
ylim([0 15000])
NData=[Data(:,1)/median(Data(:,1)) Data(:,2)];