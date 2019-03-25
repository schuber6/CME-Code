function C=CategorizeExample(X,framegap,MedI)

%load('190107_LRThetas.mat')
%load('190107_LRThetas_NBins10.mat')
load('190204_LRThetas_NBins10_B3.mat','ThetaB','ThetaE')
%[a,~]=size(Xv);

LN=60/framegap;
AN=MedI;
X(:,2)=X(:,2)/LN;
X(:,3:end)=X(:,3:end)/AN;

SB=sigmoid(ThetaB.'*X.')>.5;
SE=sigmoid(ThetaE.'*X.')>.5;

C=CombinedCategory(SB,SE);