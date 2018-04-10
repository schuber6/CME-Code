%Plot histogram of all CALM intensities

fileSIRNA='E:\CME Superfolder\CME Data\180329_SUM_CALM_AP2orCLCa_SIRNA\Isolated Cells\Split Channels\ap2_sirna_control_2dt_50pred_004_BS_Cell1_Green_FXYCMS';
filenoSIRNA='E:\CME Superfolder\CME Data\180329_SUM_CALM_AP2orCLCa_SIRNA\Isolated Cells\Split Channels\ap2_nosirna_control_2dt_50pred_010_BS_Cell1_Green_FXYCMS';
load(filenoSIRNA)
[MI,SI]=FindAllMasterSlaveIntensities(FXYCMS);
MIn=MI;
figure
[Hn,xbins]=hist(MI,100);
plot(xbins,Hn/sum(Hn),'g')
hold on
load(fileSIRNA)
[MI,SI]=FindAllMasterSlaveIntensities(FXYCMS);
MIs=MI;
Hs=hist(MI,xbins);
plot(xbins,Hs/sum(Hs),'r')
legend(strcat('no siRNA. Mean=',num2str(mean(MIn))),strcat('siRNA. Mean=',num2str(mean(MIs))))
xlabel('CALM Intensity')
ylabel('Frequency')
title('Comparison of CALM Intensity of All Spots in Control Movies')
xlim([0 20000])

%%

%Plot histogram of all AP2 intensities

fileSIRNA='E:\CME Superfolder\CME Data\180329_SUM_CALM_AP2orCLCa_SIRNA\Isolated Cells\Split Channels\ap2_sirna_control_2dt_50pred_004_BS_Cell1_Green_FXYCMS';
filenoSIRNA='E:\CME Superfolder\CME Data\180329_SUM_CALM_AP2orCLCa_SIRNA\Isolated Cells\Split Channels\ap2_nosirna_control_2dt_50pred_010_BS_Cell1_Green_FXYCMS';
load(filenoSIRNA)
[MI,SI]=FindAllMasterSlaveIntensities(FXYCMS);
MIn=SI;
figure
[Hn,xbins]=hist(MIn,100);
plot(xbins,Hn/sum(Hn),'g')
hold on
load(fileSIRNA)
[MI,SI]=FindAllMasterSlaveIntensities(FXYCMS);
MIs=SI;
Hs=hist(MIs,xbins);
plot(xbins,Hs/sum(Hs),'r')
legend(strcat('no siRNA. Mean=',num2str(mean(MIn))),strcat('siRNA. Mean=',num2str(mean(MIs))))
xlabel('CALM Intensity')
ylabel('Frequency')
title('Comparison of AP2 Intensity of All Spots in Control Movies')
xlim([0 20000])
%% Plot Histogram of all max CALM Intensities of Conclusions


fileSIRNA='E:\CME Superfolder\CME Data\180329_SUM_CALM_AP2orCLCa_SIRNA\Isolated Cells\Split Channels\ap2_sirna_control_2dt_50pred_004_BS_Cell1_Green_FXYCMS';
filenoSIRNA='E:\CME Superfolder\CME Data\180329_SUM_CALM_AP2orCLCa_SIRNA\Isolated Cells\Split Channels\ap2_nosirna_control_2dt_50pred_010_BS_Cell1_Green_FXYCMS';
load(filenoSIRNA)
[MI,SI]=FindAll3MaxIntensities(FXYCMS);
MIn=MI;
figure
[Hn,xbins]=hist(MI,100);
plot(xbins,Hn/sum(Hn),'g')
hold on
load(fileSIRNA)
[MI,SI]=FindAll3MaxIntensities(FXYCMS);
MIs=MI;
Hs=hist(MI,xbins);
plot(xbins,Hs/sum(Hs),'r')
legend(strcat('no siRNA. Mean=',num2str(mean(MIn))),strcat('siRNA. Mean=',num2str(mean(MIs))))
xlabel('Max CALM Intensity')
ylabel('Frequency')
title('Comparison of CALM Intensity of Conclusions in Control Movies')
xlim([0 20000])

%% Plot Histogram of all max AP2 Intensities of Conclusions

fileSIRNA='E:\CME Superfolder\CME Data\180329_SUM_CALM_AP2orCLCa_SIRNA\Isolated Cells\Split Channels\ap2_sirna_control_2dt_50pred_004_BS_Cell1_Green_FXYCMS';
filenoSIRNA='E:\CME Superfolder\CME Data\180329_SUM_CALM_AP2orCLCa_SIRNA\Isolated Cells\Split Channels\ap2_nosirna_control_2dt_50pred_010_BS_Cell1_Green_FXYCMS';
load(filenoSIRNA)
[MI,SI]=FindAll3MaxIntensities(FXYCMS);
MIn=SI;
figure
[Hn,xbins]=hist(MIn,100);
plot(xbins,Hn/sum(Hn),'g')
hold on
load(fileSIRNA)
[MI,SI]=FindAll3MaxIntensities(FXYCMS);
MIs=SI;
Hs=hist(MIs,xbins);
plot(xbins,Hs/sum(Hs),'r')
legend(strcat('no siRNA. Mean=',num2str(mean(MIn))),strcat('siRNA. Mean=',num2str(mean(MIs))))
xlabel('Max AP2 Intensity')
ylabel('Frequency')
title('Comparison of AP2 Intensity of Conclusions in Control Movies')
xlim([0 20000])

