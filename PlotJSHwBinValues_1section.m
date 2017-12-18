BinSpace=E(2)-E(1);
xbins2=-50:50;
xbins2=xbins2*.11/50;
subplot(1,2,1)
hist(AfterMSslope(:,1),xbins2)
hold on
xlim([-.1 .1])
%xlim([E(1)-BinSpace E(length(E))+BinSpace])
YL=ylim;
for i=1:length(E)
    line([E(i) E(i)],[YL(1) YL(2)])
end
title(strcat('Slope Histogram SD=',num2str(round(sqrt(var(AfterMSslope(:,1))),4))))

subplot(1,2,2)
% plot(xbins,AMvs)
title('Average DNR Signal')

%ylim([600 800])
% subplot(1,3,3)
clear M
for i=1:length(AMvL)
    M(i)=mean(AMvL{i});
    SE(i)=sqrt(var(AMvL{i}))/sqrt(length(AMvL{i}));
end
errorbar(xbins,M,SE)