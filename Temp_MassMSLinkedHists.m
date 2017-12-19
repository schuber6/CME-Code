clear all
fileFXYC='E:\CME Superfolder\CME Data\170518_Analsis_GFP\orig_movies\170520_pre_t_003GFP_BS.mat';
fileSave='E:\CME Superfolder\CME Data\170518_Analsis_GFP\orig_movies\170520_pre_t_003_MSD.mat';
load(fileFXYC)
load(fileSave)
fxyc_struct = fxyc_to_struct(Threshfxyc,false);
fxyc_struct = slope_finding(fxyc_struct,3,400);
fxyc_struct=AddSlaveInt(fxyc_struct,MSD);
[BINTslopes,BSlaveV,BMasterV,BRatio,LsI]=BinMSRatios(fxyc_struct);
%PlotLinkedSlopesF(LsI,BMasterV);
PlotLinkedSlopesF_2Color(LsI,BMasterV,BSlaveV);
figure

fileFXYC='E:\CME Superfolder\CME Data\170518_Analsis_GFP\orig_movies\170520_post_t1_003GFP_BS.mat';
fileSave='E:\CME Superfolder\CME Data\170518_Analsis_GFP\orig_movies\170520_post_t1_003_MSD.mat';
load(fileFXYC)
load(fileSave)
fxyc_struct = fxyc_to_struct(Threshfxyc,false);
fxyc_struct = slope_finding(fxyc_struct,3,400);
fxyc_struct=AddSlaveInt(fxyc_struct,MSD);
[BINTslopes,BSlaveV,BMasterV,BRatio,LsI]=BinMSRatios(fxyc_struct);
%PlotLinkedSlopesF(LsI,BMasterV);
PlotLinkedSlopesF_2Color(LsI,BMasterV,BSlaveV);
figure

fileFXYC='E:\CME Superfolder\CME Data\170518_Analsis_GFP\orig_movies\170520_post_t2_003GFP_BS.mat';
fileSave='E:\CME Superfolder\CME Data\170518_Analsis_GFP\orig_movies\170520_post_t2_003_MSD.mat';
load(fileFXYC)
load(fileSave)
fxyc_struct = fxyc_to_struct(Threshfxyc,false);
fxyc_struct = slope_finding(fxyc_struct,3,400);
fxyc_struct=AddSlaveInt(fxyc_struct,MSD);
[BINTslopes,BSlaveV,BMasterV,BRatio,LsI]=BinMSRatios(fxyc_struct);
%PlotLinkedSlopesF(LsI,BMasterV);
PlotLinkedSlopesF_2Color(LsI,BMasterV,BSlaveV);
