function PlotHistACRatio(NSTAms,t)

M=[];
S=[];
MSr=[];
xbins=-2:.15:2;
for i=1:length(NSTAms)
    if NSTAms(i).sclass==0 && NSTAms(i).class==0
    M=[M NSTAms(i).ZGaussX0(1)];
    S=[S NSTAms(i).SZGaussX0(1)];
    
    MSr=[MSr log(NSTAms(i).int(1)/NSTAms(i).sint)];
    end
end
%figure

H=hist(MSr,xbins);
plot(xbins,H/sum(H))
hold on
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