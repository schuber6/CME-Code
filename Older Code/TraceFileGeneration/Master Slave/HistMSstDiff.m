function HistMSstDiff(NSTAms,t)

M=[];
S=[];
MSr=[];
xbins=-2:.05:2;
for i=1:length(NSTAms)
    if NSTAms(i).sclass==0 && NSTAms(i).class==0
    M=[M NSTAms(i).st(1)];
    S=[S NSTAms(i).sst(1)];
    
    %MSr=[MSr NSTAms(i).int(1)/NSTAms(i).sint];
    end
end
%figure

hist(M-S,xbins)
xlim([-2 2])
%hold on
%mdl=LinearModel.fit(M(used),S(used));
%plot(mdl)
%display(mdl)
XL=xlim;
YL=ylim;
%[slope, intercept, rsq]=LinearSlopeInterceptandR2(M(used),S(used));
title(strcat('Minutes From Osmo=',num2str(t)))
% xlabel('CALM Z Pos')
% ylabel('CLCa Z Pos')