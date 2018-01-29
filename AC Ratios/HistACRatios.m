function HistACRatios(files)
%Finds mean and standard deviation of Log A:C ratio of all spots
xbins=-3:.3:1;
figure
for i0=1:5 %length(files)
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
    H=hist(MSr,xbins);
    plot(xbins,H/sum(H),'Color',[i0/5 1.2-i0/5 0])
    hold on
    
end