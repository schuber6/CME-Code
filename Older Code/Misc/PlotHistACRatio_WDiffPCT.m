function PlotHistACRatio_WDiffPCT(NSTAms,NSTAmsOLD,t)

M=[];
S=[];
MSr=[];
MSrOLD=[];
xbins=-2:.4:2;
for i=1:length(NSTAms)
    if NSTAms(i).sclass==0 && NSTAms(i).class==0
    M=[M NSTAms(i).ZGaussX0(1)];
    S=[S NSTAms(i).SZGaussX0(1)];
    
    MSr=[MSr log(NSTAms(i).int(1)/NSTAms(i).sint)];
    end
end
for i=1:length(NSTAmsOLD)
    if NSTAmsOLD(i).sclass==0 && NSTAmsOLD(i).class==0

    
    MSrOLD=[MSrOLD log(NSTAmsOLD(i).int(1)/NSTAmsOLD(i).sint)];
    end
end
%figure

H=hist(MSr,xbins);
Hold=hist(MSrOLD,xbins);
usedH=find(H>=5);
usedHold=find(Hold>=5);
used=intersect(usedH,usedHold);
xbins=xbins(used);
H=H(used);
Hold=Hold(used);
H=H/sum(H);
Hold=Hold/sum(Hold);
plot(xbins,H,'b')
hold on
plot(xbins,(H-Hold)./(H+Hold),'r')
xlim([-2 2])
legend('A:C Ratio Histogram','Percent Change in previous 3 min')
xlabel('log(A:C)')
ylabel('Frequency')
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