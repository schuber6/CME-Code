function CompareAvTraces_BegAligned_30s_wPrev(fxycMScalm,fxycMSap2)


[InterM,InterS,MSDifs,MMcalm,MScalm,MDcalm]=PlotAvTraces_BeginningAligned_wPrev_BestCorr(fxycMScalm);
close(gcf)
[InterM,InterS,MSDifs,MMap2,MSap2,MDap2]=PlotAvTraces_BeginningAligned_wPrev_BestCorr(fxycMSap2);
close(gcf)
%[Offset1,Stretch1,bestSS,Worked]=FindBestTransform_OverlapFudge(MSap2/max(MSap2),MScalm/max(MScalm));
%x1=1:100;
%x1=(x2-Offset1)*Stretch1;
MSap2=MSap2(1:20);
MScalm=MScalm(1:20);
MMap2=MMap2(1:20);
MMcalm=MMcalm(1:20);
MSap2=(MSap2-min(MSap2))/(max(MSap2)-min(MSap2));
MScalm=(MScalm-min(MScalm))/(max(MScalm)-min(MScalm));
MMap2=(MMap2-min(MMap2))/(max(MMap2)-min(MMap2));
MMcalm=(MMcalm-min(MMcalm))/(max(MMcalm)-min(MMcalm));
[Offset1,Stretch1,bestSS,Worked]=FindBestShift_OverlapFudge(MSap2,MScalm);
t2=-30:3:27;
t1=(-30:3:27)-Offset1*3;
figure
%plot(t1,(MSap2-min(MSap2))/(max(MSap2)-min(MSap2)),'--r')
%hold on
%plot(t2,(MScalm-min(MScalm))/(max(MScalm)-min(MScalm)),'r')
plot(t1,(MMap2-min(MMap2))/(max(MMap2)-min(MMap2)),'r')
plot(t2,(MMcalm-min(MMcalm))/(max(MMcalm)-min(MMcalm)),'g')
%legend('Clathrin from AP2 cells','Clathrin from CALM cells','AP2 from AP2 cells','CALM from CALM cells')
legend('AP2','CALM')
