% load('E:\CME Superfolder\CME Data\170905_Analysis\orig_movies\005_GFP_BS_fxycMS.mat')
% fxycMScalm=fxycMS;
% [fxycMSCohortsCALM,MMM,MMS,Cohorts]=SplitIntoCohorts_fxycMS(fxycMScalm);
% figure
% YL=[];
% for i=1:length(fxycMSCohortsCALM)
%     
%     [InterM,InterS,MSDifs,MM,MS,MD]=PlotAvTraces_BothAligned_PreserveLT(fxycMSCohortsCALM{i},0,0,MMM/100,MMS/100);
%     hold on
%     %title(strcat('N=',num2str(length(fxycMSCohortsCALM{i}(1,1,:)))))
%     
% end
% 
% load('E:\CME Superfolder\CME Data\170905_Analysis\orig_movies\001_GFP_BS_fxycMS.mat')
% fxycMScalm=fxycMS;
% [fxycMSCohortsCALM,MMM,MMS,Cohorts]=SplitIntoCohorts_fxycMS(fxycMScalm);
% figure
% YL=[];
% for i=1:length(fxycMSCohortsCALM)
%     
%     [InterM,InterS,MSDifs,MM,MS,MD]=PlotAvTraces_BothAligned_PreserveLT(fxycMSCohortsCALM{i},0,0,MMM/100,MMS/100);
%     hold on
%     %title(strcat('N=',num2str(length(fxycMSCohortsCALM{i}(1,1,:)))))
%     
% end

load('E:\CME Superfolder\CME Data\170905_Analysis\orig_movies\005_osmo_GFP_BS_fxycMS.mat')
fxycMScalm=fxycMS;
[fxycMSCohortsCALM,MMM,MMS,Cohorts]=SplitIntoCohorts_fxycMS(fxycMScalm);
figure
YL=[];
for i=1:length(fxycMSCohortsCALM)
    
    subplot(1,2,1)
    [InterM,InterS,MSDifs,MM,MS,MD,xf]=PlotAvTraces_BothAligned_PreserveLT(fxycMSCohortsCALM{i},0,0,MMM/100,MMS/100);
    hold on
    %title(strcat('N=',num2str(length(fxycMSCohortsCALM{i}(1,1,:)))))
    legend('CALM','CLCa')
    subplot(1,2,2)
    plot(xf,MM./MS)
    hold on
end

load('E:\CME Superfolder\CME Data\170905_Analysis\orig_movies\005_GFP_BS_fxycMS.mat')
fxycMScalm=fxycMS;
[fxycMSCohortsCALM,MMM,MMS,Cohorts]=SplitIntoCohorts_fxycMS(fxycMScalm);
figure
YL=[];
for i=1:length(fxycMSCohortsCALM)
    
    subplot(1,2,1)
    [InterM,InterS,MSDifs,MM,MS,MD,xf]=PlotAvTraces_BothAligned_PreserveLT(fxycMSCohortsCALM{i},0,0,MMM/100,MMS/100);
    hold on
    %title(strcat('N=',num2str(length(fxycMSCohortsCALM{i}(1,1,:)))))
    legend('CALM','CLCa')
    subplot(1,2,2)
    plot(xf,MM./MS)
    hold on
end

load('E:\CME Superfolder\CME Data\170905_Analysis\orig_movies\001_GFP_BS_fxycMS.mat')
fxycMScalm=fxycMS;
[fxycMSCohortsCALM,MMM,MMS,Cohorts]=SplitIntoCohorts_fxycMS(fxycMScalm);
figure
YL=[];
for i=1:length(fxycMSCohortsCALM)
    
    subplot(1,2,1)
    [InterM,InterS,MSDifs,MM,MS,MD,xf]=PlotAvTraces_BothAligned_PreserveLT(fxycMSCohortsCALM{i},0,0,MMM/100,MMS/100);
    hold on
    %title(strcat('N=',num2str(length(fxycMSCohortsCALM{i}(1,1,:)))))
    legend('CALM','CLCa')
    subplot(1,2,2)
    plot(xf,MM./MS)
    hold on
end

