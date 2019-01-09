function [slope, rsq]=LinearSlopeandR2_0Intercept(x,y) %Gives you the slope and R^2 value for the data x,y


slope=y/x;

p(2)=0;
p(1)=slope;
yfit = polyval(p,x);
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid/SStotal;