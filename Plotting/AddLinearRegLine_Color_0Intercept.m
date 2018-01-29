function AddLinearRegLine_Color_0Intercept(X,Y,C)

XL=xlim;
YL=ylim;
[slope, rsq]=LinearSlopeandR2_0Intercept(X,Y);
intercept=0;
Y1=intercept+slope*XL(1);
Y2=intercept+slope*XL(2);
line(XL,[Y1 Y2],'Color',C)
legend(strcat('Y=',num2str(slope,'%10.3f'),'X+',num2str(intercept,'%10.3f')))
title(strcat('R^2=',num2str(rsq,'%10.3f')))
xlim(XL)
ylim(YL)