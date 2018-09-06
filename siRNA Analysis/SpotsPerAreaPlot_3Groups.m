function SpotsPerAreaPlot_3Groups(fileswt,filessi,filesdsi,Area_WT,Area_SI,Area_DSI)

FrameGap=2;
MaxFrame=151;
Tmast=10000;
Tslave=0;
MinLTF=30/FrameGap;

for i0=1:length(fileswt)
    load(fileswt{i0});
    [Ncwt(i0)]=CountSpotsPerFrame(FXYCMS,Tmast,MinLTF);
    Ncwt(i0)=Ncwt(i0)/Area_WT(i0);
end
Navc(1)=mean(Ncwt);
Navsd(1)=sqrt(var(Ncwt))/sqrt(length(Ncwt));

for i0=1:length(filessi)
    load(filessi{i0});
    [Ncsi(i0)]=CountSpotsPerFrame(FXYCMS,Tmast,MinLTF);
    Ncsi(i0)=Ncsi(i0)/Area_SI(i0);
end
Navc(2)=mean(Ncsi);
Navsd(2)=sqrt(var(Ncsi))/sqrt(length(Ncsi));

for i0=1:length(filesdsi)
    load(filesdsi{i0});
    [Ncdsi(i0)]=CountSpotsPerFrame(FXYCMS,Tmast,MinLTF);
    Ncdsi(i0)=Ncdsi(i0)/Area_DSI(i0);
end
Navc(3)=mean(Ncdsi);
Navsd(3)=sqrt(var(Ncdsi))/sqrt(length(Ncdsi));


figure
bar([Ncwt 0 Ncsi 0 Ncdsi]/5)
figure
Obj=bar([Navc.']/5);
hold on
errorbar([1 2 3],Navc/5,Navsd/5,'.')
%L={'0-45s Pits','45-90s Pits','90-135s Pits','Stalled Structures'};
%legend(fliplr(Obj),fliplr(L));
ylabel('Average Concurrent Spots/um^2','FontSize',16)
%ylim([0 1])
xticklabels({'Control','siRNA 1','siRNA 2'})
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',12)