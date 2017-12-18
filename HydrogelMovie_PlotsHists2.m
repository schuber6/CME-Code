i=7;
file='E:\CME Superfolder\CME Data\Hydrogel\movies\24hr_glass_cell1\orig_movies\Stack_1.mat';
load(file)
FrameGap=3;
slopes=TabulateAllSlopesFXYC(Threshfxyc,FrameGap,Thresh);
lifetimes=TabulateAllLifetimesFXYC(Threshfxyc,FrameGap);
LT(5)=mean(lifetimes);
M(5)=mean(slopes);
SD(5)=sqrt(var(slopes));
subplot(1,2,1)
hist(slopes,xbins)
xlim([-.05 .05])
title(strcat('Slope Histogram: SD=',num2str(SD(i))))
subplot(1,2,2)
hist(lifetimes,ltbins)
xlim([0 150])
title(strcat('Lifetime Histogram: Mean=',num2str(LT(i))))
YL=ylim;
text(-60,YL(2)*1.05,'Substrate: Glass, Incubation Time: 24 hrs')