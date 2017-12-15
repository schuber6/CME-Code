function [slope,rsq]=FitLinearNoIntercept(x,y)

dlm = fitlm(x,y,'Intercept',false);
slope=table2array(dlm.Coefficients(1,1));
rsq=struct2array(dlm.Rsquared);
rsq=rsq(1);