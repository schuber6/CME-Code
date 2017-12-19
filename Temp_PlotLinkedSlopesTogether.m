FilePre='E:\CME Superfolder\CME Data\170518_Analsis_GFP\orig_movies\170520_pre_t_002GFP_BS_MSDfxycStruct.mat';
FilePost1='E:\CME Superfolder\CME Data\170518_Analsis_GFP\orig_movies\170520_post_t1_002GFP_BS_MSDfxycStruct.mat';
FilePost2='E:\CME Superfolder\CME Data\170518_Analsis_GFP\orig_movies\170520_post_t2_002GFP_BS_MSDfxycStruct.mat';

load(FilePre)
[BINTslopes,BSlaveV,BMasterV,BRatio,LsI]=BinMSRatios(fxyc_struct);
PlotLinkedSlopesFC(BRatio,[0 0 1]);

load(FilePost1)
[BINTslopes,BSlaveV,BMasterV,BRatio,LsI]=BinMSRatios(fxyc_struct);
PlotLinkedSlopesFC(BRatio,[1 0 0]);

load(FilePost2)
[BINTslopes,BSlaveV,BMasterV,BRatio,LsI]=BinMSRatios(fxyc_struct);
PlotLinkedSlopesFC(BRatio,[1 0 0]);

