% folder='E:\CME Superfolder\CME Data\180110_AP2CLCa_Day2\100pPower';
% %movies=FindFiles(folder,'*.tif');
% oddback='E:\CME Superfolder\CME Data\180110_AP2CLCa_Day2\AVG_background_GFP.tif';
% evenback='E:\CME Superfolder\CME Data\180110_AP2CLCa_Day2\AVG_background_RFP.tif';
% for i=1:length(movies)
%     new=strcat(movies{i}(1:end-4),'_BS.tif');
%     BackgroundSubtractTogether_2Channel(movies{i},new,oddback,evenback)
% end

% folder='E:\CME Superfolder\CME Data\180110_AP2CLCa_Day2\50pPower';
% movies=FindFiles(folder,'*.tif');
% oddback='E:\CME Superfolder\CME Data\180110_AP2CLCa_Day2\AVG_background50p_GFP.tif';
% evenback='E:\CME Superfolder\CME Data\180110_AP2CLCa_Day2\AVG_background50p_RFP.tif';
% for i=1:length(movies)
%     new=strcat(movies{i}(1:end-4),'_BS.tif');
%     BackgroundSubtractTogether_2Channel(movies{i},new,oddback,evenback)
% end
% 
% folder='E:\CME Superfolder\CME Data\180110_AP2CLCa_Day2\50pRed_100pGreen';
% movies=FindFiles(folder,'*.tif');
% oddback='E:\CME Superfolder\CME Data\180110_AP2CLCa_Day2\AVG_background_GFP.tif';
% evenback='E:\CME Superfolder\CME Data\180110_AP2CLCa_Day2\AVG_background50p_RFP.tif';
% for i=1:length(movies)
%     new=strcat(movies{i}(1:end-4),'_BS.tif');
%     BackgroundSubtractTogether_2Channel(movies{i},new,oddback,evenback)
% end

folder='E:\CME Superfolder\CME Data\180201_CALMCLCa_Data\Full';
movies=FindFiles(folder,'*.tif');
oddback='E:\CME Superfolder\CME Data\180201_CALMCLCa_Data\AVG_background_40r_100g_RFP.tif';
evenback='E:\CME Superfolder\CME Data\180201_CALMCLCa_Data\AVG_background_40r_100g_GFP.tif';
for i=1:length(movies)
    new=strcat(movies{i}(1:end-4),'_BS.tif');
    BackgroundSubtractTogether_2Channel(movies{i},new,oddback,evenback)
end