function [A,x0,s]=FitAndPlotGaussian(x,y)

try
f = fit(x.',y.','gauss1');
Pars=coeffvalues(f);
catch
    Pars=[0 1 1];
end
w=[Pars(2) Pars(1) Pars(3)/sqrt(2)];
z = Gaussian( w, x.' );
plot(x,z,'r')
A=w(2);
x0=w(1);
s=w(3);