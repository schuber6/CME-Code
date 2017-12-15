function CompareAvTraces_BegAligned_30s(fxycMScalm,fxycMSap2)

[InterM,InterS,MSDifs,MMcalm,MScalm,MDcalm]=PlotAvTraces_BeginningAligned(fxycMScalm);
close
[InterM,InterS,MSDifs,MMap2,MSap2,MDap2]=PlotAvTraces_BeginningAligned(fxycMSap2);
close
%[Offset1,Stretch1,bestSS,Worked]=FindBestTransform_OverlapFudge(MSap2/max(MSap2),MScalm/max(MScalm));
%x1=1:100;
%x1=(x2-Offset1)*Stretch1;
MSap2=MSap2(1:10);
MScalm=MScalm(1:10);
MMap2=MMap2(1:10);
MMcalm=MMcalm(1:10);
t=0:3:27;
figure
plot(t,(MSap2-min(MSap2))/(max(MSap2)-min(MSap2)),'--r')
hold on
plot(t,(MScalm-min(MScalm))/(max(MScalm)-min(MScalm)),'r')
plot(t,(MMap2-min(MMap2))/(max(MMap2)-min(MMap2)),'--g')
plot(t,(MMcalm-min(MMcalm))/(max(MMcalm)-min(MMcalm)),'g')
legend('Clathrin from AP2 cells','Clathrin from CALM cells','AP2 from AP2 cells','CALM from CALM cells')
