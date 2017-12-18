% fileFXYC='E:\CME Superfolder\CME Data\161213_analysis\orig_movies\003_DNR_BS.mat';
% filesave='E:\CME Superfolder\CME Data\161213_analysis\orig_movies\003_MSDfe.mat';
% load(fileFXYC);
% eventsFXYC=FindDNRDisappearancesFXYC_newdimcrit(Threshfxyc);
% fileSlave='E:\CME Superfolder\CME Data\161213_analysis\orig_movies\003_CLTA_BS.tif';
% [SlaveINT,MasterINT]=GenerateMasterSlaveINTsFromEvents(Threshfxyc,fileSlave,eventsFXYC);
% MSDfe=ConstructMasterSlaveDataCellFromEvents(SlaveINT,Threshfxyc,eventsFXYC);
% save(filesave);
% 1
% fileFXYC='E:\CME Superfolder\CME Data\161213_analysis\orig_movies\001_DNR_BS_crop.mat';
% filesave='E:\CME Superfolder\CME Data\161213_analysis\orig_movies\001_MSDfe.mat';
% load(fileFXYC);
% eventsFXYC=FindDNRDisappearancesFXYC_newdimcrit(Threshfxyc);
% fileSlave='E:\CME Superfolder\CME Data\161213_analysis\orig_movies\001_CLTA_BS_crop.tif';
% [SlaveINT,MasterINT]=GenerateMasterSlaveINTsFromEvents(Threshfxyc,fileSlave,eventsFXYC);
% MSDfe=ConstructMasterSlaveDataCellFromEvents(SlaveINT,Threshfxyc,eventsFXYC);
% save(filesave);
% 2
% fileFXYC='E:\CME Superfolder\CME Data\161213_analysis\orig_movies\004_DNR_BS.mat';
% filesave='E:\CME Superfolder\CME Data\161213_analysis\orig_movies\004_MSDfe.mat';
% load(fileFXYC);
% eventsFXYC=FindDNRDisappearancesFXYC_newdimcrit(Threshfxyc);
% fileSlave='E:\CME Superfolder\CME Data\161213_analysis\orig_movies\004_CLTA_BS.tif';
% [SlaveINT,MasterINT]=GenerateMasterSlaveINTsFromEvents(Threshfxyc,fileSlave,eventsFXYC);
% MSDfe=ConstructMasterSlaveDataCellFromEvents(SlaveINT,Threshfxyc,eventsFXYC);
% save(filesave);
% 3
% fileFXYC='E:\CME Superfolder\CME Data\161213_analysis\orig_movies\006_DNR_BS.mat';
% filesave='E:\CME Superfolder\CME Data\161213_analysis\orig_movies\006_MSDfe.mat';
% load(fileFXYC);
% eventsFXYC=FindDNRDisappearancesFXYC_newdimcrit(Threshfxyc);
% fileSlave='E:\CME Superfolder\CME Data\161213_analysis\orig_movies\006_CLTA_BS.tif';
% [SlaveINT,MasterINT]=GenerateMasterSlaveINTsFromEvents(Threshfxyc,fileSlave,eventsFXYC);
% MSDfe=ConstructMasterSlaveDataCellFromEvents(SlaveINT,Threshfxyc,eventsFXYC);
% save(filesave);
% 4
clear
fileFXYC='E:\CME Superfolder\CME Data\161215_analysis\orig_movies\001_DNR_BS.mat';
filesave='E:\CME Superfolder\CME Data\161215_analysis\orig_movies\001_MSDfe.mat';
load(fileFXYC);
eventsFXYC=FindDNRDisappearancesFXYC_newdimcrit(Threshfxyc);
fileSlave='E:\CME Superfolder\CME Data\161215_analysis\orig_movies\001_CLTA_BS.tif';
[SlaveINT,MasterINT]=GenerateMasterSlaveINTsFromEvents(Threshfxyc,fileSlave,eventsFXYC);
MSDfe=ConstructMasterSlaveDataCellFromEvents(SlaveINT,Threshfxyc,eventsFXYC);
save(filesave);
1
clear
fileFXYC='E:\CME Superfolder\CME Data\161215_analysis\orig_movies\002_DNR_BS_crop.mat';
filesave='E:\CME Superfolder\CME Data\161215_analysis\orig_movies\002_MSDfe_crop.mat';
load(fileFXYC);
eventsFXYC=FindDNRDisappearancesFXYC_newdimcrit(Threshfxyc);
fileSlave='E:\CME Superfolder\CME Data\161215_analysis\orig_movies\002_CLTA_BS_crop.tif';
[SlaveINT,MasterINT]=GenerateMasterSlaveINTsFromEvents(Threshfxyc,fileSlave,eventsFXYC);
MSDfe=ConstructMasterSlaveDataCellFromEvents(SlaveINT,Threshfxyc,eventsFXYC);
save(filesave);
2
clear
fileFXYC='E:\CME Superfolder\CME Data\161215_analysis\orig_movies\004_DNR_BS.mat';
filesave='E:\CME Superfolder\CME Data\161215_analysis\orig_movies\004_MSDfe.mat';
load(fileFXYC);
eventsFXYC=FindDNRDisappearancesFXYC_newdimcrit(Threshfxyc);
fileSlave='E:\CME Superfolder\CME Data\161215_analysis\orig_movies\004_CLTA_BS.tif';
[SlaveINT,MasterINT]=GenerateMasterSlaveINTsFromEvents(Threshfxyc,fileSlave,eventsFXYC);
MSDfe=ConstructMasterSlaveDataCellFromEvents(SlaveINT,Threshfxyc,eventsFXYC);
save(filesave);
4
clear
fileFXYC='E:\CME Superfolder\CME Data\161215_analysis\orig_movies\005_DNR_BS.mat';
filesave='E:\CME Superfolder\CME Data\161215_analysis\orig_movies\005_MSDfe.mat';
load(fileFXYC);
eventsFXYC=FindDNRDisappearancesFXYC_newdimcrit(Threshfxyc);
fileSlave='E:\CME Superfolder\CME Data\161215_analysis\orig_movies\005_CLTA_BS.tif';
[SlaveINT,MasterINT]=GenerateMasterSlaveINTsFromEvents(Threshfxyc,fileSlave,eventsFXYC);
MSDfe=ConstructMasterSlaveDataCellFromEvents(SlaveINT,Threshfxyc,eventsFXYC);
save(filesave);
5
clear
fileFXYC='E:\CME Superfolder\CME Data\161215_analysis\orig_movies\006_DNR_BS_crop.mat';
filesave='E:\CME Superfolder\CME Data\161215_analysis\orig_movies\006_MSDfe_crop.mat';
load(fileFXYC);
eventsFXYC=FindDNRDisappearancesFXYC_newdimcrit(Threshfxyc);
fileSlave='E:\CME Superfolder\CME Data\161215_analysis\orig_movies\006_CLTA_BS_crop.tif';
[SlaveINT,MasterINT]=GenerateMasterSlaveINTsFromEvents(Threshfxyc,fileSlave,eventsFXYC);
MSDfe=ConstructMasterSlaveDataCellFromEvents(SlaveINT,Threshfxyc,eventsFXYC);
save(filesave);
6
clear
fileFXYC='E:\CME Superfolder\CME Data\161215_analysis\orig_movies\007_DNR_BS.mat';
filesave='E:\CME Superfolder\CME Data\161215_analysis\orig_movies\007_MSDfe.mat';
load(fileFXYC);
eventsFXYC=FindDNRDisappearancesFXYC_newdimcrit(Threshfxyc);
fileSlave='E:\CME Superfolder\CME Data\161215_analysis\orig_movies\007_CLTA_BS.tif';
[SlaveINT,MasterINT]=GenerateMasterSlaveINTsFromEvents(Threshfxyc,fileSlave,eventsFXYC);
MSDfe=ConstructMasterSlaveDataCellFromEvents(SlaveINT,Threshfxyc,eventsFXYC);
save(filesave);
7
% clear
% fileFXYC='E:\CME Superfolder\CME Data\161213_analysis\orig_movies\008_DNR_BS.mat';
% filesave='E:\CME Superfolder\CME Data\161213_analysis\orig_movies\008_MSDfe.mat';
% load(fileFXYC);
% eventsFXYC=FindDNRDisappearancesFXYC_newdimcrit(Threshfxyc);
% fileSlave='E:\CME Superfolder\CME Data\161213_analysis\orig_movies\008_CLTA_BS.tif';
% [SlaveINT,MasterINT]=GenerateMasterSlaveINTsFromEvents(Threshfxyc,fileSlave,eventsFXYC);
% MSDfe=ConstructMasterSlaveDataCellFromEvents(SlaveINT,Threshfxyc,eventsFXYC);
% save(filesave);
% 6
clear
fileFXYC='E:\CME Superfolder\CME Data\161213_analysis\orig_movies\009_DNR_BS.mat';
filesave='E:\CME Superfolder\CME Data\161213_analysis\orig_movies\009_MSDfe.mat';
load(fileFXYC);
eventsFXYC=FindDNRDisappearancesFXYC_newdimcrit(Threshfxyc);
fileSlave='E:\CME Superfolder\CME Data\161213_analysis\orig_movies\009_CLTA_BS.tif';
[SlaveINT,MasterINT]=GenerateMasterSlaveINTsFromEvents(Threshfxyc,fileSlave,eventsFXYC);
MSDfe=ConstructMasterSlaveDataCellFromEvents(SlaveINT,Threshfxyc,eventsFXYC);
save(filesave);
7
% clear
% fileFXYC='E:\CME Superfolder\CME Data\161213_analysis\orig_movies\010_DNR_BS.mat';
% filesave='E:\CME Superfolder\CME Data\161213_analysis\orig_movies\010_MSDfe.mat';
% load(fileFXYC);
% eventsFXYC=FindDNRDisappearancesFXYC_newdimcrit(Threshfxyc);
% fileSlave='E:\CME Superfolder\CME Data\161213_analysis\orig_movies\010_CLTA_BS.tif';
% [SlaveINT,MasterINT]=GenerateMasterSlaveINTsFromEvents(Threshfxyc,fileSlave,eventsFXYC);
% MSDfe=ConstructMasterSlaveDataCellFromEvents(SlaveINT,Threshfxyc,eventsFXYC);
% save(filesave);
8
clear
fileFXYC='E:\CME Superfolder\CME Data\161213_analysis\orig_movies\last_DNR_BS_crop.mat';
filesave='E:\CME Superfolder\CME Data\161213_analysis\orig_movies\005_MSDfe.mat';
load(fileFXYC);
eventsFXYC=FindDNRDisappearancesFXYC_newdimcrit(Threshfxyc);
fileSlave='E:\CME Superfolder\CME Data\161213_analysis\orig_movies\last_005_CLTA_BS_crop.tif';
[SlaveINT,MasterINT]=GenerateMasterSlaveINTsFromEvents(Threshfxyc,fileSlave,eventsFXYC);
MSDfe=ConstructMasterSlaveDataCellFromEvents(SlaveINT,Threshfxyc,eventsFXYC);
save(filesave);
clear
% fileFXYC='E:\CME Superfolder\CME Data\161213_analysis\orig_movies\007_DNR_BS.mat';
% filesave='E:\CME Superfolder\CME Data\161213_analysis\orig_movies\007_MSDfe.mat';
% load(fileFXYC);
% eventsFXYC=FindDNRDisappearancesFXYC_newdimcrit(Threshfxyc);
% fileSlave='E:\CME Superfolder\CME Data\161213_analysis\orig_movies\007_CLTA_BS.tif';
% [SlaveINT,MasterINT]=GenerateMasterSlaveINTsFromEvents(Threshfxyc,fileSlave,eventsFXYC);
% MSDfe=ConstructMasterSlaveDataCellFromEvents(SlaveINT,Threshfxyc,eventsFXYC);
% save(filesave);
% 5