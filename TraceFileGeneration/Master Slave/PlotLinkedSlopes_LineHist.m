BinSpace=E(2)-E(1);
xbins2=-50:50;
xbins2=xbins2*.11/50;
subplot(1,2,1)
H=hist(LsI,xbins2);
plot(xbins2,H,'Color',CW)
hold on
%xlim([-.1 .1])
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
for i=1:length(LsZL)
    M(i)=mean(LsZL{i}*zg*3/fg);
    SE(i)=sqrt(var(LsZL{i}*zg*3/fg))/sqrt(length(LsZL{i}));
    N(i)=length(LsZL{i});
    LsZL{i}=LsZL{i}*zg*3/fg;
end
used=find(N>=20);
errorbar(xbins(used),M(used),SE(used),'Color',CW)
hold on
title('Average Z Velocity (nm/s)')
DataCK{1}=xbins2;
DataCK{2}=H;
DataCK{3}=M;
DataCK{4}=SE;
DataCK{5}=N;
DataCK{6}=xbins;