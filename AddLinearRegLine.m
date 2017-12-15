function AddLinearRegLine(X,Y)

XL=xlim;
YL=ylim;
[slope, intercept, rsq]=LinearSlopeInterceptandR2(X,Y);

Y1=intercept+slope*XL(1);
Y2=intercept+slope*XL(2);
line(XL,[Y1 Y2])
legend(strcat('Y=',num2str(slope,'%10.3f'),'X+',num2str(intercept,'%10.3f')))
title(strcat('R^2=',num2str(rsq,'%10.3f')))
xlim(XL)
ylim(YL)