load('E:\CME Superfolder\CME Data\170905_Analysis\orig_movies\010_GFP_BS_fxycMS.mat')
fxycMScalm=fxycMS;
[fxycMSCohortsCALM,MMM,MMS,Cohorts]=SplitIntoCohorts_fxycMS(fxycMScalm);
figure
YL=[];
for i=1:length(fxycMSCohortsCALM)
    
    subplot(1,2,1)
    [InterM,InterS,MSDifs,MM,MS,MD,xf]=PlotAvTraces_BothAligned_PreserveLT(fxycMSCohortsCALM{i},0,0,MMM/100,MMS/100);
    hold on
    %title(strcat('N=',num2str(length(fxycMSCohortsCALM{i}(1,1,:)))))
    legend('CALM','CLCa')
    subplot(1,2,2)
    plot(xf,MM./MS)
    hold on
end

load('E:\CME Superfolder\CME Data\170905_Analysis\orig_movies\011_GFP_BS_fxycMS.mat')
fxycMScalm=fxycMS;
[fxycMSCohortsCALM,MMM,MMS,Cohorts]=SplitIntoCohorts_fxycMS(fxycMScalm);
figure
YL=[];
for i=1:length(fxycMSCohortsCALM)
    
    subplot(1,2,1)
    [InterM,InterS,MSDifs,MM,MS,MD,xf]=PlotAvTraces_BothAligned_PreserveLT(fxycMSCohortsCALM{i},0,0,MMM/100,MMS/100);
    hold on
    %title(strcat('N=',num2str(length(fxycMSCohortsCALM{i}(1,1,:)))))
    legend('CALM','CLCa')
    subplot(1,2,2)
    plot(xf,MM./MS)
    hold on
end
% 
% load('E:\CME Superfolder\CME Data\170905_Analysis\orig_movies\011_GFP_BS_fxycMS.mat')
% fxycMScalm=fxycMS;
% [fxycMSCohortsCALM,MMM,MMS,Cohorts]=SplitIntoCohorts_fxycMS(fxycMScalm);
% figure
% YL=[];
% for i=1:length(fxycMSCohortsCALM)
%     
%     [InterM,InterS,MSDifs,MM,MS,MD]=PlotAvTraces_BothAligned_PreserveLT(fxycMSCohortsCALM{i},0,0,MMM/100,MMS/100);
%     hold on
%     %title(strcat('N=',num2str(length(fxycMSCohortsCALM{i}(1,1,:)))))
%     
% end
%load('E:\CME Superfolder\CME Data\170518_Analsis_GFP\orig_movies\170519_Data\170518_control_1d_001GFP_BS_fxycMS.mat')
% load('E:\CME Superfolder\CME Data\170518_Analsis_GFP\orig_movies\170519_Data\170519_pre_002GFP_BS_fxycMS.mat')
% fxycMScalm=fxycMS;
% [fxycMSCohortsCALM,MMM,MMS,Cohorts]=SplitIntoCohorts_fxycMS(fxycMScalm);
% figure
% YL=[];
% for i=1:length(fxycMSCohortsCALM)
%     
%     [InterM,InterS,MSDifs,MM,MS,MD]=PlotAvTraces_BothAligned_PreserveLT(fxycMSCohortsCALM{i},0,0,MMM/100,MMS/100);
%     hold on
%     %title(strcat('N=',num2str(length(fxycMSCohortsCALM{i}(1,1,:)))))
%     
% end
% 
% load('E:\CME Superfolder\CME Data\170518_Analsis_GFP\orig_movies\170519_Data\170519_pre_001GFP_BS_fxycMS.mat')
% fxycMScalm=fxycMS;
% [fxycMSCohortsCALM,MMM,MMS,Cohorts]=SplitIntoCohorts_fxycMS(fxycMScalm);
% figure
% YL=[];
% for i=1:length(fxycMSCohortsCALM)
%     
%     [InterM,InterS,MSDifs,MM,MS,MD]=PlotAvTraces_BothAligned_PreserveLT(fxycMSCohortsCALM{i},0,0,MMM/100,MMS/100);
%     hold on
%     %title(strcat('N=',num2str(length(fxycMSCohortsCALM{i}(1,1,:)))))
%     
% end
% 
% load('E:\CME Superfolder\CME Data\170518_Analsis_GFP\orig_movies\170519_Data\170519_pre_003GFP_BS_fxycMS.mat')
% fxycMScalm=fxycMS;
% [fxycMSCohortsCALM,MMM,MMS,Cohorts]=SplitIntoCohorts_fxycMS(fxycMScalm);
% figure
% YL=[];
% for i=1:length(fxycMSCohortsCALM)
%     
%     [InterM,InterS,MSDifs,MM,MS,MD]=PlotAvTraces_BothAligned_PreserveLT(fxycMSCohortsCALM{i},0,0,MMM/100,MMS/100);
%     hold on
%     %title(strcat('N=',num2str(length(fxycMSCohortsCALM{i}(1,1,:)))))
%     
% end
% 
% load('E:\CME Superfolder\CME Data\170518_Analsis_GFP\orig_movies\170519_Data\170519_pre_004GFP_BS_fxycMS.mat')
% fxycMScalm=fxycMS;
% [fxycMSCohortsCALM,MMM,MMS,Cohorts]=SplitIntoCohorts_fxycMS(fxycMScalm);
% figure
% YL=[];
% for i=1:length(fxycMSCohortsCALM)
%     
%     [InterM,InterS,MSDifs,MM,MS,MD]=PlotAvTraces_BothAligned_PreserveLT(fxycMSCohortsCALM{i},0,0,MMM/100,MMS/100);
%     hold on
%     %title(strcat('N=',num2str(length(fxycMSCohortsCALM{i}(1,1,:)))))
%     
% end

