function CompareAvTraces_BegAligned_30s_wPrev_MultiMovie(fxycMScalm,fxycMSap2)

for i=1:length(fxycMScalm)
    [InterM,InterS,MSDifs,MMcalms(i,:),MScalms(i,:),MDcalm]=PlotAvTraces_BeginningAligned_wPrev_BestCorr(fxycMScalm{i});
    close(gcf)
end
for i=1:length(fxycMSap2)
    [InterM,InterS,MSDifs,MMap2s(i,:),MSap2s(i,:),MDap2]=PlotAvTraces_BeginningAligned_wPrev_BestCorr(fxycMSap2{i});
    close(gcf)
end
for i=1:length(MMcalms(1,:))
    MMcalm(i)=mean(MMcalms(:,i));
    MScalm(i)=mean(MScalms(:,i));
end
for i=1:length(MMap2s(1,:))
    MMap2(i)=mean(MMap2s(:,i));
    MSap2(i)=mean(MSap2s(:,i));
end
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
hold on
plot(t2,(MMcalm-min(MMcalm))/(max(MMcalm)-min(MMcalm)),'g')
plot(t1,(MSap2-min(MSap2))/(max(MSap2)-min(MSap2)),'--r')
hold on
plot(t2,(MScalm-min(MScalm))/(max(MScalm)-min(MScalm)),'--g')
legend('AP2 from AP2 cells','CALM from CALM cells','Clathrin from AP2 cells','Clathrin from CALM cells')
%legend('AP2','CALM')
