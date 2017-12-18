function [AVzSL,AVzRSQ,AVz]=HistAvZMovement(NSTA)

AVzSL=[];
AVzRSQ=[];
AVz=[];
xbins=-40:40;
xbins=xbins/100*.2;
for i=1:length(NSTA)
    used=find(NSTA(i).int>1000);
    if length(used)>10
        y=NSTA(i).st(used);
        x=NSTA(i).frame(used);
        [slope, intercept, rsq]=LinearSlopeInterceptandR2(x,y);
        AVzSL=[AVzSL slope];
        AVzRSQ=[AVzRSQ rsq];
        AVz=[AVz mean(y)];
    end
end
used=find(AVzRSQ>.5);
hist(AVzSL(used),xbins)
figure
scatter(AVz,AVzSL)