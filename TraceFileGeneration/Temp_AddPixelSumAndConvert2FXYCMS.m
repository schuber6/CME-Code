% protein='AP2';
% mastername='E:\CME Superfolder\CME Data\SinlgeGFP';
% if strcmp(protein,'AP2')
%     exp_name='E:\CME Superfolder\CME Data\171010_Calibrated_AP2_DNM';
%     Good=[8 10 11]; %Best AP2 cells
%     PCol='r';
% end
% if strcmp(protein,'CALM')
%     exp_name='E:\CME Superfolder\CME Data\SinlgeGFP\orig_movies';
%     Good=[11 22 25]; %Best CALM cells
%     PCol='g';
% end
% if strcmp(protein,'Dynamin')
%     exp_name='E:\CME Superfolder\CME Data\171010_Calibrated_AP2_DNM';
%     Good=[15 16 17 18]; %Best DNM cells
%     PCol='b';
% end
% %Good=[15 16 17 18]; %Best DNM cells
% 
% tmpd = dir(fullfile(exp_name,'*.mat'));
% figure
% for i=1:length(Good) %4:7 %1:length(tmpd)
%     subplot(1,3,i)
%     i0=Good(i);
%     movies{i0} = fullfile(exp_name,tmpd(i0).name);
movieS='E:\CME Superfolder\CME Data\180316_TwoColorBeadBleach\500ms_each_channel_continuous_bleach001_TrimmedRed.tif';
movieM='E:\CME Superfolder\CME Data\180316_TwoColorBeadBleach\500ms_each_channel_continuous_bleach001_TrimmedGreen.tif';
newfile=strcat(movieM(1:end-4),'_FXYCMS_NoMax.mat');
%load(movies{i0});
[FXYCMS]=GenerateMasterSlaveINTs_PixelSum(Threshfxyc,movieS,400,movieM);
save(newfile,'FXYCMS')
% end