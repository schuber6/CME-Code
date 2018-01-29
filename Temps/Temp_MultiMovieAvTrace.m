MMf=[];
MSf=[];

load('E:\CME Superfolder\CME Data\170905_Analysis\orig_movies\005_GFP_BS_fxycMS.mat')
[InterM,InterS,MSDifs,MM,MS,MD]=PlotAvTraces_BothAligned_Interp(fxycMS);
close
MMf=MM;
MSf=MS;
load('E:\CME Superfolder\CME Data\170905_Analysis\orig_movies\001_GFP_BS_fxycMS.mat')
[InterM,InterS,MSDifs,MM,MS,MD]=PlotAvTraces_BothAligned_Interp(fxycMS);
close
MMf=MMf +MM;
MSf=MSf +MS;
% load('E:\CME Superfolder\CME Data\170905_Analysis\orig_movies\003_GFP_BS_fxycMS.mat')
% [InterM,InterS,MSDifs,MM,MS,MD]=PlotAvTraces_BothAligned_Interp(fxycMS);
% close
% MMf=[MMf MM];
% MSf=[MSf MS];
load('E:\CME Superfolder\CME Data\170905_Analysis\orig_movies\010_GFP_BS_fxycMS.mat')
[InterM,InterS,MSDifs,MM,MS,MD]=PlotAvTraces_BothAligned_Interp(fxycMS);
close
MMf=MMf +MM;
MSf=MSf +MS;
load('E:\CME Superfolder\CME Data\170905_Analysis\orig_movies\011_GFP_BS_fxycMS.mat')
[InterM,InterS,MSDifs,MM,MS,MD]=PlotAvTraces_BothAligned_Interp(fxycMS);
close
MMf=MMf +MM;
MSf=MSf +MS;



load('E:\CME Superfolder\CME Data\170518_Analsis_GFP\orig_movies\170519_Data\170519_pre_002GFP_BS_fxycMS.mat')
[InterM,InterS,MSDifs,MM,MS,MD]=PlotAvTraces_BothAligned_Interp(fxycMS);
close
MMfap2=MM;
MSfap2=MS;
load('E:\CME Superfolder\CME Data\170518_Analsis_GFP\orig_movies\170519_Data\170519_pre_001GFP_BS_fxycMS.mat')
[InterM,InterS,MSDifs,MM,MS,MD]=PlotAvTraces_BothAligned_Interp(fxycMS);
close
MMfap2=MMfap2 +MM;
MSfap2=MSfap2 +MS;
load('E:\CME Superfolder\CME Data\170518_Analsis_GFP\orig_movies\170519_Data\170519_pre_003GFP_BS_fxycMS.mat')
[InterM,InterS,MSDifs,MM,MS,MD]=PlotAvTraces_BothAligned_Interp(fxycMS);
close
MMfap2=MMfap2 +MM;
MSfap2=MSfap2 +MS;
load('E:\CME Superfolder\CME Data\170518_Analsis_GFP\orig_movies\170519_Data\170519_pre_004GFP_BS_fxycMS.mat')
[InterM,InterS,MSDifs,MM,MS,MD]=PlotAvTraces_BothAligned_Interp(fxycMS);
close
MMfap2=MMfap2 +MM;
MSfap2=MSfap2 +MS;

plot(MMf/max(MMf),'g')
hold on
plot(MSf/max(MSf),'r')

plot(MMfap2/max(MMfap2),'--g')
hold on
plot(MSfap2/max(MSfap2),'--r')