clear all
file='E:\CME Superfolder\CME Data\170816_LifeactCyclo\cyclo008_AP2_BS.tif';
fileNSTA='E:\CME Superfolder\CME Data\170816_LifeactCyclo\BSC_3DCyclo_2Colorcyclo008_AP2_BS_MasterSlaveFast_v3.mat';
fileSlave='E:\CME Superfolder\CME Data\170816_LifeactCyclo\cyclo008_Lifeact_BS.tif';
load(fileNSTA)
 [AS]=GenerateAverageStructure(NSTAgood,file,7,400);
 figure
 surf(AS)
 %title('AP2')
 [back,SNR,GWx,GWy]=AverageStructSNRandGWidth(AS);
    title(strcat('AP2: ',', SNR: ', num2str(SNR),', GW: ',num2str(GWx),', ',num2str(GWy)))
 [AS]=GenerateAverageStructure(NSTAgood,fileSlave,7,400);
 figure
 surf(AS)
 %title('Lifeact')
 [back,SNR,GWx,GWy]=AverageStructSNRandGWidth(AS);
    title(strcat('Lifeact: ',', SNR: ', num2str(SNR),', GW: ',num2str(GWx),', ',num2str(GWy)))
 
 NCoh=10;
TCoh=30;
ICoh=400;
NSTACoh=SplitTracesByCohort_Intensity(NSTAgood,NCoh,ICoh);
%NSTACoh=SplitTracesByCohort_Lifetime(NSTAgood,NCoh,TCoh,4);
for i=1:NCoh
    if ~isempty(NSTACoh{i})
    [AS]=GenerateAverageStructure(NSTACoh{i},file,7,400);
    figure
    surf(AS)
    [back,SNR,GWx,GWy]=AverageStructSNRandGWidth(AS);
    title(strcat('AP2--Intensity: ',num2str(i*ICoh),', SNR: ', num2str(SNR),', GW: ',num2str(GWx),', ',num2str(GWy)))
    
    [AS]=GenerateAverageStructure(NSTACoh{i},fileSlave,7,400);
    figure
    surf(AS)
    [back,SNR,GWx,GWy]=AverageStructSNRandGWidth(AS);
    title(strcat('Life--Intensity: ',num2str(i*ICoh),', SNR: ', num2str(SNR),', GW: ',num2str(GWx),', ',num2str(GWy)))
    end
end