% load('E:\CME Superfolder\CME Data\170518_Analsis_GFP\orig_movies\170519_Data\170519_post_002GFP_BS_fxycMS.mat')
% fxycMScalm=fxycMS;
% [fxycMSCohortsCALM,MMM,MMS,Cohorts]=SplitIntoCohorts_fxycMS(fxycMScalm);
% figure
% YL=[];
% for i=1:length(fxycMSCohortsCALM)
%     
%     [InterM,InterS,MSDifs,MM,MS,MD]=PlotAvTraces_BothAligned_PreserveLT(fxycMSCohortsCALM{i},0,0,MMM/100,MMS/100);
%     hold on
%     %title(strcat('N=',num2str(length(fxycMSCohortsCALM{i}(1,1,:)))))
%     
% end
% 
% load('E:\CME Superfolder\CME Data\170518_Analsis_GFP\orig_movies\170519_Data\170519_post_001GFP_BS_fxycMS.mat')
% fxycMScalm=fxycMS;
% [fxycMSCohortsCALM,MMM,MMS,Cohorts]=SplitIntoCohorts_fxycMS(fxycMScalm);
% figure
% YL=[];
% for i=1:length(fxycMSCohortsCALM)
%     
%     [InterM,InterS,MSDifs,MM,MS,MD]=PlotAvTraces_BothAligned_PreserveLT(fxycMSCohortsCALM{i},0,0,MMM/100,MMS/100);
%     hold on
%     %title(strcat('N=',num2str(length(fxycMSCohortsCALM{i}(1,1,:)))))
%     
% end

load('E:\CME Superfolder\CME Data\170518_Analsis_GFP\orig_movies\170519_Data\170519_post_003GFP_BS_fxycMS.mat')
fxycMScalm=fxycMS;
[fxycMSCohortsCALM,MMM,MMS,Cohorts]=SplitIntoCohorts_fxycMS(fxycMScalm);
figure
YL=[];
for i=1:length(fxycMSCohortsCALM)
    subplot(1,2,1)
    [InterM,InterS,MSDifs,MM,MS,MD,xf]=PlotAvTraces_BothAligned_PreserveLT(fxycMSCohortsCALM{i},0,0,MMM/100,MMS/100);
    hold on
    %title(strcat('N=',num2str(length(fxycMSCohortsCALM{i}(1,1,:)))))
    legend('AP2','CLCa')
    subplot(1,2,2)
    plot(xf,MM./MS)
    hold on
    
end

% load('E:\CME Superfolder\CME Data\170518_Analsis_GFP\orig_movies\170519_Data\170519_post_004GFP_BS_fxycMS.mat')
% fxycMScalm=fxycMS;
% [fxycMSCohortsCALM,MMM,MMS,Cohorts]=SplitIntoCohorts_fxycMS(fxycMScalm);
% figure
% YL=[];
% for i=1:length(fxycMSCohortsCALM)
%     
%     [InterM,InterS,MSDifs,MM,MS,MD]=PlotAvTraces_BothAligned_PreserveLT(fxycMSCohortsCALM{i},0,0,MMM/100,MMS/100);
%     hold on
%     %title(strcat('N=',num2str(length(fxycMSCohortsCALM{i}(1,1,:)))))
%     
% end
