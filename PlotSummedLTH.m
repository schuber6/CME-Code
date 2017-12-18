xbins=1:50;
xbins=xbins*500/50;
LTsB=[];
LTsA=[];
[A,B]=size(LTs);
for i=1:A
    LTsB=[LTsB LTs{i,1}];
    LTsA=[LTsA LTs{i,2}];
end
HB=hist(LTsB,xbins);
HA=hist(LTsA,xbins);
plot(xbins,HB/sum(HB),'b')
hold on
plot(xbins,HA/sum(HA),'r')
