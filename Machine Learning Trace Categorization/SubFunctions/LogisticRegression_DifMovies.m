clear
load('MLData_190212.mat')
clear ErrTb ErrCVb ErrTe ErrCVe
%lambda=10;
%Ls=[0 .01 .03 .1 .3 1 3 10 30 100];
Ls=.03;
%NBins=10:10:50;
NBins=20;
ind=1;
for i0=1:length(Ls)
    lambda=Ls(i0);
for i=1:length(NBins)
    [X,yBeg,yEnd]=ConstructFeatures_SAV_DifMovs(DataTrain,NBins(i),0);
    [Xcv,yBegcv,yEndcv]=ConstructFeatures_SAV_DifMovs(DataVal,NBins(i),0);
    Theta=RegLogisticResgression(X,yEnd,lambda);
    [ErrTe(i),preTE,ErrVTe]=LRErrorRate(X,yEnd,Theta);
    [ErrCVe(i),preE,preEV]=LRErrorRate(Xcv,yEndcv,Theta);
    ThetaE=Theta;
    
    Theta=RegLogisticResgression(X,yBeg,lambda);
    [ErrTb(i),preTB,ErrVTb]=LRErrorRate(X,yBeg,Theta);
    [ErrCVb(i),preB,preBV]=LRErrorRate(Xcv,yBegcv,Theta);
    ThetaB=Theta;
    
    [Err(ind,1),~]=FullErrorRate(preB,preE,[DataVal.Dec]);
    Err(ind,2)=lambda;
    Err(ind,3)=NBins(i);
    ind=ind+1;
end
end


Err   %Classification accuracy

Te=ThetaE;
Tb=ThetaB;

%%
[X,yBeg,yEnd]=ConstructFeatures_SAV_DifMovs(DataTest,20,0);
ML=CategorizeExample_new(X);
mean([DataTest.Dec]==ML)