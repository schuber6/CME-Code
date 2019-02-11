Ls=[0 .01 .03 .1 .3 1 3 10];
[X,yBeg,yEnd]=ConstructFeatures_Dist(trainData);
[Xcv,yBegcv,yEndcv]=ConstructFeatures_Dist(CVData);
for i=1:length(Ls)
    lambda=Ls(i);
    Theta=RegLogisticResgression(X,yEnd,lambda);
    [ErrT(i),~]=LRErrorRate(X,yEnd,Theta);
    [ErrCV(i),~]=LRErrorRate(Xcv,yEndcv,Theta);
end
figure
subplot(1,2,1)
plot(ErrT)
hold on
plot(ErrCV)
for i=1:length(Ls)
    lambda=Ls(i);
    Theta=RegLogisticResgression(X,yBeg,lambda);
    [ErrT(i),~]=LRErrorRate(X,yBeg,Theta);
    [ErrCV(i),~]=LRErrorRate(Xcv,yBegcv,Theta);
end
subplot(1,2,2)
plot(ErrT)
hold on
plot(ErrCV)

%%
lambda=.03;
Theta=RegLogisticResgression(X,yEnd,lambda);
[ErrT,~]=LRErrorRate(X,yEnd,Theta);
[ErrCVb,preE,preEV]=LRErrorRate(Xcv,yEndcv,Theta);
ThetaE=Theta;

Theta=RegLogisticResgression(X,yBeg,lambda);
[ErrT,~]=LRErrorRate(X,yBeg,Theta);
[ErrCVe,preB,preBV]=LRErrorRate(Xcv,yBegcv,Theta);
ThetaB=Theta;

[Err,~]=FullErrorRate(preB,preE,[CVData.Decision])

%Error around 30%
