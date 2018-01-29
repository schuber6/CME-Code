xbins=-600:12:600;
figure

SDbef=sqrt(var(JFbef));
H=hist(JFbef,xbins);
plot(xbins/SDbef,H/sum(H)*SDbef,'g')
hold on

H2=hist(JFaft,xbins);
plot(xbins/SDbef,H2/sum(H2)*SDbef,'r')
xlim([-3 3])


SDc=sqrt(var(JFc));
H=hist(JFc,xbins);
plot(xbins/SDc,H/sum(H)*SDc,'g--')
hold on

H2=hist(JFo,xbins);
plot(xbins/SDc,H2/sum(H2)*SDc,'r--')
xlim([-3 3])

legend('AP2 before osmoshock','AP2 after osmoshock','CALM before osmoshock','CALM after osmoshock')
