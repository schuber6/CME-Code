Jbs=[];
Jas=[];
nCL40=[];
nCL20=[];
nCL60=[];
nCL80=[];
%40
clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170308_Data_Analysis\orig_movies\003_BS_Cell1';
figpath=strcat(path,'_40pWater');
load(strcat(path,'.mat'))
[Jb,Ja]=FindRelevantJoshSlopes(300,Threshfxyc);
nCL40=[nCL40 sqrt(var(Jb))/sqrt(var(Ja))];
Jbs=[Jbs Jb];
Jas=[Jas Ja];
clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170308_Data_Analysis\orig_movies\003_BS_Cell2';
figpath=strcat(path,'_40pWater');
load(strcat(path,'.mat'))
[Jb,Ja]=FindRelevantJoshSlopes(300,Threshfxyc);
nCL40=[nCL40 sqrt(var(Jb))/sqrt(var(Ja))];
Jbs=[Jbs Jb];
Jas=[Jas Ja];

nSD40b=sqrt(var(Jbs));
nSD40a=sqrt(var(Jas));
nC40=nSD40b/nSD40a;
nEB40=sqrt(var(nCL40))/sqrt(length(nCL40));
nNSa40=length(Jas);
nNSb40=length(Jbs);
nNS40=nNSa40+nNSb40;

Jbs=[];
Jas=[];

%50-70
clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_cell2008_BS_Cell1_Red';
figpath=strcat(path,'_50pWater');
load(strcat(path,'.mat'))
[Jb,Ja]=FindRelevantJoshSlopes(300,Threshfxyc);
nCL60=[nCL60 sqrt(var(Jb))/sqrt(var(Ja))];
Jbs=[Jbs Jb];
Jas=[Jas Ja];
clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_cell2008_BS_Cell2_NoRed';
figpath=strcat(path,'_50pWater');
load(strcat(path,'.mat'))
[Jb,Ja]=FindRelevantJoshSlopes(300,Threshfxyc);
nCL60=[nCL60 sqrt(var(Jb))/sqrt(var(Ja))];
Jbs=[Jbs Jb];
Jas=[Jas Ja];
clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170221_Analysis\orig_movies\001_BS_Crop';
figpath=strcat(path,'_50pWater');
load(strcat(path,'.mat'))
[Jb,Ja]=FindRelevantJoshSlopes(300,Threshfxyc);
nCL60=[nCL60 sqrt(var(Jb))/sqrt(var(Ja))];
Jbs=[Jbs Jb];
Jas=[Jas Ja];
clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170221_Analysis\orig_movies\002_BS_Crop';
OsmoT=165;
figpath=strcat(path,'_64pWater');
load(strcat(path,'.mat'))
[Jb,Ja]=FindRelevantJoshSlopes(OsmoT,Threshfxyc);
nCL60=[nCL60 sqrt(var(Jb))/sqrt(var(Ja))];
Jbs=[Jbs Jb];
Jas=[Jas Ja];

nSD60b=sqrt(var(Jbs));
nSD60a=sqrt(var(Jas));
nC60=nSD60b/nSD60a;
nEB60=sqrt(var(nCL60))/sqrt(length(nCL60));
nNSa60=length(Jas);
nNSb60=length(Jbs);
nNS60=nNSa60+nNSb60;

Jbs=[];
Jas=[];

%70+
clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_cell2011_BS_Cell1_Red';
figpath=strcat(path,'_80pWater');
load(strcat(path,'.mat'))
[Jb,Ja]=FindRelevantJoshSlopes(300,Threshfxyc);
nCL80=[nCL80 sqrt(var(Jb))/sqrt(var(Ja))];
Jbs=[Jbs Jb];
Jas=[Jas Ja];
clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_cell2011_BS_Cell2_NoRed';
figpath=strcat(path,'_80pWater');
load(strcat(path,'.mat'))
[Jb,Ja]=FindRelevantJoshSlopes(300,Threshfxyc);
nCL80=[nCL80 sqrt(var(Jb))/sqrt(var(Ja))];
Jbs=[Jbs Jb];
Jas=[Jas Ja];
clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_cell2011_BS_pCell3_NoRed';
figpath=strcat(path,'_80pWater');
load(strcat(path,'.mat'))
[Jb,Ja]=FindRelevantJoshSlopes(300,Threshfxyc);
nCL80=[nCL80 sqrt(var(Jb))/sqrt(var(Ja))];
Jbs=[Jbs Jb];
Jas=[Jas Ja];
clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_cell2011_BS_pCell4_NoRed';
figpath=strcat(path,'_80pWater');
load(strcat(path,'.mat'))
[Jb,Ja]=FindRelevantJoshSlopes(300,Threshfxyc);
nCL80=[nCL80 sqrt(var(Jb))/sqrt(var(Ja))];
Jbs=[Jbs Jb];
Jas=[Jas Ja];
clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170302_Data_Analysis\orig_movies\fol2_002_BS_Cell1_Red';
figpath=strcat(path,'_75pWater');
load(strcat(path,'.mat'))
[Jb,Ja]=FindRelevantJoshSlopes(300,Threshfxyc);
nCL80=[nCL80 sqrt(var(Jb))/sqrt(var(Ja))];
Jbs=[Jbs Jb];
Jas=[Jas Ja];
clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170221_Analysis\orig_movies\003_BS_Crop';
OsmoT=180;
figpath=strcat(path,'_77pWater');
load(strcat(path,'.mat'))
[Jb,Ja]=FindRelevantJoshSlopes(OsmoT,Threshfxyc);
nCL80=[nCL80 sqrt(var(Jb))/sqrt(var(Ja))];
Jbs=[Jbs Jb];
Jas=[Jas Ja];
clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170221_Analysis\orig_movies\004_BS_Crop';
OsmoT=200;
figpath=strcat(path,'_73pWater');
load(strcat(path,'.mat'))
[Jb,Ja]=FindRelevantJoshSlopes(OsmoT,Threshfxyc);
nCL80=[nCL80 sqrt(var(Jb))/sqrt(var(Ja))];
Jbs=[Jbs Jb];
Jas=[Jas Ja];

