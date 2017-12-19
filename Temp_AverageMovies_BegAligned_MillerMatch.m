clear all
exp_name='E:\CME Superfolder\CME Data\170906_Analysis\orig_movies';
%SlaveFolder='E:\CME Superfolder\CME Data\170906_CALM_CLCa_Osmo';
%SlaveFolder='E:\CME Superfolder\CME Data\170518_Analysis\170519_movies';
%exp_name='E:\CME Superfolder\CME Data\170518_Analsis_GFP\orig_movies\170519_Data';
omd=fullfile(exp_name);
tmpd = dir(fullfile(omd,'*medB.mat'));
MMcalm=cell(1,21);
usedc=[2 3 5 6 7 9 10];
for i0=1:length(usedc)
    i=usedc(i0);
    movies{i} = fullfile(omd,tmpd(i).name);
    fileFXYC{i}=strcat(movies{i}(1:end-4),'.mat');

load(fileFXYC{i})
fxycMScalm{i0}=fxycMS;

%[InterM,InterS,MSDifs,MM,MS,MD]=PlotAvTraces_BeginningAligned_wPrev_BestCorr(fxycMScalm);

end



exp_name='E:\CME Superfolder\CME Data\170518_Analsis_GFP\orig_movies\170519_Data';
%SlaveFolder='E:\CME Superfolder\CME Data\170906_CALM_CLCa_Osmo';
%SlaveFolder='E:\CME Superfolder\CME Data\170518_Analysis\170519_movies';
%exp_name='E:\CME Superfolder\CME Data\170518_Analsis_GFP\orig_movies\170519_Data';
omd=fullfile(exp_name);
tmpd = dir(fullfile(omd,'*medB.mat'));
MMap2=cell(1,21);
for i=1:length(tmpd)
    movies{i} = fullfile(omd,tmpd(i).name);
    fileFXYC{i}=strcat(movies{i}(1:end-4),'.mat');


load(fileFXYC{i})
fxycMSap2{i}=fxycMS;

%[InterM,InterS,MSDifs,MM,MS,MD]=PlotAvTraces_BeginningAligned_wPrev_BestCorr(fxycMScalm);

end

CompareAvTraces_BegAligned_30s_wPrev_MultiMovie(fxycMScalm,fxycMSap2);

% for i2=1:21
%     MMa(i2)=mean(MMap2{i2});
%     usedc=[2 3 5 6 7 9 10]; %find(MMcalm{i2}<10);
%     MMc(i2)=mean(MMcalm{i2}(usedc));
% end
% t=-30:3:30;
% figure
% %plot(t,MSap2,'--r')
% %hold on
% %plot(t,MScalm,'r')
% plot(t,MMa,'r')
% hold on
% plot(t,MMc,'g')
% %legend('Clathrin from AP2 cells','Clathrin from CALM cells','AP2 from AP2 cells','CALM from CALM cells')
% legend('AP2','CALM')
% xlim([-30 20])