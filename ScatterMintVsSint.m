function ScatterMintVsSint(NSTAms,t)

M=[];
S=[];
MSr=[];
for i=1:length(NSTAms)
    if NSTAms(i).sclass==0 && NSTAms(i).class==0
    M=[M log(NSTAms(i).int(1))];
    S=[S log(NSTAms(i).sint(1))];
    
    MSr=[MSr log(NSTAms(i).int(1)/NSTAms(i).sint)];
    end
end
%figure
used=find(S);
FP=median(M(used));
MMS=median(MSr(used));
hexscatter(S(used).',M(used).','xlim',[0 5000],'ylim',[0 5000])
xlim([0 5000])
ylim([0 5000])
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