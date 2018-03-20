L=length(FXYCMS);
Am=zeros(1,L);
As=zeros(1,L);
Bm=zeros(1,L);
Bs=zeros(1,L);
rsqm=zeros(1,L);
rsqs=zeros(1,L);

for i=1:length(FXYCMS)
    x=FXYCMS{i}(:,1);
    ym=FXYCMS{i}(:,6);
    ys=FXYCMS{i}(:,7);
    used=~isnan(x);
    x=x(used);
    ym=ym(used);
    ys=ys(used);
    [Am(i),Bm(i),rsqm(i)]=ExponentialFit(x,ym);
    [As(i),Bs(i),rsqs(i)]=ExponentialFit(x,ys);
end