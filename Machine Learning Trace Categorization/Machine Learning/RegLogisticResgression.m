function Theta=RegLogisticResgression(X,Y,lambda)

iT=zeros(length(X(1,:)),1);
options = optimoptions('fminunc','SpecifyObjectiveGradient',true);
Theta=fminunc(@(theta)costFunctionReg(theta,X,Y,lambda),iT,options);