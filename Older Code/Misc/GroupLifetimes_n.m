Jbs=[];
Jas=[];
nLT20L=[];
nLT40L=[];
nLT60L=[];
nLT80L=[];
nLTb20L=[];
nLTb40L=[];
nLTb60L=[];
nLTb80L=[];

%40
clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170308_Data_Analysis\orig_movies\003_BS_Cell1';
figpath=strcat(path,'_40pWater');
load(strcat(path,'.mat'))
[Jb,Ja]=FindRelevantLifetimes(300,Threshfxyc);
nLT40L=[nLT40L mean(Ja)/mean(Jb)];
nLTb40L=[nLTb40L mean(Jb)];
Jbs=[Jbs Jb];
Jas=[Jas Ja];
clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170308_Data_Analysis\orig_movies\003_BS_Cell2';
figpath=strcat(path,'_40pWater');
load(strcat(path,'.mat'))
[Jb,Ja]=FindRelevantLifetimes(300,Threshfxyc);
nLT40L=[nLT40L mean(Ja)/mean(Jb)];
nLTb40L=[nLTb40L mean(Jb)];
Jbs=[Jbs Jb];
Jas=[Jas Ja];

nAv40b=mean(Jbs);
nAv40a=mean(Jas);
nLTC40=nAv40a/nAv40b;
nLTEB40=sqrt(var(nLT40L))/sqrt(length(nLT40L));
nLTEBb40=sqrt(var(nLTb40L))/sqrt(length(nLTb40L));
nNLa40=length(Jas);
nNLb40=length(Jbs);
nNL40=nNLa40+nNLb40;

Jbs=[];
Jas=[];

%50-70
clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_cell2008_BS_Cell1_Red';
figpath=strcat(path,'_50pWater');
load(strcat(path,'.mat'))
[Jb,Ja]=FindRelevantLifetimes(300,Threshfxyc);
nLT60L=[nLT60L mean(Ja)/mean(Jb)];
nLTb60L=[nLTb60L mean(Jb)];
Jbs=[Jbs Jb];
Jas=[Jas Ja];
clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_cell2008_BS_Cell2_NoRed';
figpath=strcat(path,'_50pWater');
load(strcat(path,'.mat'))
[Jb,Ja]=FindRelevantLifetimes(300,Threshfxyc);
nLT60L=[nLT60L mean(Ja)/mean(Jb)];
nLTb60L=[nLTb60L mean(Jb)];
Jbs=[Jbs Jb];
Jas=[Jas Ja];
clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170221_Analysis\orig_movies\001_BS_Crop';
figpath=strcat(path,'_50pWater');
load(strcat(path,'.mat'))
[Jb,Ja]=FindRelevantLifetimes(300,Threshfxyc);
nLT60L=[nLT60L mean(Ja)/mean(Jb)];
nLTb60L=[nLTb60L mean(Jb)];
Jbs=[Jbs Jb];
Jas=[Jas Ja];
clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170221_Analysis\orig_movies\002_BS_Crop';
OsmoT=165;
figpath=strcat(path,'_64pWater');
load(strcat(path,'.mat'))
[Jb,Ja]=FindRelevantLifetimes(OsmoT,Threshfxyc);
nLT60L=[nLT60L mean(Ja)/mean(Jb)];
nLTb60L=[nLTb60L mean(Jb)];
Jbs=[Jbs Jb];
Jas=[Jas Ja];

nAv60b=mean(Jbs);
nAv60a=mean(Jas);
nLTC60=nAv60a/nAv60b;
nLTEB60=sqrt(var(nLT60L))/sqrt(length(nLT60L));
nLTEBb60=sqrt(var(nLTb60L))/sqrt(length(nLTb60L));
nNLa60=length(Jas);
nNLb60=length(Jbs);
nNL60=nNLa60+nNLb60;

Jbs=[];
Jas=[];

%70+
clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_cell2011_BS_Cell1_Red';
figpath=strcat(path,'_80pWater');
load(strcat(path,'.mat'))
[Jb,Ja]=FindRelevantLifetimes(300,Threshfxyc);
nLT80L=[nLT80L mean(Ja)/mean(Jb)];
nLTb80L=[nLTb80L mean(Jb)];
Jbs=[Jbs Jb];
Jas=[Jas Ja];
clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_cell2011_BS_Cell2_NoRed';
figpath=strcat(path,'_80pWater');
load(strcat(path,'.mat'))
[Jb,Ja]=FindRelevantLifetimes(300,Threshfxyc);
nLT80L=[nLT80L mean(Ja)/mean(Jb)];
nLTb80L=[nLTb80L mean(Jb)];
Jbs=[Jbs Jb];
Jas=[Jas Ja];
clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_cell2011_BS_pCell3_NoRed';
figpath=strcat(path,'_80pWater');
load(strcat(path,'.mat'))
[Jb,Ja]=FindRelevantLifetimes(300,Threshfxyc);
nLT80L=[nLT80L mean(Ja)/mean(Jb)];
nLTb80L=[nLTb80L mean(Jb)];
Jbs=[Jbs Jb];
Jas=[Jas Ja];
clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_cell2011_BS_pCell4_NoRed';
figpath=strcat(path,'_80pWater');
load(strcat(path,'.mat'))
[Jb,Ja]=FindRelevantLifetimes(300,Threshfxyc);
nLT80L=[nLT80L mean(Ja)/mean(Jb)];
nLTb80L=[nLTb80L mean(Jb)];
Jbs=[Jbs Jb];
Jas=[Jas Ja];
clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170302_Data_Analysis\orig_movies\fol2_002_BS_Cell1_Red';
figpath=strcat(path,'_75pWater');
load(strcat(path,'.mat'))
[Jb,Ja]=FindRelevantLifetimes(300,Threshfxyc);
nLT80L=[nLT80L mean(Ja)/mean(Jb)];
nLTb80L=[nLTb80L mean(Jb)];
Jbs=[Jbs Jb];
Jas=[Jas Ja];
clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170221_Analysis\orig_movies\003_BS_Crop';
OsmoT=180;
figpath=strcat(path,'_77pWater');
load(strcat(path,'.mat'))
[Jb,Ja]=FindRelevantLifetimes(OsmoT,Threshfxyc);
nLT80L=[nLT80L mean(Ja)/mean(Jb)];
nLTb80L=[nLTb80L mean(Jb)];
Jbs=[Jbs Jb];
Jas=[Jas Ja];
clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170221_Analysis\orig_movies\004_BS_Crop';
OsmoT=200;
figpath=strcat(path,'_73pWater');
load(strcat(path,'.mat'))
[Jb,Ja]=FindRelevantLifetimes(OsmoT,Threshfxyc);
nLT80L=[nLT80L mean(Ja)/mean(Jb)];
nLTb80L=[nLTb80L mean(Jb)];
Jbs=[Jbs Jb];
Jas=[Jas Ja];

