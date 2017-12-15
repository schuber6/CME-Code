function CompareAvTraces_BegAligned(fxycMScalm,fxycMSap2)

[InterM,InterS,MSDifs,MMcalm,MScalm,MDcalm]=PlotAvTraces_BeginningAligned(fxycMScalm);
close
[InterM,InterS,MSDifs,MMap2,MSap2,MDap2]=PlotAvTraces_BeginningAligned(fxycMSap2);
close
%[Offset1,Stretch1,bestSS,Worked]=FindBestTransform_OverlapFudge(MSap2/max(MSap2),MScalm/max(MScalm));
%x1=1:100;
%x1=(x2-Offset1)*Stretch1;
figure
plot(MSap2/max(MSap2),'--r')
hold on
plot(MScalm/max(MScalm),'r')
plot(MMap2/max(MMap2),'--g')
plot(MMcalm/max(MMcalm),'g')
legend('Clathrin from AP2 cells','Clathrin from CALM cells','AP2 from AP2 cells','CALM from CALM cells')
