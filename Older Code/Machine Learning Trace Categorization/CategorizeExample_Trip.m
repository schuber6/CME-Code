function C=CategorizeExample_Trip(X)

load('190107_LRThetas_Trip.mat')
X(2)=X(2)/LN;
X(3:end)=X(3:end)/AN;
for i=1:3
    S(i)=sigmoid(Theta{i}.'*X.');
end
if max(S)<.5
    C=4;
else
u=find(S==max(S));
C=u(1);
end