fg=zeros(1,7) +2;
thresh=fg*400/2;

j1=batch(@comb_run,0,{'E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\SI_cont',fg,thresh});
j2=batch(@comb_run,0,{'E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\SI_osmo_3m',fg,thresh});
j3=batch(@comb_run,0,{'E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\SI_osmo_10m',fg,thresh});
j4=batch(@comb_run,0,{'E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\WT_cont',fg,thresh});
j5=batch(@comb_run,0,{'E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\WT_osmo_3m',fg,thresh});
j6=batch(@comb_run,0,{'E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\WT_osmo_10m',fg,thresh});

%%

fg=zeros(1,6) +2;
thresh=fg*400/2;

j1=batch(@comb_run,0,{'E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath SI 3',fg,thresh});
j2=batch(@comb_run,0,{'E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath SI 4',fg,thresh});
j3=batch(@comb_run,0,{'E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath SI 5',fg,thresh});