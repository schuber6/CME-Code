Jbs=[];
Jas=[];
CL40=[];
CL20=[];
CL60=[];
CL80=[];

%40% water group
clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_008_BS_Cell1_Red';
load(strcat(path,'.mat'))
[Jb,Ja]=FindRelevantJoshSlopes(300,Threshfxyc);
CL40=[CL40 sqrt(var(Jb))/sqrt(var(Ja))];
Jbs=[Jbs Jb];
Jas=[Jas Ja];
clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_008_BS_pCell2_NoRed';
load(strcat(path,'.mat'))
[Jb,Ja]=FindRelevantJoshSlopes(300,Threshfxyc);
CL40=[CL40 sqrt(var(Jb))/sqrt(var(Ja))];
Jbs=[Jbs Jb];
Jas=[Jas Ja];
clear Threshfxyc JOSH JOSHF
% path='E:\CME Superfolder\CME Data\170302_Data_Analysis\orig_movies\fol2_006_BS_Cell1_Red';
% load(strcat(path,'.mat'))
% [Jb,Ja]=FindRelevantJoshSlopes(300,Threshfxyc);
% CL40=[CL40 sqrt(var(Jb))/sqrt(var(Ja))];
% Jbs=[Jbs Jb];
% Jas=[Jas Ja];
% clear Threshfxyc JOSH JOSHF
% path='E:\CME Superfolder\CME Data\170302_Data_Analysis\orig_movies\fol2_006_BS_Cell2_NoRed';
% load(strcat(path,'.mat'))
% [Jb,Ja]=FindRelevantJoshSlopes(300,Threshfxyc);
% CL40=[CL40 sqrt(var(Jb))/sqrt(var(Ja))];
% Jbs=[Jbs Jb];
% Jas=[Jas Ja];
% clear Threshfxyc JOSH JOSHF
% path='E:\CME Superfolder\CME Data\170302_Data_Analysis\orig_movies\fol2_006_BS_Cell3_NoRed_Unattached';
% load(strcat(path,'.mat'))
% [Jb,Ja]=FindRelevantJoshSlopes(300,Threshfxyc);
% CL40=[CL40 sqrt(var(Jb))/sqrt(var(Ja))];
% Jbs=[Jbs Jb];
% Jas=[Jas Ja];
% clear Threshfxyc JOSH JOSHF

SD40b=sqrt(var(Jbs));
SD40a=sqrt(var(Jas));
C40=SD40b/SD40a;
EB40=sqrt(var(CL40))/sqrt(length(CL40));
NSa40=length(Jas);
NSb40=length(Jbs);
NS40=NSa40+NSb40;

Jbs=[];
Jas=[];


%50-70
clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_010_BS_Cell1_Red';
load(strcat(path,'.mat'))
[Jb,Ja]=FindRelevantJoshSlopes(300,Threshfxyc);
CL60=[CL60 sqrt(var(Jb))/sqrt(var(Ja))];
Jbs=[Jbs Jb];
Jas=[Jas Ja];
clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_010_BS_Cell2_NoRed';
load(strcat(path,'.mat'))
[Jb,Ja]=FindRelevantJoshSlopes(300,Threshfxyc);
CL60=[CL60 sqrt(var(Jb))/sqrt(var(Ja))];
Jbs=[Jbs Jb];
Jas=[Jas Ja];
clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_010_BS_Cell3_NoRed';
load(strcat(path,'.mat'))
[Jb,Ja]=FindRelevantJoshSlopes(300,Threshfxyc);
CL60=[CL60 sqrt(var(Jb))/sqrt(var(Ja))];
Jbs=[Jbs Jb];
Jas=[Jas Ja];
clear Threshfxyc JOSH JOSHF
% path='E:\CME Superfolder\CME Data\170302_Data_Analysis\orig_movies\fol2_008_BS_Cell1_Red';
% load(strcat(path,'.mat'))
% [Jb,Ja]=FindRelevantJoshSlopes(300,Threshfxyc);
% CL60=[CL60 sqrt(var(Jb))/sqrt(var(Ja))];
% Jbs=[Jbs Jb];
% Jas=[Jas Ja];
clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170302_Data_Analysis\orig_movies\fol2_008_BS_Cell2_DimRed';
load(strcat(path,'.mat'))
[Jb,Ja]=FindRelevantJoshSlopes(300,Threshfxyc);
CL60=[CL60 sqrt(var(Jb))/sqrt(var(Ja))];
Jbs=[Jbs Jb];
Jas=[Jas Ja];
clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170302_Data_Analysis\orig_movies\fol2_008_BS_Cell3_NoRed';
load(strcat(path,'.mat'))
[Jb,Ja]=FindRelevantJoshSlopes(300,Threshfxyc);
CL60=[CL60 sqrt(var(Jb))/sqrt(var(Ja))];
Jbs=[Jbs Jb];
Jas=[Jas Ja];

SD60b=sqrt(var(Jbs));
SD60a=sqrt(var(Jas));
C60=SD60b/SD60a;
EB60=sqrt(var(CL60))/sqrt(length(CL60));
NSa60=length(Jas);
NSb60=length(Jbs);
NS60=NSa60+NSb60;

Jbs=[];
Jas=[];

