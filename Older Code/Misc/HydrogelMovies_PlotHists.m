i=4;
Thresh=400;
FrameGap=[5 7 4 7 4 4 3];
xbins=-50:50;
xbins=xbins*.055/50;
ltbins=1:50;
ltbins=ltbins*FrameGap(i);

slopes=TabulateAllSlopes(nsta{i});
lifetimes=TabulateAllLifetimes(nsta{i});
lifetimes=lifetimes*FrameGap(i);
M(i)=mean(slopes);
SD(i)=sqrt(var(slopes));
LT(i)=mean(lifetimes);

subplot(1,2,1)
hist(slopes,xbins)
xlim([-.05 .05])
title(strcat('Slope Histogram: SD=',num2str(SD(i))))
subplot(1,2,2)
hist(lifetimes,ltbins)
xlim([0 150])
title(strcat('Lifetime Histogram: Mean=',num2str(LT(i))))
YL=ylim;
text(-60,YL(2)*1.05,'Substrate: Soft Hydrogel, Incubation Time: 265 hrs')
