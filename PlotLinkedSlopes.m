BinSpace=E(2)-E(1);
xbins2=-50:50;
xbins2=xbins2*(-E(1)*2)/50;
subplot(1,2,1)
hist(LsI,xbins2);

hold on
%xlim([-.1 .1])
%xlim([E(1)-BinSpace E(length(E))+BinSpace])
YL=ylim;
for i=1:length(E)
    line([E(i) E(i)],[YL(1) YL(2)])
end
%title(strcat('Slope Histogram SD=',num2str(round(sqrt(var(LsI)),4))))

subplot(1,2,2)
% plot(xbins,AMvs)


%ylim([600 800])
% subplot(1,3,3)
clear M
for i=1:length(LsZL)
    M(i)=mean(LsZL{i}*zg);
    SE(i)=sqrt(var(LsZL{i}*zg))/sqrt(length(LsZL{i}));
    N(i)=length(LsZL{i});
end
used=find(N>=20);
errorbar(xbins(used),M(used),SE(used),'Color',CW)
hold on
title('Average Z Velocity (nm/s)')