xbins=1:50;
xbins=xbins*6;
LTsB=FindLifetimesinRange(NSTA,0,100,3);
LTsA=FindLifetimesinRange(NSTA,150,250,3);
HB=hist(LTsB,xbins);

HA=hist(LTsA,xbins);

plot(xbins,HB/sum(HB),'b')
hold on
plot(xbins,HA/sum(HA),'r')