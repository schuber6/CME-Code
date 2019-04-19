function [Radius,maxphi]=CalculateSphereParameters(FinalRadius,Progress)

Radius=FinalRadius/Progress;
maxphi=acos(1-2*Progress^2);