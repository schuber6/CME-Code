function CompareAvTraces_EndAligned_MaxDecrease(fxycMScalm,fxycMSap2)

[InterM,InterS,MSDifs,MMcalm,MScalm,MDcalm]=PlotAvTraces_EndAligned_MaxDecrease(fxycMScalm);
close
[InterM,InterS,MSDifs,MMap2,MSap2,MDap2]=PlotAvTraces_EndAligned_MaxDecrease(fxycMSap2);
close
%[Offset1,Stretch1,bestSS,Worked]=FindBestTransform_OverlapFudge(MSap2/max(MSap2),MScalm/max(MScalm));
%x1=1:100;
%x1=(x2-Offset1)*Stretch1;
t=-30:3:30;
figure
%plot(t,MSap2,'--r')
%hold on
%plot(t,MScalm,'r')
plot(t,MMap2,'r')
hold on
plot(t,MMcalm,'g')
%legend('Clathrin from AP2 cells','Clathrin from CALM cells','AP2 from AP2 cells','CALM from CALM cells')
legend('AP2','CALM')
xlim([-30 20])
