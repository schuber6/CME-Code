function SpotsPerAreaPlot(fileswt,filessi,Area_WT,Area_SI)

FrameGap=2;
MaxFrame=151;
Tmast=3000;
Tslave=0;
MinLTF=30/FrameGap;

for i0=1:length(fileswt)
    load(fileswt{i0});
    [Ncwt(i0)]=CountSpotsPerFrame(FXYCMS,Tmast,MinLTF);
    Ncwt(i0)=Ncwt(i0)/Area_WT(i0);
end
Navc(1)=mean(Ncwt);

for i0=1:length(filessi)
    load(filessi{i0});
    [Ncsi(i0)]=CountSpotsPerFrame(FXYCMS,Tmast,MinLTF);
    Ncsi(i0)=Ncsi(i0)/Area_SI(i0);
end
Navc(2)=mean(Ncsi);


% figure
% bar([Niwt.' Ncwt.']/5)
% figure
Obj=bar([Navc.']/5);
%L={'0-45s Pits','45-90s Pits','90-135s Pits','Stalled Structures'};
%legend(fliplr(Obj),fliplr(L));
ylabel('Average Concurrent Spots/um^2')
%ylim([0 1])
xticklabels({'WT','SI'})