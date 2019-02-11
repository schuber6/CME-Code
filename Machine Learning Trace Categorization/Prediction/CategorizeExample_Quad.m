function C=CategorizeExample_Quad(X)

load('190107_LRThetas_Quad.mat')
X(2)=X(2)/LN;
X(3:end)=X(3:end)/AN;
for i=1:4
    S(i)=sigmoid(Theta{i}.'*X.');
end
u=find(S==max(S));
C=u(1);