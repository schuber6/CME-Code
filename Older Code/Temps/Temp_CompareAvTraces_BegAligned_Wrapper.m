exp_name='E:\CME Superfolder\CME Data\170906_Analysis\orig_movies';
%SlaveFolder='E:\CME Superfolder\CME Data\170906_CALM_CLCa_Osmo';
%SlaveFolder='E:\CME Superfolder\CME Data\170518_Analysis\170519_movies';
%exp_name='E:\CME Superfolder\CME Data\170518_Analsis_GFP\orig_movies\170519_Data';
omd=fullfile(exp_name);
tmpd = dir(fullfile(omd,'*medB.mat'));

for i=1:length(tmpd)
    movies{i} = fullfile(omd,tmpd(i).name);
    fileFXYC{i}=strcat(movies{i}(1:end-4),'.mat');

load('E:\CME Superfolder\CME Data\170518_Analsis_GFP\orig_movies\170519_Data\170519_pre_001GFP_BS_fxycMS_prev_medB.mat')
fxycMSap2=fxycMS;
load(fileFXYC{i})
fxycMScalm=fxycMS;
%CompareAvTraces_BegAligned(fxycMScalm,fxycMSap2);
CompareAvTraces_BegAligned_30s_wPrev(fxycMScalm,fxycMSap2); %Only look at first 30s to match Miller paper
xlim([-20 30])
%[InterM,InterS,MSDifs,MM,MS,MD]=PlotAvTraces_BeginningAligned_wPrev_BestCorr(fxycMScalm);
title('CALM')
end

exp_name='E:\CME Superfolder\CME Data\170518_Analsis_GFP\orig_movies\170519_Data';
%SlaveFolder='E:\CME Superfolder\CME Data\170906_CALM_CLCa_Osmo';
%SlaveFolder='E:\CME Superfolder\CME Data\170518_Analysis\170519_movies';
%exp_name='E:\CME Superfolder\CME Data\170518_Analsis_GFP\orig_movies\170519_Data';
omd=fullfile(exp_name);
tmpd = dir(fullfile(omd,'*medB.mat'));

for i=1:0 %length(tmpd)
    movies{i} = fullfile(omd,tmpd(i).name);
    fileFXYC{i}=strcat(movies{i}(1:end-4),'.mat');

load('E:\CME Superfolder\CME Data\170518_Analsis_GFP\orig_movies\170519_Data\170519_pre_001GFP_BS_fxycMS_prev_medB.mat')
fxycMSap2=fxycMS;
load(fileFXYC{i})
fxycMScalm=fxycMS;
CompareAvTraces_BegAligned(fxycMScalm,fxycMSap2);
%CompareAvTraces_BegAligned_30s_wPrev(fxycMScalm,fxycMSap2); %Only look at first 30s to match Miller paper
%xlim([0 10])
%[InterM,InterS,MSDifs,MM,MS,MD]=PlotAvTraces_BeginningAligned_wPrev_BestCorr(fxycMScalm);
title('AP2')
end