%70+
% clear Threshfxyc JOSH JOSHF
% path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_013_BS_Cell1_Red';
% load(strcat(path,'.mat'))
% [Jb,Ja]=FindRelevantJoshSlopes(300,Threshfxyc);
% CL80=[CL80 sqrt(var(Jb))/sqrt(var(Ja))];
% Jbs=[Jbs Jb];
% Jas=[Jas Ja];
% clear Threshfxyc JOSH JOSHF
% path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_013_BS_Cell2_NoRed';
% load(strcat(path,'.mat'))
% [Jb,Ja]=FindRelevantJoshSlopes(300,Threshfxyc);
% CL80=[CL80 sqrt(var(Jb))/sqrt(var(Ja))];
% Jbs=[Jbs Jb];
% Jas=[Jas Ja];
% clear Threshfxyc JOSH JOSHF
% path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_013_BS_pCell3_NoRed';
% load(strcat(path,'.mat'))
% [Jb,Ja]=FindRelevantJoshSlopes(300,Threshfxyc);
% CL80=[CL80 sqrt(var(Jb))/sqrt(var(Ja))];
% Jbs=[Jbs Jb];
% Jas=[Jas Ja];
clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170302_Data_Analysis\orig_movies\fol2_010_BS_Cell1_Red';
load(strcat(path,'.mat'))
[Jb,Ja]=FindRelevantJoshSlopes(300,Threshfxyc);
CL80=[CL80 sqrt(var(Jb))/sqrt(var(Ja))];
Jbs=[Jbs Jb];
Jas=[Jas Ja];
clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170302_Data_Analysis\orig_movies\fol2_010_BS_Cell2_Red';
load(strcat(path,'.mat'))
[Jb,Ja]=FindRelevantJoshSlopes(300,Threshfxyc);
CL80=[CL80 sqrt(var(Jb))/sqrt(var(Ja))];
Jbs=[Jbs Jb];
Jas=[Jas Ja];
clear Threshfxyc JOSH JOSHF
% path='E:\CME Superfolder\CME Data\170302_Data_Analysis\orig_movies\fol2_010_BS_pCell3_NoRed';
% load(strcat(path,'.mat'))
% [Jb,Ja]=FindRelevantJoshSlopes(300,Threshfxyc);
% CL80=[CL80 sqrt(var(Jb))/sqrt(var(Ja))];
% Jbs=[Jbs Jb];
% Jas=[Jas Ja];
clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170302_Data_Analysis\orig_movies\fol2_010_BS_pCell4_NoRed';
load(strcat(path,'.mat'))
[Jb,Ja]=FindRelevantJoshSlopes(300,Threshfxyc);
CL80=[CL80 sqrt(var(Jb))/sqrt(var(Ja))];
Jbs=[Jbs Jb];
Jas=[Jas Ja];
clear Threshfxyc JOSH JOSHF
% path='E:\CME Superfolder\CME Data\170302_Data_Analysis\orig_movies\fol2_010_BS_Cell5_NoRed';
% load(strcat(path,'.mat'))
% [Jb,Ja]=FindRelevantJoshSlopes(300,Threshfxyc);
% CL80=[CL80 sqrt(var(Jb))/sqrt(var(Ja))];
% Jbs=[Jbs Jb];
% Jas=[Jas Ja];

SD80b=sqrt(var(Jbs));
SD80a=sqrt(var(Jas));
C80=SD80b/SD80a;
EB80=sqrt(var(CL80))/sqrt(length(CL80));
NSa80=length(Jas);
NSb80=length(Jbs);
NS80=NSa80+NSb80;

Jbs=[];
Jas=[];

%20
clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_004_BS_Cell1_Red';
figpath=strcat(path,'_20pWater');
load(strcat(path,'.mat'))
[Jb,Ja]=FindRelevantJoshSlopes(300,Threshfxyc);
CL20=[CL20 sqrt(var(Jb))/sqrt(var(Ja))];
Jbs=[Jbs Jb];
Jas=[Jas Ja];
clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_004_BS_Cell2_NoRed';
figpath=strcat(path,'_20pWater');
load(strcat(path,'.mat'))
[Jb,Ja]=FindRelevantJoshSlopes(300,Threshfxyc);
CL20=[CL20 sqrt(var(Jb))/sqrt(var(Ja))];
Jbs=[Jbs Jb];
Jas=[Jas Ja];
clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_004_BS_Cell3_NoRed';
figpath=strcat(path,'_20pWater');
load(strcat(path,'.mat'))
[Jb,Ja]=FindRelevantJoshSlopes(300,Threshfxyc);
CL20=[CL20 sqrt(var(Jb))/sqrt(var(Ja))];
Jbs=[Jbs Jb];
Jas=[Jas Ja];
clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170302_Data_Analysis\orig_movies\fol2_004_BS_Cell1_Red';
figpath=strcat(path,'_20pWater');
load(strcat(path,'.mat'))
[Jb,Ja]=FindRelevantJoshSlopes(300,Threshfxyc);
CL20=[CL20 sqrt(var(Jb))/sqrt(var(Ja))];
Jbs=[Jbs Jb];
Jas=[Jas Ja];

SD20b=sqrt(var(Jbs));
SD20a=sqrt(var(Jas));
C20=SD20b/SD20a;
EB20=sqrt(var(CL20))/sqrt(length(CL20));
NSa20=length(Jas);
NSb20=length(Jbs);
NS20=NSa20+NSb20;

clear Threshfxyc JOSH JOSHF

errorbar([20 40 57.5 80],[C20 C40 C60 C80],[EB20 EB40 EB60 EB80],'r')
hold on
