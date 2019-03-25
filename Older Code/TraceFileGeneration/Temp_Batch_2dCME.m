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

%%

fg=3;
thresh=10;

j1=batch(@comb_run,0,{'E:\CME Superfolder\CME Data\181227_Umida_30p_Cell006',fg,thresh});

%%

fg=zeros(1,26) +1;
thresh=fg*20;

j1=batch(@comb_run,0,{'E:\CME Superfolder\CME Data\190111_Analysis\100ms',fg,thresh});

%%

fg=zeros(1,22) +1;
thresh=fg*20;

j1=batch(@comb_run,0,{'E:\CME Superfolder\CME Data\190206_JaspOsmo\Day1',fg,thresh});

fg=zeros(1,16) +1;
thresh=fg*20;

j2=batch(@comb_run,0,{'E:\CME Superfolder\CME Data\190206_JaspOsmo\Day2',fg,thresh});

fg=zeros(1,13) +1;
thresh=fg*20;

j2=batch(@comb_run,0,{'E:\CME Superfolder\CME Data\190206_JaspOsmo\Day3',fg,thresh});

%%

% fg=zeros(1,5) +1;
% thresh=fg*20;
% 
% j1=batch(@comb_run,0,{'E:\CME Superfolder\CME Data\190111_Analysis\50ms\squarecrop',fg,thresh});

fg=zeros(1,21) +1;
thresh=fg*20;

j2=batch(@comb_run,0,{'E:\CME Superfolder\CME Data\190111_Analysis\100ms\squarecrop',fg,thresh});

% fg=zeros(1,8) +1;
% thresh=fg*20;
% 
% j2=batch(@comb_run,0,{'E:\CME Superfolder\CME Data\190111_Analysis\200ms\squarecrop',fg,thresh});