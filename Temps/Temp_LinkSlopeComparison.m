FilePre='E:\CME Superfolder\CME Data\170518_Analsis_GFP\orig_movies\170520_pre_t_001GFP_BS_MSDfxycStruct.mat';
FilePost1='E:\CME Superfolder\CME Data\170518_Analsis_GFP\orig_movies\170520_post_t1_001GFP_BS_MSDfxycStruct.mat';
FilePost2='E:\CME Superfolder\CME Data\170518_Analsis_GFP\orig_movies\170520_post_t2_001GFP_BS_MSDfxycStruct.mat';

load(FilePre)
[BINTslopes,BSlaveV,BMasterV,BRatio,LsI]=BinMSRatios(fxyc_struct);
PlotLinkedSlopesF_2Color(LsI,BMasterV,BSlaveV);
figure
PlotLinkedSlopesF(LsI,BRatio);

figure
load(FilePost1)
[BINTslopes,BSlaveV,BMasterV,BRatio,LsI]=BinMSRatios(fxyc_struct);
PlotLinkedSlopesF_2Color(LsI,BMasterV,BSlaveV);
figure
PlotLinkedSlopesF(LsI,BRatio);

figure
load(FilePost2)
[BINTslopes,BSlaveV,BMasterV,BRatio,LsI]=BinMSRatios(fxyc_struct);
PlotLinkedSlopesF_2Color(LsI,BMasterV,BSlaveV);
figure
PlotLinkedSlopesF(LsI,BRatio);
