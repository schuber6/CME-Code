
for i=1:planes-1
    H0i=find(H(:,i)>0 & H(:,i)<Inf);
    H0=H(H0i,i);
    xbins=-100:100;
    xbins=xbins/20;
    xbins=2.^(xbins);
    A=hist(H0,xbins);
    A(1)=0;
    A(201)=0;
    plot(log2(xbins),A,'Color',[1-i/planes,i/planes 0]);
    hold on
    Means(i)=mean(A);
    stds(i)=sqrt(var(A));
end