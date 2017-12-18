function ScatterMstVsA_Gauss(NSTAms,t)

M=[];
S=[];
MSr=[];
for i=1:length(NSTAms)
    if NSTAms(i).sclass==0 && NSTAms(i).class==0
    M=[M NSTAms(i).ZGaussX0(1)];
    S=[S NSTAms(i).sint(1)];
    
    MSr=[MSr NSTAms(i).int];
    end
end
%figure
used=find(S);
FP=median(M(used));
MMS=median(MSr(used));
hexscatter(M(used).',MSr(used).','xlim',[FP-1 FP+1])
xlim([FP-1 FP+1])
%ylim([MMS-2 MMS+2])
%hold on
%mdl=LinearModel.fit(M(used),S(used));
%plot(mdl)
%display(mdl)
XL=xlim;
YL=ylim;
%[slope, intercept, rsq]=LinearSlopeInterceptandR2(M(used),S(used));
title(strcat('Minutes From Osmo=',num2str(t)))
xlabel('CALM Z Pos')
ylabel('log(A:C Ratio)')