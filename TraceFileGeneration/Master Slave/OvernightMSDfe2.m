clear
fileFXYC='E:\CME Superfolder\CME Data\161217_analysis\orig_movies\001_DNR_BS_crop.mat';
filesave='E:\CME Superfolder\CME Data\161217_analysis\orig_movies\001_MSDfe_crop.mat';
load(fileFXYC);
eventsFXYC=FindDNRDisappearancesFXYC_newdimcrit(Threshfxyc);
fileSlave='E:\CME Superfolder\CME Data\161217_analysis\orig_movies\001_CLTA_BS_crop.tif';
[SlaveINT,MasterINT]=GenerateMasterSlaveINTsFromEvents(Threshfxyc,fileSlave,eventsFXYC);
MSDfe=ConstructMasterSlaveDataCellFromEvents(SlaveINT,Threshfxyc,eventsFXYC);
save(filesave);
1
clear
fileFXYC='E:\CME Superfolder\CME Data\161217_analysis\orig_movies\002_DNR_BS_crop.mat';
filesave='E:\CME Superfolder\CME Data\161217_analysis\orig_movies\002_MSDfe_crop.mat';
load(fileFXYC);
eventsFXYC=FindDNRDisappearancesFXYC_newdimcrit(Threshfxyc);
fileSlave='E:\CME Superfolder\CME Data\161217_analysis\orig_movies\002_CLTA_BS_crop.tif';
[SlaveINT,MasterINT]=GenerateMasterSlaveINTsFromEvents(Threshfxyc,fileSlave,eventsFXYC);
MSDfe=ConstructMasterSlaveDataCellFromEvents(SlaveINT,Threshfxyc,eventsFXYC);
save(filesave);
2
clear
fileFXYC='E:\CME Superfolder\CME Data\161217_analysis\orig_movies\003_DNR_BS_crop.mat';
filesave='E:\CME Superfolder\CME Data\161217_analysis\orig_movies\003_MSDfe_crop.mat';
load(fileFXYC);
eventsFXYC=FindDNRDisappearancesFXYC_newdimcrit(Threshfxyc);
fileSlave='E:\CME Superfolder\CME Data\161217_analysis\orig_movies\003_CLTA_BS_crop.tif';
[SlaveINT,MasterINT]=GenerateMasterSlaveINTsFromEvents(Threshfxyc,fileSlave,eventsFXYC);
MSDfe=ConstructMasterSlaveDataCellFromEvents(SlaveINT,Threshfxyc,eventsFXYC);
save(filesave);
3
clear
fileFXYC='E:\CME Superfolder\CME Data\161217_analysis\orig_movies\004_DNR_BS_crop.mat';
filesave='E:\CME Superfolder\CME Data\161217_analysis\orig_movies\004_MSDfe_crop.mat';
load(fileFXYC);
eventsFXYC=FindDNRDisappearancesFXYC_newdimcrit(Threshfxyc);
fileSlave='E:\CME Superfolder\CME Data\161217_analysis\orig_movies\004_CLTA_BS_crop.tif';
[SlaveINT,MasterINT]=GenerateMasterSlaveINTsFromEvents(Threshfxyc,fileSlave,eventsFXYC);
MSDfe=ConstructMasterSlaveDataCellFromEvents(SlaveINT,Threshfxyc,eventsFXYC);
save(filesave);
4
clear
fileFXYC='E:\CME Superfolder\CME Data\161217_analysis\orig_movies\005_DNR_BS.mat';
filesave='E:\CME Superfolder\CME Data\161217_analysis\orig_movies\005_MSDfe.mat';
load(fileFXYC);
eventsFXYC=FindDNRDisappearancesFXYC_newdimcrit(Threshfxyc);
fileSlave='E:\CME Superfolder\CME Data\161217_analysis\orig_movies\005_CLTA_BS.tif';
[SlaveINT,MasterINT]=GenerateMasterSlaveINTsFromEvents(Threshfxyc,fileSlave,eventsFXYC);
MSDfe=ConstructMasterSlaveDataCellFromEvents(SlaveINT,Threshfxyc,eventsFXYC);
save(filesave);
5