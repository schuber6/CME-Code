Prefile='E:\CME Superfolder\CME Data\170518_Analsis_GFP\orig_movies\170520_post_t1_001GFP_BS_MSDfxycStruct.mat';
Postfile='E:\CME Superfolder\CME Data\170518_Analsis_GFP\orig_movies\170520_post_t2_001GFP_BS_MSDfxycStruct.mat';

load(Prefile)
[BINTslopes,BSlaveV,BMasterV,BRatio,LsI]=BinMSRatios_ClassRestricted(fxyc_struct);
PlotLinkedSlopesF_2Color_WRatios_ForStacking(LsI,BMasterV,BSlaveV,BRatio,1);
load(Postfile)
[BINTslopes,BSlaveV,BMasterV,BRatio,LsI]=BinMSRatios_ClassRestricted(fxyc_struct);
PlotLinkedSlopesF_2Color_WRatios_ForStacking(LsI,BMasterV,BSlaveV,BRatio,0);

figure

Prefile='E:\CME Superfolder\CME Data\170518_Analsis_GFP\orig_movies\170520_post_t1_002GFP_BS_MSDfxycStruct.mat';
Postfile='E:\CME Superfolder\CME Data\170518_Analsis_GFP\orig_movies\170520_post_t2_002GFP_BS_MSDfxycStruct.mat';

load(Prefile)
[BINTslopes,BSlaveV,BMasterV,BRatio,LsI]=BinMSRatios_ClassRestricted(fxyc_struct);
PlotLinkedSlopesF_2Color_WRatios_ForStacking(LsI,BMasterV,BSlaveV,BRatio,1);
load(Postfile)
[BINTslopes,BSlaveV,BMasterV,BRatio,LsI]=BinMSRatios_ClassRestricted(fxyc_struct);
PlotLinkedSlopesF_2Color_WRatios_ForStacking(LsI,BMasterV,BSlaveV,BRatio,0);

figure

Prefile='E:\CME Superfolder\CME Data\170518_Analsis_GFP\orig_movies\170520_post_t1_003GFP_BS_MSDfxycStruct.mat';
Postfile='E:\CME Superfolder\CME Data\170518_Analsis_GFP\orig_movies\170520_post_t2_003GFP_BS_MSDfxycStruct.mat';

load(Prefile)
[BINTslopes,BSlaveV,BMasterV,BRatio,LsI]=BinMSRatios_ClassRestricted(fxyc_struct);
PlotLinkedSlopesF_2Color_WRatios_ForStacking(LsI,BMasterV,BSlaveV,BRatio,1);
load(Postfile)
[BINTslopes,BSlaveV,BMasterV,BRatio,LsI]=BinMSRatios_ClassRestricted(fxyc_struct);
PlotLinkedSlopesF_2Color_WRatios_ForStacking(LsI,BMasterV,BSlaveV,BRatio,0);

figure

