
[Mslopes{1},Sslopes{1}]=FindAllJoshSlopes_InRange(FXYCMS,1:100,2500);
[Mslopes{2},Sslopes{2}]=FindAllJoshSlopes_InRange(FXYCMS,120:220,2500);
figure
subplot(1,2,1)
[HM1,xbinsM]=hist(Mslopes{1},100);
HM2=hist(Mslopes{2},xbinsM);
plot(xbinsM,HM1,'g')
hold on
plot(xbinsM,HM2,'r')
subplot(1,2,2)
[HS1,xbinsS]=hist(Sslopes{1},100);
HS2=hist(Sslopes{2},xbinsS);
plot(xbinsS,HS1,'g')
hold on
plot(xbinsS,HS2,'r')

%%

sqrt(var(Mslopes{1}))
sqrt(var(Mslopes{2}))
sqrt(var(Sslopes{1}))
sqrt(var(Sslopes{2}))
