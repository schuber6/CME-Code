function [Err,predictions,ErrV]=LRErrorRate(X,y,Theta)

hx = sigmoid(X * Theta)>.5;
predictions=hx;
ErrV=hx~=y;
Err=sum(double(hx~=y))/length(hx);