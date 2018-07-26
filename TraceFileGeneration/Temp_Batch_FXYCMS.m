Traces{1}='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\AP2 SI\Traces';
Traces{2}='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\AP2 WT\Traces';
Traces{3}='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath SI\Traces';
Traces{4}='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath WT\Traces';

Movies{1}='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\AP2 SI\Movies';
Movies{2}='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\AP2 WT\Movies';
Movies{3}='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath SI\Movies';
Movies{4}='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath WT\Movies';

for i=1:3
    jC{i}=batch(@MasterSlave_RedMaster,0,{Traces{i},Movies{i}});
end

%% Run after cmeAnalysis finishes this folder and you reformat
i=4;
jC{i}=batch(@MasterSlave_RedMaster,0,{Traces{i},Movies{i}});

%%
Traces{5}='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath SI Low CALM\Traces';
Movies{5}='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath SI Low CALM\Movies';

jC{5}=batch(@MasterSlave_RedMaster,0,{Traces{5},Movies{5}});

Traces{1}='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\AP2 SI\Traces';
Traces{2}='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\AP2 WT\Traces';
Traces{3}='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath SI\Traces';
Traces{4}='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath WT\Traces';

Movies{1}='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\AP2 SI\Movies';
Movies{2}='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\AP2 WT\Movies';
Movies{3}='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath SI\Movies';
Movies{4}='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath WT\Movies';

for i=1:4
    jC{i}=batch(@MasterSlave_GreenMaster,0,{Traces{i},Movies{i}});
end

%%

Traces{1}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\SI_cont\Traces';
Traces{2}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\WT_cont\Traces';
Traces{3}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\SI_osmo_3m\Traces';
Traces{4}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\SI_osmo_10m\Traces';
Traces{5}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\WT_osmo_3m\Traces';
Traces{6}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\WT_osmo_10m\Traces';


Movies{1}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\SI_cont\Movies';
Movies{2}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\WT_cont\Movies';
Movies{3}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\SI_osmo_3m\Movies';
Movies{4}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\SI_osmo_10m\Movies';
Movies{5}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\WT_osmo_3m\Movies';
Movies{6}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\WT_osmo_10m\Movies';

for i=1:6
    jC{i}=batch(@MasterSlave_RedMaster,0,{Traces{i},Movies{i}});
end