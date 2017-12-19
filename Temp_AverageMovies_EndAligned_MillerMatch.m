exp_name='E:\CME Superfolder\CME Data\170906_Analysis\orig_movies';
%SlaveFolder='E:\CME Superfolder\CME Data\170906_CALM_CLCa_Osmo';
%SlaveFolder='E:\CME Superfolder\CME Data\170518_Analysis\170519_movies';
%exp_name='E:\CME Superfolder\CME Data\170518_Analsis_GFP\orig_movies\170519_Data';
omd=fullfile(exp_name);
tmpd = dir(fullfile(omd,'*medB.mat'));
MMcalm=cell(1,21);
MScalm=cell(1,21);
for i=1:length(tmpd)
    movies{i} = fullfile(omd,tmpd(i).name);
    fileFXYC{i}=strcat(movies{i}(1:end-4),'.mat');

load('E:\CME Superfolder\CME Data\170518_Analsis_GFP\orig_movies\170519_Data\170519_pre_001GFP_BS_fxycMS_prev_medB.mat')
fxycMSap2=fxycMS;
load(fileFXYC{i})
fxycMScalm=fxycMS;
[InterM,InterS,MSDifs,MM,MS,MD]=PlotAvTraces_EndAligned_MaxDecrease(fxycMScalm);
close
for i2=1:length(MM)
    MMcalm{i2}=[MMcalm{i2} MM(i2)];
    MScalm{i2}=[MScalm{i2} MS(i2)];
end

%[InterM,InterS,MSDifs,MM,MS,MD]=PlotAvTraces_BeginningAligned_wPrev_BestCorr(fxycMScalm);
i
end

exp_name='E:\CME Superfolder\CME Data\170518_Analsis_GFP\orig_movies\170519_Data';
%SlaveFolder='E:\CME Superfolder\CME Data\170906_CALM_CLCa_Osmo';
%SlaveFolder='E:\CME Superfolder\CME Data\170518_Analysis\170519_movies';
%exp_name='E:\CME Superfolder\CME Data\170518_Analsis_GFP\orig_movies\170519_Data';
omd=fullfile(exp_name);
tmpd = dir(fullfile(omd,'*post*medB.mat'));
MMap2=cell(1,21);
MSap2=cell(1,21);
for i=1:length(tmpd)
    movies{i} = fullfile(omd,tmpd(i).name);
    fileFXYC{i}=strcat(movies{i}(1:end-4),'.mat');

load('E:\CME Superfolder\CME Data\170518_Analsis_GFP\orig_movies\170519_Data\170519_pre_001GFP_BS_fxycMS_prev_medB.mat')
fxycMSap2=fxycMS;
load(fileFXYC{i})
fxycMScalm=fxycMS;
[InterM,InterS,MSDifs,MM,MS,MD]=PlotAvTraces_EndAligned_MaxDecrease(fxycMScalm);
close
for i2=1:length(MM)
    MMap2{i2}=[MMap2{i2} MM(i2)];
    MSap2{i2}=[MSap2{i2} MS(i2)];
end

%[InterM,InterS,MSDifs,MM,MS,MD]=PlotAvTraces_BeginningAligned_wPrev_BestCorr(fxycMScalm);
i
end

for i2=1:21
    MMa(i2)=mean(MMap2{i2});
    MSa(i2)=mean(MSap2{i2});
    usedc=[2 3 5 6 7 9 10]; %find(MMcalm{i2}<10);
    MMc(i2)=mean(MMcalm{i2}(usedc));
    MSc(i2)=mean(MScalm{i2}(usedc));
end
t=-30:3:30;
figure
%plot(t,MSap2,'--r')
%hold on
%plot(t,MScalm,'r')
plot(t,MMa,'r')
hold on
plot(t,MMc,'g')
plot(t,MSa,'--r')
plot(t,MSc,'--g')
legend('AP2 from AP2 cells','CALM from CALM cells','Clathrin from AP2 cells','Clathrin from CALM cells')
%legend('AP2','CALM')
xlim([-30 20])