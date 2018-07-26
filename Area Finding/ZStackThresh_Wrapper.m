
folder{1}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\WT_cont\ZStacks';
folder{2}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\WT_osmo_3m\ZStacks';
folder{3}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\WT_osmo_10m\ZStacks';
folder{4}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\SI_cont\ZStacks';
folder{5}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\SI_osmo_3m\ZStacks';
folder{6}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\SI_osmo_3m\ZStacks';

for i=1:6
    [Cyt_BS{i},Area{i},Cyt{i},Back{i},Thresh{i}]=ZStackSumFlourescence(folder{i});
end