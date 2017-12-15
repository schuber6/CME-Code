load('E:\CME Superfolder\CME Data\170905_Analysis\orig_movies\005_GFP_BS_fxycMS.mat')
fxycMScalm=fxycMS;
[fxycMSCohortsCALM,MMM,MMS,Cohorts]=SplitIntoCohorts_fxycMS(fxycMScalm);
figure
YL=[];
for i=1:length(fxycMSCohortsCALM)
    subplot(2,4,i)
    [InterM,InterS,MSDifs,MM,MS,MD]=PlotAvTraces_BothAligned_Interp(fxycMSCohortsCALM{i},0,0,MMM/100,MMS/100);
    title(strcat('N=',num2str(length(fxycMSCohortsCALM{i}(1,1,:)))))
    YL(i,:)=ylim;
end
for i=1:length(fxycMSCohortsCALM)
    subplot(2,4,i)
    ylim([min(YL(:,1)) max(YL(:,2))])
end

%load('E:\CME Superfolder\CME Data\170518_Analsis_GFP\orig_movies\170519_Data\170519_pre_002GFP_BS_fxycMS.mat')
load('E:\CME Superfolder\CME Data\170518_Analsis_GFP\orig_movies\170519_Data\170518_control_1d_001GFP_BS_fxycMS.mat')
fxycMScalm=fxycMS;
[fxycMSCohortsCALM,MMM,MMS,Cohorts]=SplitIntoCohorts_fxycMS(fxycMScalm);
figure
YL=[];
for i=1:length(fxycMSCohortsCALM)
    subplot(2,4,i)
    [InterM,InterS,MSDifs,MM,MS,MD]=PlotAvTraces_BothAligned_Interp(fxycMSCohortsCALM{i},0,0,MMM/100,MMS/100);
    title(strcat('N=',num2str(length(fxycMSCohortsCALM{i}(1,1,:)))))
    YL(i,:)=ylim;
end
for i=1:length(fxycMSCohortsCALM)
    subplot(2,4,i)
    ylim([min(YL(:,1)) max(YL(:,2))])
end