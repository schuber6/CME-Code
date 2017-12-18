function HistLifterMeds(LifterMed,SinkerMed,FlatMed)
xbins=1:100;
xbins=xbins/100*max(LifterMed);
figure
H=hist(LifterMed,xbins);
plot(xbins,H,'g')
hold on
H=hist(SinkerMed,xbins);
plot(xbins,H,'r')
H=hist(FlatMed,xbins);
plot(xbins,H,'b')