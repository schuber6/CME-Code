L=length(FXYCMS);
Am=zeros(1,L);
As=zeros(1,L);
Bm=zeros(1,L);
Bs=zeros(1,L);
rsqm=zeros(1,L);
rsqs=zeros(1,L);
h=waitbar(0,'exp fitting');
for i=1:length(FXYCMS)
    waitbar(i/L)
    x=FXYCMS{i}(:,1);
    ym=FXYCMS{i}(:,6);
    ys=FXYCMS{i}(:,7);
    used=find(~isnan(x) & ym>0 & ys>0);
    x=double(x(used));
    ym=double(ym(used));
    ys=double(ys(used));
    [Am(i),Bm(i),rsqm(i)]=ExponentialFit(x,ym);
    [As(i),Bs(i),rsqs(i)]=ExponentialFit(x,ys);
end
close(h)