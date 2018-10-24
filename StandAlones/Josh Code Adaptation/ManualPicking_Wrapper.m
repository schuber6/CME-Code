% clear movie
% movie{2}='E:\CME Superfolder\CME Data\180412_SUM_CALM_AP2_GoodData\RedTraces\AP2 CALM\movies\ap2_sirna_osmo85p_2dt_50pred_005_BS_Cell1_Red.tif';
% movie{1}='E:\CME Superfolder\CME Data\180412_SUM_CALM_AP2_GoodData\RedTraces\AP2 CALM\movies\170409_osmo85p_2dt_009_BS_Cell1_Red.tif';
% file{1}='E:\CME Superfolder\CME Data\180412_SUM_CALM_AP2_GoodData\RedTraces\AP2 CALM\nosirna_tracest_manual.mat';
% file{2}='E:\CME Superfolder\CME Data\180412_SUM_CALM_AP2_GoodData\RedTraces\AP2 CALM\sirna_tracest_manual.mat';
% folder='E:\CME Superfolder\CME Data\180412_SUM_CALM_AP2_GoodData\RedTraces\AP2 CALM';
% files=FindFiles(folder,'*.mat').';
% load(files{2})
% tracest=EmptyTracest(); %FXYCMS2Tracest(FXYCMS);
% save(file{2},'tracest')

%Creating empty trace file. Commented so I wouldn't do it accidentally.

%%
clear movie
movieR{2}='E:\CME Superfolder\CME Data\180412_SUM_CALM_AP2_GoodData\RedTraces\AP2 CALM\movies\ap2_sirna_osmo85p_2dt_50pred_005_BS_Cell1_Red.tif';
movieR{1}='E:\CME Superfolder\CME Data\180412_SUM_CALM_AP2_GoodData\RedTraces\AP2 CALM\movies\170409_osmo85p_2dt_009_BS_Cell1_Red.tif';
movieG{2}='E:\CME Superfolder\CME Data\180412_SUM_CALM_AP2_GoodData\RedTraces\AP2 CALM\movies\ap2_sirna_osmo85p_2dt_50pred_005_BS_Cell1_Green.tif';
movieG{1}='E:\CME Superfolder\CME Data\180412_SUM_CALM_AP2_GoodData\RedTraces\AP2 CALM\movies\170409_osmo85p_2dt_009_BS_Cell1_Green.tif';
file{1}='E:\CME Superfolder\CME Data\180412_SUM_CALM_AP2_GoodData\RedTraces\AP2 CALM\nosirna_tracest_manual.mat';
file{2}='E:\CME Superfolder\CME Data\180412_SUM_CALM_AP2_GoodData\RedTraces\AP2 CALM\sirna_tracest_manual.mat';
i=2;
figure_code_for_scott(movieR{i},movieR{i},file{i})

%%

folder='E:\CME Superfolder\CME Data\180420_SUM_CALM_AP2_SIRNA\Isolated Cells\Split Channels';
files=FindFiles(folder,'*FXYCMS.mat').';
i=12;
load(files{i})
movieR=strcat(files{i}(1:end-11),'.tif');
movieG=strcat(files{i}(1:end-14),'Green.tif');
%filetst=strcat(files{i}(1:end-11),'Empty_tst.mat');
filetst=strcat(files{i}(1:end-11),'_tst.mat');
tracest=EmptyTracest();
tracest=FXYCMS2Tracest(FXYCMS);
%save(filetst,'tracest')
combined_analysis_code(movieR,movieR,filetst);

%%
load(filetst)

%%
clear all
movieR='Z:\Josh\random_movies_from_other_people\TIRF - SIM data_Betzig and Dong Li\COS7 cells\COS7-clathrin_6sec_cycle_time.tif';
file='Z:\Josh\random_movies_from_other_people\TIRF - SIM data_Betzig and Dong Li\COS7 cells\COS7-6s-donuts.mat';
load(file)
nsta=nsta_donuts;
inds=[];
for i=1:length(nsta)
    if sum(nsta(i).donut)>=0
        inds=[inds i];
    end
end
nsta_donuts=nsta_donuts(inds);
tracest=NSTA2Tracest(nsta_donuts);
filetst='E:\CME Superfolder\CME Data\DonutTST.mat';
save(filetst,'tracest')
combined_analysis_code(movieR,movieR,filetst);

