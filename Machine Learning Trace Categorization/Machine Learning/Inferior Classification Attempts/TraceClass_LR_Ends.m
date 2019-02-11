Ls=[0 .01 .03 .1 .3 1 3 10];
[XBeg,XEnd,yBeg,yEnd]=ConstructFeatures_Ends(trainData);
[XBegcv,XEndcv,yBegcv,yEndcv]=ConstructFeatures_Ends(CVData);
for i=1:length(Ls)
    lambda=Ls(i);
    Theta=RegLogisticResgression(XEnd,yEnd,lambda);
    [ErrT(i),~]=LRErrorRate(XEnd,yEnd,Theta);
    [ErrCV(i),~]=LRErrorRate(XEndcv,yEndcv,Theta);
end
figure
subplot(1,2,1)
plot(ErrT)
hold on
plot(ErrCV)
for i=1:length(Ls)
    lambda=Ls(i);
    Theta=RegLogisticResgression(XBeg,yBeg,lambda);
    [ErrT(i),~]=LRErrorRate(XBeg,yBeg,Theta);
    [ErrCV(i),~]=LRErrorRate(XBegcv,yBegcv,Theta);
end
subplot(1,2,2)
plot(ErrT)
hold on
plot(ErrCV)