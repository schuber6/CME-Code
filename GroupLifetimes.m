Jbs=[];
Jas=[];
LT20L=[];
LT40L=[];
LT60L=[];
LT80L=[];
LTb20L=[];
LTb40L=[];
LTb60L=[];
LTb80L=[];

%40% water group
clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_008_BS_Cell1_Red';
load(strcat(path,'.mat'))
[Jb,Ja]=FindRelevantLifetimes(300,Threshfxyc);
LT40L=[LT40L mean(Ja)/mean(Jb)];
LTb40L=[LTb40L mean(Jb)];
Jbs=[Jbs Jb];
Jas=[Jas Ja];
clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_008_BS_pCell2_NoRed';
load(strcat(path,'.mat'))
[Jb,Ja]=FindRelevantLifetimes(300,Threshfxyc);
LT40L=[LT40L mean(Ja)/mean(Jb)];
LTb40L=[LTb40L mean(Jb)];
Jbs=[Jbs Jb];
Jas=[Jas Ja];
clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170302_Data_Analysis\orig_movies\fol2_006_BS_Cell1_Red';
load(strcat(path,'.mat'))
[Jb,Ja]=FindRelevantLifetimes(300,Threshfxyc);
LT40L=[LT40L mean(Ja)/mean(Jb)];
LTb40L=[LTb40L mean(Jb)];
Jbs=[Jbs Jb];
Jas=[Jas Ja];
clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170302_Data_Analysis\orig_movies\fol2_006_BS_Cell2_NoRed';
load(strcat(path,'.mat'))
[Jb,Ja]=FindRelevantLifetimes(300,Threshfxyc);
LT40L=[LT40L mean(Ja)/mean(Jb)];
LTb40L=[LTb40L mean(Jb)];
Jbs=[Jbs Jb];
Jas=[Jas Ja];
clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170302_Data_Analysis\orig_movies\fol2_006_BS_Cell3_NoRed_Unattached';
load(strcat(path,'.mat'))
[Jb,Ja]=FindRelevantLifetimes(300,Threshfxyc);
LT40L=[LT40L mean(Ja)/mean(Jb)];
LTb40L=[LTb40L mean(Jb)];
Jbs=[Jbs Jb];
Jas=[Jas Ja];
clear Threshfxyc JOSH JOSHF

Av40b=mean(Jbs);
Av40a=mean(Jas);
LTEBb40=sqrt(var(LTb40L))/sqrt(length(LTb40L));
LTC40=Av40a/Av40b;
LTEB40=sqrt(var(LT40L))/sqrt(length(LT40L));
NLa40=length(Jas);
NLb40=length(Jbs);
NL40=NLa40+NLb40;

Jbs=[];
Jas=[];


%50-70
clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_010_BS_Cell1_Red';
load(strcat(path,'.mat'))
[Jb,Ja]=FindRelevantLifetimes(300,Threshfxyc);
LT60L=[LT60L mean(Ja)/mean(Jb)];
LTb60L=[LTb60L mean(Jb)];
Jbs=[Jbs Jb];
Jas=[Jas Ja];
clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_010_BS_Cell2_NoRed';
load(strcat(path,'.mat'))
[Jb,Ja]=FindRelevantLifetimes(300,Threshfxyc);
LT60L=[LT60L mean(Ja)/mean(Jb)];
LTb60L=[LTb60L mean(Jb)];
Jbs=[Jbs Jb];
Jas=[Jas Ja];
clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_010_BS_Cell3_NoRed';
load(strcat(path,'.mat'))
[Jb,Ja]=FindRelevantLifetimes(300,Threshfxyc);
LT60L=[LT60L mean(Ja)/mean(Jb)];
LTb60L=[LTb60L mean(Jb)];
Jbs=[Jbs Jb];
Jas=[Jas Ja];
clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170302_Data_Analysis\orig_movies\fol2_008_BS_Cell1_Red';
load(strcat(path,'.mat'))
[Jb,Ja]=FindRelevantLifetimes(300,Threshfxyc);
LT60L=[LT60L mean(Ja)/mean(Jb)];
LTb60L=[LTb60L mean(Jb)];
Jbs=[Jbs Jb];
Jas=[Jas Ja];
clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170302_Data_Analysis\orig_movies\fol2_008_BS_Cell2_DimRed';
load(strcat(path,'.mat'))
[Jb,Ja]=FindRelevantLifetimes(300,Threshfxyc);
LT60L=[LT60L mean(Ja)/mean(Jb)];
LTb60L=[LTb60L mean(Jb)];
Jbs=[Jbs Jb];
Jas=[Jas Ja];
clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170302_Data_Analysis\orig_movies\fol2_008_BS_Cell3_NoRed';
load(strcat(path,'.mat'))
[Jb,Ja]=FindRelevantLifetimes(300,Threshfxyc);
LT60L=[LT60L mean(Ja)/mean(Jb)];
LTb60L=[LTb60L mean(Jb)];
Jbs=[Jbs Jb];
Jas=[Jas Ja];

Av60b=mean(Jbs);
Av60a=mean(Jas);
LTC60=Av60a/Av60b;
LTEB60=sqrt(var(LT60L))/sqrt(length(LT60L));
LTEBb60=sqrt(var(LTb60L))/sqrt(length(LTb60L));
NLa60=length(Jas);
NLb60=length(Jbs);
NL60=NLa60+NLb60;

Jbs=[];
Jas=[];

