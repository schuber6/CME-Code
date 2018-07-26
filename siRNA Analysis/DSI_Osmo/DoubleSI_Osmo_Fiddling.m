%Cell 1 = wt control
%Cell 2 = wt 3m osmo
%Cell 3 = wt 10m osmo
%Cell 4 = si control
%Cell 5 = si 3m osmo
%Cell 6 = si 10m osmo

clear files
load('DSIOsmo_ThreshData.mat')
AreaC{2}=Area{2}([3 4],1);
%AreaC{2}=Area{2}([3 4 6 7],1);
AreaC{3}=Area{3}([1 3],1);
%AreaC{3}=Area{3}([1 3 6],1);
AreaC{5}=Area{5}([1 4],1);
%AreaC{5}=Area{5}([1 4 2 6],1);
AreaC{6}=Area{6}([4 5],1);
%AreaC{6}=Area{6}([4 5 1],1);
load('DoubleSIRNA_ManualCytosolData.mat')
AreaC{1}=Area_WT([1 4]);
AreaC{4}=Area_WT([1 2]);

% files{1}{1}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\WT_cont\Movies\wt_cont_020_BS_Red_FXYCMS.mat';
% files{1}{2}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\WT_cont\Movies\wt_cont_074_BS_Red_FXYCMS.mat';
files{1}{1}='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath WT\Movies\wt_006_BS_Red_FXYCMS.mat';
files{1}{2}='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath WT\Movies\wt_016_BS_Red_FXYCMS.mat';

files{2}{1}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\WT_osmo_3m\Movies\wt_osmo_3m_016_BS_Red_FXYCMS.mat';
files{2}{2}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\WT_osmo_3m\Movies\wt_osmo_3m_022_BS_Red_FXYCMS.mat';
% files{2}{3}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\WT_osmo_3m\Movies\wt_osmo_3m_076_BS_Red_FXYCMS.mat';
% files{2}{4}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\WT_osmo_3m\Movies\wt_osmo_3m_082_BS_Red_FXYCMS.mat';

files{3}{1}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\WT_osmo_10m\Movies\wt_osmo_10m_006_BS_Red_FXYCMS.mat';
files{3}{2}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\WT_osmo_10m\Movies\wt_osmo_10m_018_BS_Red_FXYCMS.mat';
% files{3}{3}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\WT_osmo_10m\Movies\wt_osmo_10m_078_BS_Red_FXYCMS.mat';

%No control siRNA movies with very good red signal, so these are from a
%week ago with the same conditions
files{4}{1}='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath SI\Movies\si_024_BS_Red_FXYCMS.mat';
files{4}{2}='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath SI\Movies\si_026_BS_Red_FXYCMS.mat';

files{5}{1}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\SI_osmo_3m\Movies\si_osmo_3m_028_BS_Red_FXYCMS.mat';
files{5}{2}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\SI_osmo_3m\Movies\si_osmo_3m_046_BS_Red_FXYCMS.mat';
% files{5}{3}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\SI_osmo_3m\Movies\si_osmo_3m_034_BS_Red_FXYCMS.mat';
% files{5}{4}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\SI_osmo_3m\Movies\si_osmo_3m_058_BS_Red_FXYCMS.mat';

files{6}{1}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\SI_osmo_10m\Movies\si_osmo_10m_048_BS_Red_FXYCMS.mat';
files{6}{2}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\SI_osmo_10m\Movies\si_osmo_10m_054_BS_Red_FXYCMS.mat';
% files{6}{3}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\SI_osmo_10m\Movies\si_osmo_10m_030_BS_Red_FXYCMS.mat';

%%

StackedBars(files{1},files{4},'WT','SI',1,AreaC{1},AreaC{4});
title('Control')
StackedBars(files{2},files{5},'WT','SI',2,AreaC{2},AreaC{5});
title('3 Minutes After Osmotic Shock')
StackedBars(files{3},files{6},'WT','SI',3,AreaC{3},AreaC{6});
title('10 Minutes After Osmotic Shock')

%%
figure
subplot(1,3,1)
InitiationConclusionPlot(files{1},files{4},AreaC{1},AreaC{4});
title('Control')
subplot(1,3,2)
InitiationConclusionPlot(files{2},files{5},AreaC{2},AreaC{5});
title('3 Minutes After Osmotic Shock')
subplot(1,3,3)
InitiationConclusionPlot(files{3},files{6},AreaC{3},AreaC{6});
title('10 Minutes After Osmotic Shock')

subplot(1,3,2)
ylim([0 .2])
subplot(1,3,3)
ylim([0 .2])

%%
clear MSD SSD
[MSD{1}(:,1),SSD{1}(:,1),MSD{1}(:,2),SSD{1}(:,2)]=JoshSlopeHists_SIRNA(files{1},files{4});
[MSD{2}(:,1),SSD{2}(:,1),MSD{2}(:,2),SSD{2}(:,2)]=JoshSlopeHists_SIRNA(files{2},files{5});
[MSD{3}(:,1),SSD{3}(:,1),MSD{3}(:,2),SSD{3}(:,2)]=JoshSlopeHists_SIRNA(files{3},files{6});

%%
MasterSlaveDataOverview(files{1},files{4})
MasterSlaveDataOverview(files{2},files{5})
MasterSlaveDataOverview(files{3},files{6})

%%

CohortBoxplots(files{1},files{4})