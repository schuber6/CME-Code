clear all
folder='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath SI\Movies';
files=FindFiles(folder,'*Red.tif').';
for i=5 %1:length(files)
    window=7;
    TraCKer_2D_subplot(files{i}, window);
end

%%
folder='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath WT\Movies';
files=FindFiles(folder,'*Red.tif').';
for i=1:length(files)
    window=7;
    TraCKer_2D_subplot(files{i}, window);
end

%%
folder='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath SI Low CALM\Movies';
files=FindFiles(folder,'*Red.tif').';
for i=7
    window=7;
    TraCKer_2D_subplot(files{i}, window);
end

%%
clear files

files{1}{1}='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath WT\Movies\wt_006_BS_Red.tif';
files{1}{2}='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath WT\Movies\wt_016_BS_Red.tif';

files{2}{1}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\WT_osmo_3m\Movies\wt_osmo_3m_016_BS_Red.tif';
files{2}{2}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\WT_osmo_3m\Movies\wt_osmo_3m_022_BS_Red.tif';
files{2}{3}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\WT_osmo_3m\Movies\wt_osmo_3m_076_BS_Red.tif';
files{2}{4}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\WT_osmo_3m\Movies\wt_osmo_3m_082_BS_Red.tif';

files{3}{1}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\WT_osmo_10m\Movies\wt_osmo_10m_006_BS_Red.tif';
files{3}{2}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\WT_osmo_10m\Movies\wt_osmo_10m_018_BS_Red.tif';
files{3}{3}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\WT_osmo_10m\Movies\wt_osmo_10m_078_BS_Red.tif';

%No control siRNA movies with very good red signal, so these are from a
%week ago with the same conditions
files{4}{1}='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath SI\Movies\si_024_BS_Red.tif';
files{4}{2}='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath SI\Movies\si_026_BS_Red.tif';

files{5}{1}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\SI_osmo_3m\Movies\si_osmo_3m_028_BS_Red.tif';
files{5}{2}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\SI_osmo_3m\Movies\si_osmo_3m_046_BS_Red.tif';
files{5}{3}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\SI_osmo_3m\Movies\si_osmo_3m_034_BS_Red.tif';
files{5}{4}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\SI_osmo_3m\Movies\si_osmo_3m_058_BS_Red.tif';

files{6}{1}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\SI_osmo_10m\Movies\si_osmo_10m_048_BS_Red.tif';
files{6}{2}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\SI_osmo_10m\Movies\si_osmo_10m_054_BS_Red.tif';
files{6}{3}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\SI_osmo_10m\Movies\si_osmo_10m_030_BS_Red.tif';


for i=[2 3 5 6]
    F=files{i};
    for i2=1:length(F)
        window=5;
        TraCKer_2D_subplot(F{i2}, window);
    end
end

%%

clear files

files{1}{1}='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath WT\Movies\wt_006_BS_Red_Tr.mat';
files{1}{2}='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath WT\Movies\wt_016_BS_Red_Tr.mat';

files{2}{1}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\WT_osmo_3m\Movies\wt_osmo_3m_016_BS_Red_Tr.mat';
files{2}{2}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\WT_osmo_3m\Movies\wt_osmo_3m_022_BS_Red.tif';
files{2}{3}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\WT_osmo_3m\Movies\wt_osmo_3m_076_BS_Red.tif';
files{2}{4}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\WT_osmo_3m\Movies\wt_osmo_3m_082_BS_Red.tif';

files{3}{1}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\WT_osmo_10m\Movies\wt_osmo_10m_006_BS_Red.tif';
files{3}{2}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\WT_osmo_10m\Movies\wt_osmo_10m_018_BS_Red.tif';
files{3}{3}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\WT_osmo_10m\Movies\wt_osmo_10m_078_BS_Red.tif';

%No control siRNA movies with very good red signal, so these are from a
%week ago with the same conditions
files{4}{1}='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath SI\Movies\si_024_BS_Red.tif';
files{4}{2}='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath SI\Movies\si_026_BS_Red.tif';

files{5}{1}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\SI_osmo_3m\Movies\si_osmo_3m_028_BS_Red_Tr.mat';
files{5}{2}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\SI_osmo_3m\Movies\si_osmo_3m_046_BS_Red.tif';
files{5}{3}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\SI_osmo_3m\Movies\si_osmo_3m_034_BS_Red.tif';
files{5}{4}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\SI_osmo_3m\Movies\si_osmo_3m_058_BS_Red.tif';

files{6}{1}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\SI_osmo_10m\Movies\si_osmo_10m_048_BS_Red.tif';
files{6}{2}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\SI_osmo_10m\Movies\si_osmo_10m_054_BS_Red.tif';
files{6}{3}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\SI_osmo_10m\Movies\si_osmo_10m_030_BS_Red.tif';

load(files{5}{1})
tracest=Tracker2Tracest(TraceX,TraceY,TraceINT);
save TrackerTest.mat tracest
filest='TrackerTest.mat';
figure_code_for_scott_StaticArea(movieR,movieR,filetst);