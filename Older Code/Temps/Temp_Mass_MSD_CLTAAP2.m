fileFXYC='E:\CME Superfolder\CME Data\170518_Analsis_GFP\orig_movies\170520_pre_t_003GFP_BS.mat';
fileSave='E:\CME Superfolder\CME Data\170518_Analsis_GFP\orig_movies\170520_pre_t_003_MSD.mat';
fileSlave='E:\CME Superfolder\CME Data\170518_Analysis\170520_pre_t_003RFP_BS.tif';
MasterThresh=400;
load(fileFXYC)
[SlaveINT,MasterINT]=GenerateMasterSlaveINTs_ALL(Threshfxyc,fileSlave,MasterThresh);
MSD=ConstructMasterSlaveDataCell(SlaveINT,Threshfxyc,MasterThresh);
save(fileSave,'MSD')

fileFXYC='E:\CME Superfolder\CME Data\170518_Analsis_GFP\orig_movies\170520_post_t1_003GFP_BS.mat';
fileSave='E:\CME Superfolder\CME Data\170518_Analsis_GFP\orig_movies\170520_post_t1_003_MSD.mat';
fileSlave='E:\CME Superfolder\CME Data\170518_Analysis\170520_post_t1_003RFP_BS.tif';
MasterThresh=400;
load(fileFXYC)
[SlaveINT,MasterINT]=GenerateMasterSlaveINTs_ALL(Threshfxyc,fileSlave,MasterThresh);
MSD=ConstructMasterSlaveDataCell(SlaveINT,Threshfxyc,MasterThresh);
save(fileSave,'MSD')

fileFXYC='E:\CME Superfolder\CME Data\170518_Analsis_GFP\orig_movies\170520_post_t2_003GFP_BS.mat';
fileSave='E:\CME Superfolder\CME Data\170518_Analsis_GFP\orig_movies\170520_post_t2_003_MSD.mat';
fileSlave='E:\CME Superfolder\CME Data\170518_Analysis\170520_post_t2_003RFP_BS.tif';
MasterThresh=400;
load(fileFXYC)
[SlaveINT,MasterINT]=GenerateMasterSlaveINTs_ALL(Threshfxyc,fileSlave,MasterThresh);
MSD=ConstructMasterSlaveDataCell(SlaveINT,Threshfxyc,MasterThresh);
save(fileSave,'MSD')