function [slope,intercept,rsq]=ScatterWithLR_pars(X,Y,hex)

if hex
    hexscatter(X,Y)
else
    scatter(X,Y)
end
hold on
[slope, intercept, rsq]=LinearSlopeInterceptandR2(X,Y);
XL=xlim;
YL=ylim;
Y1=intercept+slope*XL(1);
Y2=intercept+slope*XL(2);
line(XL,[Y1 Y2])
legend(strcat('Y=',num2str(slope,'%10.3e'),'X+',num2str(intercept,'%10.3e')))
title(strcat('R^2=',num2str(rsq,'%10.3e')))
xlim(XL)
ylim(YL)