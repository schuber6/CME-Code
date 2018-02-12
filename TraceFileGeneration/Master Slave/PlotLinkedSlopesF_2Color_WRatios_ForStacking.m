function PlotLinkedSlopesF_2Color_WRatios_ForStacking(LsI,LinkedCellG,LinkedCellR,LinkedCellRatio,Pre)

xbins=-2:2;
xbins=xbins*.04/2;
E=[mean([xbins(1) xbins(2)]) mean([xbins(2) xbins(3)]) mean([xbins(3) xbins(4)]) mean([xbins(4) xbins(5)])];
BinSpace=E(2)-E(1);
xbins2=-10:10;
xbins2=xbins2*.11/10;

H=hist(LsI,xbins2);
if Pre
    subplot(2,3,1)
    plot(xbins2,H/length(LsI),'LineStyle','--','Color','b')
    title(strcat('Before SD=',num2str(round(sqrt(var(LsI)),4))))
    
else
    subplot(2,3,4)
    plot(xbins2,H/length(LsI),'Color','b')
    title(strcat('After SD=',num2str(round(sqrt(var(LsI)),4))))
end
hold on
xlim([-.1 .1])
%xlim([E(1)-BinSpace E(length(E))+BinSpace])
YL=ylim;
for i=1:length(E)
    line([E(i) E(i)],[YL(1) YL(2)])
end


subplot(1,3,2)
% plot(xbins,AMvs)


%ylim([600 800])
% subplot(1,3,3)
clear M
for i=1:length(LinkedCellG)
    M(i)=median(LinkedCellG{i});
    SE(i)=sqrt(var(LinkedCellG{i}))/sqrt(length(LinkedCellG{i}));
end
if Pre
    errorbar(xbins,M,SE,'Color','g','LineStyle','--')
else
    errorbar(xbins,M,SE,'Color','g')
end
hold on
for i=1:length(LinkedCellR)
    M(i)=median(LinkedCellR{i});
    SE(i)=sqrt(var(LinkedCellR{i}))/sqrt(length(LinkedCellR{i}));
end
if Pre
    errorbar(xbins,M,SE,'Color','r','LineStyle','--')
else
    errorbar(xbins,M,SE,'Color','r')
end
hold on
title('Median Intensity (AU)')
legend('AP2','CLTA')
%ylim([600 1500])
subplot(1,3,3)
for i=1:length(LinkedCellRatio)
    M(i)=median(LinkedCellRatio{i});
    SE(i)=sqrt(var(LinkedCellRatio{i}))/sqrt(length(LinkedCellRatio{i}));
end
if Pre
    errorbar(xbins,M,SE,'Color','k','LineStyle','--')
else
    errorbar(xbins,M,SE,'Color','k')
end
hold on
title('AP2:CLTA Ratio')
%ylim([1 2])