%70+
clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_013_BS_Cell1_Red';
load(strcat(path,'.mat'))
[Jb,Ja]=FindRelevantLifetimes(300,Threshfxyc);
LT80L=[LT80L mean(Ja)/mean(Jb)];
LTb80L=[LTb80L mean(Jb)];
Jbs=[Jbs Jb];
Jas=[Jas Ja];
clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_013_BS_Cell2_NoRed';
load(strcat(path,'.mat'))
[Jb,Ja]=FindRelevantLifetimes(300,Threshfxyc);
LT80L=[LT80L mean(Ja)/mean(Jb)];
LTb80L=[LTb80L mean(Jb)];
Jbs=[Jbs Jb];
Jas=[Jas Ja];
clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_013_BS_pCell3_NoRed';
load(strcat(path,'.mat'))
[Jb,Ja]=FindRelevantLifetimes(300,Threshfxyc);
LT80L=[LT80L mean(Ja)/mean(Jb)];
LTb80L=[LTb80L mean(Jb)];
Jbs=[Jbs Jb];
Jas=[Jas Ja];
clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170302_Data_Analysis\orig_movies\fol2_010_BS_Cell1_Red';
load(strcat(path,'.mat'))
[Jb,Ja]=FindRelevantLifetimes(300,Threshfxyc);
LT80L=[LT80L mean(Ja)/mean(Jb)];
LTb80L=[LTb80L mean(Jb)];
Jbs=[Jbs Jb];
Jas=[Jas Ja];
clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170302_Data_Analysis\orig_movies\fol2_010_BS_Cell2_Red';
load(strcat(path,'.mat'))
[Jb,Ja]=FindRelevantLifetimes(300,Threshfxyc);
LT80L=[LT80L mean(Ja)/mean(Jb)];
LTb80L=[LTb80L mean(Jb)];
Jbs=[Jbs Jb];
Jas=[Jas Ja];
clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170302_Data_Analysis\orig_movies\fol2_010_BS_pCell3_NoRed';
load(strcat(path,'.mat'))
[Jb,Ja]=FindRelevantLifetimes(300,Threshfxyc);
LT80L=[LT80L mean(Ja)/mean(Jb)];
LTb80L=[LTb80L mean(Jb)];
Jbs=[Jbs Jb];
Jas=[Jas Ja];
clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170302_Data_Analysis\orig_movies\fol2_010_BS_pCell4_NoRed';
load(strcat(path,'.mat'))
[Jb,Ja]=FindRelevantLifetimes(300,Threshfxyc);
LT80L=[LT80L mean(Ja)/mean(Jb)];
LTb80L=[LTb80L mean(Jb)];
Jbs=[Jbs Jb];
Jas=[Jas Ja];
clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170302_Data_Analysis\orig_movies\fol2_010_BS_Cell5_NoRed';
load(strcat(path,'.mat'))
[Jb,Ja]=FindRelevantLifetimes(300,Threshfxyc);
LT80L=[LT80L mean(Ja)/mean(Jb)];
LTb80L=[LTb80L mean(Jb)];
Jbs=[Jbs Jb];
Jas=[Jas Ja];

Av80b=mean(Jbs);
Av80a=mean(Jas);
LTC80=Av80a/Av80b;
LTEB80=sqrt(var(LT80L))/sqrt(length(LT80L));
LTEBb80=sqrt(var(LTb80L))/sqrt(length(LTb80L));
NLa80=length(Jas);
NLb80=length(Jbs);
NL80=NLa80+NLb80;

Jbs=[];
Jas=[];

%20
clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_004_BS_Cell1_Red';
figpath=strcat(path,'_20pWater');
load(strcat(path,'.mat'))
[Jb,Ja]=FindRelevantLifetimes(300,Threshfxyc);
LT20L=[LT20L mean(Ja)/mean(Jb)];
LTb20L=[LTb20L mean(Jb)];
Jbs=[Jbs Jb];
Jas=[Jas Ja];
clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_004_BS_Cell2_NoRed';
figpath=strcat(path,'_20pWater');
load(strcat(path,'.mat'))
[Jb,Ja]=FindRelevantLifetimes(300,Threshfxyc);
LT20L=[LT20L mean(Ja)/mean(Jb)];
LTb20L=[LTb20L mean(Jb)];
Jbs=[Jbs Jb];
Jas=[Jas Ja];
clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_004_BS_Cell3_NoRed';
figpath=strcat(path,'_20pWater');
load(strcat(path,'.mat'))
[Jb,Ja]=FindRelevantLifetimes(300,Threshfxyc);
LT20L=[LT20L mean(Ja)/mean(Jb)];
LTb20L=[LTb20L mean(Jb)];
Jbs=[Jbs Jb];
Jas=[Jas Ja];
clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170302_Data_Analysis\orig_movies\fol2_004_BS_Cell1_Red';
figpath=strcat(path,'_20pWater');
load(strcat(path,'.mat'))
[Jb,Ja]=FindRelevantLifetimes(300,Threshfxyc);
LT20L=[LT20L mean(Ja)/mean(Jb)];
LTb20L=[LTb20L mean(Jb)];
Jbs=[Jbs Jb];
Jas=[Jas Ja];

Av20b=mean(Jbs);
Av20a=mean(Jas);

LTC20=Av20a/Av20b;
LTEB20=sqrt(var(LT20L))/sqrt(length(LT20L));
LTEBb20=sqrt(var(LTb20L))/sqrt(length(LTb20L));
NLa20=length(Jas);
NLb20=length(Jbs);
NL20=NLa20+NLb20;

clear Threshfxyc JOSH JOSHF

errorbar([20 40 57.5 80],[LTC20 LTC40 LTC60 LTC80],[LTEB20 LTEB40 LTEB60 LTEB80],'r')
hold on