nSD80b=sqrt(var(Jbs));
nSD80a=sqrt(var(Jas));
nC80=nSD80b/nSD80a;
nEB80=sqrt(var(nCL80))/sqrt(length(nCL80));
nNSa80=length(Jas);
nNSb80=length(Jbs);
nNS80=nNSa80+nNSb80;

Jbs=[];
Jas=[];

%20
OsmoT=300;
clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170308_Data_Analysis\orig_movies\004_BS_Cell2.mat';
figpath=strcat(path,'_29pWater');
load(path)
[Jb,Ja]=FindRelevantJoshSlopes(OsmoT,Threshfxyc);
nCL20=[nCL20 sqrt(var(Jb))/sqrt(var(Ja))];
Jbs=[Jbs Jb];
Jas=[Jas Ja];
clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170308_Data_Analysis\orig_movies\004_BS_Cell1';
figpath=strcat(path,'_29pWater');
load(strcat(path,'.mat'))
[Jb,Ja]=FindRelevantJoshSlopes(OsmoT,Threshfxyc);
nCL20=[nCL20 sqrt(var(Jb))/sqrt(var(Ja))];
Jbs=[Jbs Jb];
Jas=[Jas Ja];
clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170308_Data_Analysis\orig_movies\002_BS_Cell2';
figpath=strcat(path,'_20pWater');
load(strcat(path,'.mat'))
[Jb,Ja]=FindRelevantJoshSlopes(OsmoT,Threshfxyc);
nCL20=[nCL20 sqrt(var(Jb))/sqrt(var(Ja))];
Jbs=[Jbs Jb];
Jas=[Jas Ja];
clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170308_Data_Analysis\orig_movies\002_BS_Cell1';
figpath=strcat(path,'_20pWater');
load(strcat(path,'.mat'))
[Jb,Ja]=FindRelevantJoshSlopes(OsmoT,Threshfxyc);
nCL20=[nCL20 sqrt(var(Jb))/sqrt(var(Ja))];
Jbs=[Jbs Jb];
Jas=[Jas Ja];
clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170308_Data_Analysis\orig_movies\001_BS_Cell2';
figpath=strcat(path,'_29pWater');
load(strcat(path,'.mat'))
[Jb,Ja]=FindRelevantJoshSlopes(OsmoT,Threshfxyc);
nCL20=[nCL20 sqrt(var(Jb))/sqrt(var(Ja))];
Jbs=[Jbs Jb];
Jas=[Jas Ja];
clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170308_Data_Analysis\orig_movies\001_BS_Cell1';
figpath=strcat(path,'_29pWater');
load(strcat(path,'.mat'))
[Jb,Ja]=FindRelevantJoshSlopes(OsmoT,Threshfxyc);
nCL20=[nCL20 sqrt(var(Jb))/sqrt(var(Ja))];
Jbs=[Jbs Jb];
Jas=[Jas Ja];

nSD20b=sqrt(var(Jbs));
nSD20a=sqrt(var(Jas));
nC20=nSD20b/nSD20a;
nEB20=sqrt(var(nCL20))/sqrt(length(nCL20));
nNSa20=length(Jas);
nNSb20=length(Jbs);
nNS20=nNSa20+nNSb20;

clear Threshfxyc JOSH JOSHF

errorbar([26 40 53.5 78],[nC20 nC40 nC60 nC80],[nEB20 nEB40 nEB60 nEB80])
hold on
