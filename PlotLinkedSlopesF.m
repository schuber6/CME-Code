function PlotLinkedSlopesF(LsI,LinkedCell)

xbins=-2:2;
xbins=xbins*.04/2;
E=[mean([xbins(1) xbins(2)]) mean([xbins(2) xbins(3)]) mean([xbins(3) xbins(4)]) mean([xbins(4) xbins(5)])];
BinSpace=E(2)-E(1);
xbins2=-10:10;
xbins2=xbins2*.11/10;
subplot(1,2,1)
hist(LsI,xbins2)
hold on
xlim([-.1 .1])
%xlim([E(1)-BinSpace E(length(E))+BinSpace])
YL=ylim;
for i=1:length(E)
    line([E(i) E(i)],[YL(1) YL(2)])
end
title(strcat('Slope Histogram SD=',num2str(round(sqrt(var(LsI)),4))))

subplot(1,2,2)
% plot(xbins,AMvs)


%ylim([600 800])
% subplot(1,3,3)
clear M
for i=1:length(LinkedCell)
    M(i)=median(LinkedCell{i});
    SE(i)=sqrt(var(LinkedCell{i}))/sqrt(length(LinkedCell{i}));
end
errorbar(xbins,M,SE)
hold on
title('AP2:CLTA Ratio')
%ylim([750 1400])
