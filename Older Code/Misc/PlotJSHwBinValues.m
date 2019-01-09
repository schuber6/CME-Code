BinSpace=E(2)-E(1);
subplot(2,3,1)
xbins2=-50:50;
xbins2=xbins2*.085/50;
hist(BeforeMSslope(:,2),xbins2)
hold on
xlim([E(1)-BinSpace E(length(E))+BinSpace])
YL=ylim;
for i=1:length(E)
    line([E(i) E(i)],[YL(1) YL(2)])
end
title('Before Slope Histogram')
%ylim([0 .7])
subplot(2,3,4)
plot(xbins,BMvs)
title('Before Average DNR Signal')
ylim([600 800])
subplot(2,3,2)
hist(DuringMSslope(:,2),xbins2)
hold on
xlim([E(1)-BinSpace E(length(E))+BinSpace])
YL=ylim;
for i=1:length(E)
    line([E(i) E(i)],[YL(1) YL(2)])
end
title('During Slope Histogram')

subplot(2,3,5)
plot(xbins,DMvs)
title('During Average DNR Signal')
ylim([600 800])
subplot(2,3,3)
hist(AfterMSslope(:,2),xbins2)
hold on
xlim([E(1)-BinSpace E(length(E))+BinSpace])
YL=ylim;
for i=1:length(E)
    line([E(i) E(i)],[YL(1) YL(2)])
end
title('After Slope Histogram')

subplot(2,3,6)
plot(xbins,AMvs)
title('After Average DNR Signal')
ylim([600 800])