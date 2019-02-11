mu=0;
sigma=1;
for i=1:1000
r(i) = normrnd(mu,sigma);
end
figure
hist(r)

%%

mu=0;
sigma=1;
r=[];
for iN=1:200
    for i=1:1000
        r(iN,i) = normrnd(mu,sigma);
    end
end
A=zeros(200,21);
for i=0:5:100
    A(:,(i)/5+1)=prctile(r,i,2);
end

%%

figure
notBoxPlot(A)
SDs=std(A);
figure
bar(SDs)