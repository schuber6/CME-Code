function maxphi=CalculateSphereParameters_ConstantCurvature(Radius,Area)

maxphi=acos(1-Area/(2*pi*Radius^2));