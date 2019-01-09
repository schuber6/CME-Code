function CompareAvTraces_FixedSlave(fxycMScalm,fxycMSap2)

[InterM,InterS,MSDifs,MMcalm,MScalm,MDcalm]=PlotAvTraces_BothAligned_Interp(fxycMScalm,0,0,0,0);
close
[InterM,InterS,MSDifs,MMap2,MSap2,MDap2]=PlotAvTraces_BothAligned_Interp(fxycMSap2,0,0,0,0);
close
[Offset1,Stretch1,bestSS,Worked]=FindBestTransform_OverlapFudge(MSap2/max(MSap2),MScalm/max(MScalm));
x2=0:100;
x1=(x2-Offset1)*Stretch1;
figure
plot(x1,MSap2/max(MSap2),'--r')
hold on
plot(x2,MScalm/max(MScalm),'r')
plot(x1,MMap2/max(MMap2),'--g')
plot(x2,MMcalm/max(MMcalm),'g')
legend('Clathrin from AP2 cells','Clathrin from CALM cells','AP2 from AP2 cells','CALM from CALM cells')
