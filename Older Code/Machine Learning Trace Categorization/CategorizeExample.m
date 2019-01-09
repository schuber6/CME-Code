function C=CategorizeExample(X)

load('190107_LRThetas.mat')
X(2)=X(2)/LN;
X(3:end)=X(3:end)/AN;
SB=sigmoid(ThetaB.'*X.')>.5;
SE=sigmoid(ThetaE.'*X.')>.5;
C=CombinedCategory(SB,SE);