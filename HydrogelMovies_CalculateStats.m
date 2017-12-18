Thresh=400;
FrameGap=[5 7 4 7 4 4 3];
for i=1:4
    slopes=TabulateAllSlopes(nsta{i});
    lifetimes=TabulateAllLifetimes(nsta{i});
    M(i)=mean(slopes);
    SD(i)=sqrt(var(slopes));
    LT(i)=mean(lifetimes)*FrameGap(i);
end
file='E:\CME Superfolder\CME Data\Hydrogel\movies\u373_125kpa_cell2\orig_movies\Stack_1.mat';
load(file)
FrameGap=4;
slopes=TabulateAllSlopesFXYC(Threshfxyc,FrameGap,Thresh);
lifetimes=TabulateAllLifetimesFXYC(Threshfxyc,FrameGap);
LT(5)=mean(lifetimes);
M(5)=mean(slopes);
SD(5)=sqrt(var(slopes));
file='E:\CME Superfolder\CME Data\Hydrogel\movies\u373_125kpa_cell4\orig_movies\Stack_1.mat';
load(file)
FrameGap=4;
slopes=TabulateAllSlopesFXYC(Threshfxyc,FrameGap,Thresh);
lifetimes=TabulateAllLifetimesFXYC(Threshfxyc,FrameGap);
LT(6)=mean(lifetimes);
M(6)=mean(slopes);
SD(6)=sqrt(var(slopes));
file='E:\CME Superfolder\CME Data\Hydrogel\movies\24hr_glass_cell1\orig_movies\Stack_1.mat';
load(file)
FrameGap=3;
slopes=TabulateAllSlopesFXYC(Threshfxyc,FrameGap,Thresh);
lifetimes=TabulateAllLifetimesFXYC(Threshfxyc,FrameGap);
LT(7)=mean(lifetimes);
M(7)=mean(slopes);
SD(7)=sqrt(var(slopes));