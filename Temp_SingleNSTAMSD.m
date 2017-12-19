fileNSTA='E:\CME Superfolder\CME Data\170816_LifeactCyclo\BSC_3DCyclo_2Colorcyclo004_AP2_BS.mat';
fileSlave='E:\CME Superfolder\CME Data\170816_LifeactCyclo\cyclo004_Lifeact_BS.tif';
fileSave='E:\CME Superfolder\CME Data\170816_LifeactCyclo\BSC_3DCyclo_2Colorcyclo004_AP2_BS_MasterSlaveFast_v3.mat';
load(fileNSTA)
MasterThresh=400;
[NSTAgood]=GenerateMasterSlaveINTs_NSTA_0s_faster(NSTA,fileSlave,MasterThresh,7);
save(fileSave,'NSTAgood')

fileNSTA='E:\CME Superfolder\CME Data\170816_LifeactCyclo\BSC_3DCyclo_2Colorcyclo008_AP2_BS.mat';
fileSlave='E:\CME Superfolder\CME Data\170816_LifeactCyclo\cyclo008_Lifeact_BS.tif';
fileSave='E:\CME Superfolder\CME Data\170816_LifeactCyclo\BSC_3DCyclo_2Colorcyclo008_AP2_BS_MasterSlaveFast_v3.mat';
load(fileNSTA)
MasterThresh=400;
[NSTAgood]=GenerateMasterSlaveINTs_NSTA_0s_faster(NSTA,fileSlave,MasterThresh,7);
save(fileSave,'NSTAgood')

fileNSTA='E:\CME Superfolder\CME Data\170816_LifeactCyclo\BSC_3DCyclo_2Colorcyclo009_AP2_BS.mat';
fileSlave='E:\CME Superfolder\CME Data\170816_LifeactCyclo\cyclo009_Lifeact_BS.tif';
fileSave='E:\CME Superfolder\CME Data\170816_LifeactCyclo\BSC_3DCyclo_2Colorcyclo009_AP2_BS_MasterSlaveFast_v3.mat';
load(fileNSTA)
MasterThresh=400;
[NSTAgood]=GenerateMasterSlaveINTs_NSTA_0s_faster(NSTA,fileSlave,MasterThresh,7);
save(fileSave,'NSTAgood')

fileNSTA='E:\CME Superfolder\CME Data\170816_LifeactCyclo\BSC_3DCyclo_2Colorcyclo007_AP2_BS.mat';
fileSlave='E:\CME Superfolder\CME Data\170816_LifeactCyclo\cyclo007_Lifeact_BS.tif';
fileSave='E:\CME Superfolder\CME Data\170816_LifeactCyclo\BSC_3DCyclo_2Colorcyclo007_AP2_BS_MasterSlaveFast_v3.mat';
load(fileNSTA)
MasterThresh=400;
[NSTAgood]=GenerateMasterSlaveINTs_NSTA_0s_faster(NSTA,fileSlave,MasterThresh,7);
save(fileSave,'NSTAgood')