nAv80b=mean(Jbs);
nAv80a=mean(Jas);
nLTC80=nAv80a/nAv80b;
nLTEB80=sqrt(var(nLT80L))/sqrt(length(nLT80L));
nLTEBb80=sqrt(var(nLTb80L))/sqrt(length(nLTb80L));
nNLa80=length(Jas);
nNLb80=length(Jbs);
nNL80=nNLa80+nNLb80;

Jbs=[];
Jas=[];

%20
OsmoT=300;
clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170308_Data_Analysis\orig_movies\004_BS_Cell2';
figpath=strcat(path,'_29pWater');
load(strcat(path,'.mat'))
[Jb,Ja]=FindRelevantLifetimes(OsmoT,Threshfxyc);
nLT20L=[nLT20L mean(Ja)/mean(Jb)];
nLTb20L=[nLTb20L mean(Jb)];
Jbs=[Jbs Jb];
Jas=[Jas Ja];
clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170308_Data_Analysis\orig_movies\004_BS_Cell1';
figpath=strcat(path,'_29pWater');
load(strcat(path,'.mat'))
[Jb,Ja]=FindRelevantLifetimes(OsmoT,Threshfxyc);
nLT20L=[nLT20L mean(Ja)/mean(Jb)];
nLTb20L=[nLTb20L mean(Jb)];
Jbs=[Jbs Jb];
Jas=[Jas Ja];
clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170308_Data_Analysis\orig_movies\002_BS_Cell2';
figpath=strcat(path,'_20pWater');
load(strcat(path,'.mat'))
[Jb,Ja]=FindRelevantLifetimes(OsmoT,Threshfxyc);
nLT20L=[nLT20L mean(Ja)/mean(Jb)];
nLTb20L=[nLTb20L mean(Jb)];
Jbs=[Jbs Jb];
Jas=[Jas Ja];
clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170308_Data_Analysis\orig_movies\002_BS_Cell1';
figpath=strcat(path,'_20pWater');
load(strcat(path,'.mat'))
[Jb,Ja]=FindRelevantLifetimes(OsmoT,Threshfxyc);
nLT20L=[nLT20L mean(Ja)/mean(Jb)];
nLTb20L=[nLTb20L mean(Jb)];
Jbs=[Jbs Jb];
Jas=[Jas Ja];
clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170308_Data_Analysis\orig_movies\001_BS_Cell2';
figpath=strcat(path,'_29pWater');
load(strcat(path,'.mat'))
[Jb,Ja]=FindRelevantLifetimes(OsmoT,Threshfxyc);
nLT20L=[nLT20L mean(Ja)/mean(Jb)];
nLTb20L=[nLTb20L mean(Jb)];
Jbs=[Jbs Jb];
Jas=[Jas Ja];
clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170308_Data_Analysis\orig_movies\001_BS_Cell1';
figpath=strcat(path,'_29pWater');
load(strcat(path,'.mat'))
[Jb,Ja]=FindRelevantLifetimes(OsmoT,Threshfxyc);
nLT20L=[nLT20L mean(Ja)/mean(Jb)];
nLTb20L=[nLTb20L mean(Jb)];
Jbs=[Jbs Jb];
Jas=[Jas Ja];

nAv20b=mean(Jbs);
nAv20a=mean(Jas);
nLTC20=nAv20a/nAv20b;
nLTEB20=sqrt(var(nLT20L))/sqrt(length(nLT20L));
nLTEBb20=sqrt(var(nLTb20L))/sqrt(length(nLTb20L));
nNLa20=length(Jas);
nNLb20=length(Jbs);
nNL20=nNLa20+nNLb20;
clear Threshfxyc JOSH JOSHF

errorbar([26 40 53.5 78],[nLTC20 nLTC40 nLTC60 nLTC80],[nLTEB20 nLTEB40 nLTEB60 nLTEB80])
hold on
