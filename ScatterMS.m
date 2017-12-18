function [XL,YL,slope,intercept,rsq,M,S,MSr]=ScatterMS(NSTAms,t)

M=[];
S=[];
MSr=[];
for i=1:length(NSTAms)
    if NSTAms(i).sint~=0
    M=[M NSTAms(i).int(1)];
    S=[S NSTAms(i).sint];
    
    MSr=[MSr NSTAms(i).int(1)/NSTAms(i).sint];
    end
end
%figure
used=find(S~=0);
%scatter(M(used),S(used))
%hold on
mdl=LinearModel.fit(M(used),S(used));
plot(mdl)
%display(mdl)
XL=xlim;
YL=ylim;
[slope, intercept, rsq]=LinearSlopeInterceptandR2(M(used),S(used));
title(strcat('Minutes From Osmo=',num2str(t),' slope=',num2str(slope,4),' intercept=',num2str(intercept,4)))
xlabel('CALM Intensity')
ylabel('CLCa Intensity')