%%

%Plot histogram of all CALM intensities

fileSIRNA='E:\CME Superfolder\CME Data\180329_SUM_CALM_AP2orCLCa_SIRNA\Isolated Cells\Split Channels\ap2_sirna_control_2dt_50pred_004_BS_Cell1_Red_FXYCMS';
filenoSIRNA='E:\CME Superfolder\CME Data\180329_SUM_CALM_AP2orCLCa_SIRNA\Isolated Cells\Split Channels\ap2_nosirna_control_2dt_50pred_010_BS_Cell1_Red_FXYCMS';
load(filenoSIRNA)
[MI,SI]=FindAllMasterSlaveIntensities(FXYCMS);
MIn=MI;
figure
[Hn,xbins]=hist(MI,100);
plot(xbins,Hn/sum(Hn),'g')
hold on
load(fileSIRNA)
[MI,SI]=FindAllMasterSlaveIntensities(FXYCMS);
MIs=MI;
Hs=hist(MI,xbins);
plot(xbins,Hs/sum(Hs),'r')
legend(strcat('no siRNA. Mean=',num2str(mean(MIn))),strcat('siRNA. Mean=',num2str(mean(MIs))))
xlabel('CALM Intensity')
ylabel('Frequency')
title('Comparison of AP2 Intensity of All Spots in Control Movies')
xlim([0 20000])

%%

%Plot histogram of all AP2 intensities

fileSIRNA='E:\CME Superfolder\CME Data\180329_SUM_CALM_AP2orCLCa_SIRNA\Isolated Cells\Split Channels\ap2_sirna_control_2dt_50pred_004_BS_Cell1_Red_FXYCMS';
filenoSIRNA='E:\CME Superfolder\CME Data\180329_SUM_CALM_AP2orCLCa_SIRNA\Isolated Cells\Split Channels\ap2_nosirna_control_2dt_50pred_010_BS_Cell1_Red_FXYCMS';
load(filenoSIRNA)
[MI,SI]=FindAllMasterSlaveIntensities(FXYCMS);
MIn=SI;
figure
[Hn,xbins]=hist(MIn,100);
plot(xbins,Hn/sum(Hn),'g')
hold on
load(fileSIRNA)
[MI,SI]=FindAllMasterSlaveIntensities(FXYCMS);
MIs=SI;
Hs=hist(MIs,xbins);
plot(xbins,Hs/sum(Hs),'r')
legend(strcat('no siRNA. Mean=',num2str(mean(MIn))),strcat('siRNA. Mean=',num2str(mean(MIs))))
xlabel('CALM Intensity')
ylabel('Frequency')
title('Comparison of CALM Intensity of All Spots in Control Movies')
xlim([0 20000])

%%

%% Plot Histogram of all max CALM Intensities of Conclusions


fileSIRNA='E:\CME Superfolder\CME Data\180329_SUM_CALM_AP2orCLCa_SIRNA\Isolated Cells\Split Channels\ap2_sirna_control_2dt_50pred_004_BS_Cell1_Red_FXYCMS';
filenoSIRNA='E:\CME Superfolder\CME Data\180329_SUM_CALM_AP2orCLCa_SIRNA\Isolated Cells\Split Channels\ap2_nosirna_control_2dt_50pred_010_BS_Cell1_Red_FXYCMS';
load(filenoSIRNA)
[MI,SI]=FindAll3MaxIntensities(FXYCMS);
MIn=MI;
figure
[Hn,xbins]=hist(MI,100);
plot(xbins,Hn/sum(Hn),'g')
hold on
load(fileSIRNA)
[MI,SI]=FindAll3MaxIntensities(FXYCMS);
MIs=MI;
Hs=hist(MI,xbins);
plot(xbins,Hs/sum(Hs),'r')
legend(strcat('no siRNA. Mean=',num2str(mean(MIn))),strcat('siRNA. Mean=',num2str(mean(MIs))))
xlabel('Max AP2 Intensity')
ylabel('Frequency')
title('Comparison of AP2 Intensity of Conclusions in Control Movies')
xlim([0 20000])

%% Plot Histogram of all max AP2 Intensities of Conclusions

fileSIRNA='E:\CME Superfolder\CME Data\180329_SUM_CALM_AP2orCLCa_SIRNA\Isolated Cells\Split Channels\ap2_sirna_control_2dt_50pred_004_BS_Cell1_Red_FXYCMS';
filenoSIRNA='E:\CME Superfolder\CME Data\180329_SUM_CALM_AP2orCLCa_SIRNA\Isolated Cells\Split Channels\ap2_nosirna_control_2dt_50pred_010_BS_Cell1_Red_FXYCMS';
load(filenoSIRNA)
[MI,SI]=FindAll3MaxIntensities(FXYCMS);
MIn=SI;
figure
[Hn,xbins]=hist(MIn,100);
plot(xbins,Hn/sum(Hn),'g')
hold on
load(fileSIRNA)
[MI,SI]=FindAll3MaxIntensities(FXYCMS);
MIs=SI;
Hs=hist(MIs,xbins);
plot(xbins,Hs/sum(Hs),'r')
legend(strcat('no siRNA. Mean=',num2str(mean(MIn))),strcat('siRNA. Mean=',num2str(mean(MIs))))
xlabel('Max CALM Intensity')
ylabel('Frequency')
title('Comparison of CALM Intensity of Conclusions in Control Movies')
xlim([0 20000])