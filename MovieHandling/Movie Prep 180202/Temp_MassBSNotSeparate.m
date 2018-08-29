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

folder='E:\CME Superfolder\CME Data\180821 DSI Omso Analysis\Data_21';
movies=FindFiles(folder,'*.tif');
oddback='E:\CME Superfolder\CME Data\180821 DSI Omso Analysis\AVG_background_Green.tif';
evenback='E:\CME Superfolder\CME Data\180821 DSI Omso Analysis\AVG_background_Red.tif';
for i=1:length(movies)
    if isempty(strfind(movies{i},'background'))
        new=strcat(movies{i}(1:end-4),'_BS.tif');
        BackgroundSubtractTogether_2Channel(movies{i},new,oddback,evenback)
    end
end

% folder='E:\CME Superfolder\CME Data\180529_AllSUM_Green\WT\Data';
% movies=FindFiles(folder,'*040*.tif');
% oddback='E:\CME Superfolder\CME Data\180529_AllSUM_Green\WT\AVG_170406_background_100g_50r_RFP.tif';
% evenback='E:\CME Superfolder\CME Data\180529_AllSUM_Green\WT\AVG_170406_background_100g_50r_GFP.tif';
% for i=1:length(movies)
%     if isempty(strfind(movies{i},'background'))
%         new=strcat(movies{i}(1:end-4),'_BS.tif');
%         BackgroundSubtractTogether_2Channel(movies{i},new,oddback,evenback)
%     end
% end
% 
% folder='E:\CME Superfolder\CME Data\180529_AllSUM_Green\WT\Data';
% movies=FindFiles(folder,'*050*.tif');
% oddback='E:\CME Superfolder\CME Data\180529_AllSUM_Green\WT\AVG_170507_background_100g_50r_Red.tif';
% evenback='E:\CME Superfolder\CME Data\180529_AllSUM_Green\WT\AVG_170507_background_100g_50r_Green.tif';
% for i=1:length(movies)
%     if isempty(strfind(movies{i},'background'))
%         new=strcat(movies{i}(1:end-4),'_BS.tif');
%         BackgroundSubtractTogether_2Channel(movies{i},new,oddback,evenback)
%     end
% end
% 
% folder='E:\CME Superfolder\CME Data\180529_AllSUM_Green\WT\Data';
% movies=FindFiles(folder,'*051*.tif');
% oddback='E:\CME Superfolder\CME Data\180529_AllSUM_Green\WT\AVG_170512_background_100g_50r_Red.tif';
% evenback='E:\CME Superfolder\CME Data\180529_AllSUM_Green\WT\AVG_170512_background_100g_50r_Green.tif';
% for i=1:length(movies)
%     if isempty(strfind(movies{i},'background'))
%         new=strcat(movies{i}(1:end-4),'_BS.tif');
%         BackgroundSubtractTogether_2Channel(movies{i},new,oddback,evenback)
%     end
% end