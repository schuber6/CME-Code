function [A,B,rsq]=ExponentialFit(x,y) %Gives you the slope and R^2 value for the data x,y
%Fits to y=A*exp(B*x)

f = fit(x,y,'exp1');
p=coeffvalues(f);
A=p(1);
B=p(2);
for i=1:length(x)
    yfit(i) = A*exp(B*x(i));
end
yresid = y - yfit.';
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid/SStotal;