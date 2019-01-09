function [D,Df]=HistIntDrops(fxyc)

D=[];
Df=cell(1,MaxFrameFXYC(fxyc));
for i=1:length(fxyc(1,1,:))
    used=find(fxyc(:,1,i));
    for i2=1:max(used)-2
        S=fxyc(i2+2,5,i)-fxyc(i2,5,i);
        F=fxyc(i2+1,1,i);
        D=[D S];
        Df{F}=[Df{F} S];
    end
end
xbins=-100:100;
xbins=xbins/100*5000;
H=hist(D,xbins);
for i=1:length(H)
    Hs(i)=H(i);%-H(length(H)-i+1);
end
plot(xbins,Hs)
