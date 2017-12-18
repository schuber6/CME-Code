function PlotLiftingGroups(LsZL,xbins,C)

for i=1:length(LsZL)
    M(i)=mean(LsZL{i}*400);
    SE(i)=sqrt(var(LsZL{i}*400))/sqrt(length(LsZL{i}));
end
errorbar(xbins,M,SE,'Color',C)
ylabel('Average Z Velocity (nm/s)')
xlabel('Intensity Slope')
title('Blue-Pre Osmoshock, Red-Post Osmoshock')
hold on