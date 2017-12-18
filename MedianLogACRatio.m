function MMS=MedianLogACRatio(NSTAms)

M=[];
S=[];
MSr=[];
for i=1:length(NSTAms)
    if NSTAms(i).sclass==0 && NSTAms(i).class==0
    M=[M NSTAms(i).ZGaussX0(1)];
    S=[S NSTAms(i).sint(1)];
    
    MSr=[MSr log(NSTAms(i).int(1)/NSTAms(i).sint)];
    end
end
%figure
used=find(S);
FP=median(M(used));
MMS=median(MSr(used));
