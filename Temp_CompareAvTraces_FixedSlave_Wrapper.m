load('E:\CME Superfolder\CME Data\170518_Analsis_GFP\orig_movies\170519_Data\170519_pre_002GFP_BS_fxycMS.mat')
fxycMSap2=fxycMS;
load('E:\CME Superfolder\CME Data\170905_Analysis\orig_movies\005_GFP_BS_fxycMS.mat')
fxycMScalm=fxycMS;
CompareAvTraces_FixedSlave(fxycMScalm,fxycMSap2);