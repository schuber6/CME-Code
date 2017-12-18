CDC40=[];
CDC20=[];
CDC60=[];
CDC80=[];

IDC40=[];
IDC20=[];
IDC60=[];
IDC80=[];

PreIs40=[];
PreCs40=[];
PreIs60=[];
PreCs60=[];
PreIs80=[];
PreCs80=[];
PreIs20=[];
PreCs20=[];

%40% water group
clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_008_BS_Cell1_Red';
load(strcat(path,'.mat'))
ICWrapper_NoPlot;
CDC40=[CDC40 PreConcD/PostConcD];
IDC40=[IDC40 PreInitD/PostInitD];
PreIs40=[PreIs40 PreInitD];
PreCs40=[PreCs40 PreConcD];

clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_008_BS_pCell2_NoRed';
load(strcat(path,'.mat'))
ICWrapper_NoPlot;
CDC40=[CDC40 PreConcD/PostConcD];
IDC40=[IDC40 PreInitD/PostInitD];
PreIs40=[PreIs40 PreInitD];
PreCs40=[PreCs40 PreConcD];

clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170302_Data_Analysis\orig_movies\fol2_006_BS_Cell1_Red';
load(strcat(path,'.mat'))
ICWrapper_NoPlot;
CDC40=[CDC40 PreConcD/PostConcD];
IDC40=[IDC40 PreInitD/PostInitD];
PreIs40=[PreIs40 PreInitD];
PreCs40=[PreCs40 PreConcD];

clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170302_Data_Analysis\orig_movies\fol2_006_BS_Cell2_NoRed';
load(strcat(path,'.mat'))
ICWrapper_NoPlot;
CDC40=[CDC40 PreConcD/PostConcD];
IDC40=[IDC40 PreInitD/PostInitD];
PreIs40=[PreIs40 PreInitD];
PreCs40=[PreCs40 PreConcD];

clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170302_Data_Analysis\orig_movies\fol2_006_BS_Cell3_NoRed_Unattached';
load(strcat(path,'.mat'))
ICWrapper_NoPlot;
CDC40=[CDC40 PreConcD/PostConcD];
IDC40=[IDC40 PreInitD/PostInitD];
PreIs40=[PreIs40 PreInitD];
PreCs40=[PreCs40 PreConcD];

clear Threshfxyc JOSH JOSHF

CM40=mean(CDC40);
IM40=mean(IDC40);
EBC40=sqrt(var(CDC40))/sqrt(length(CDC40));
EBI40=sqrt(var(IDC40))/sqrt(length(IDC40));
PIM40=mean(PreIs40);
PCM40=mean(PreCs40);
EBPI40=sqrt(var(PreIs40))/sqrt(length(PreIs40));
EBPC40=sqrt(var(PreCs40))/sqrt(length(PreCs40));



%50-70
clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_010_BS_Cell1_Red';
load(strcat(path,'.mat'))
ICWrapper_NoPlot;
CDC60=[CDC60 PreConcD/PostConcD];
IDC60=[IDC60 PreInitD/PostInitD];
PreIs60=[PreIs60 PreInitD];
PreCs60=[PreCs60 PreConcD];

clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_010_BS_Cell2_NoRed';
load(strcat(path,'.mat'))
ICWrapper_NoPlot;
CDC60=[CDC60 PreConcD/PostConcD];
IDC60=[IDC60 PreInitD/PostInitD];
PreIs60=[PreIs60 PreInitD];
PreCs60=[PreCs60 PreConcD];

clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_010_BS_Cell3_NoRed';
load(strcat(path,'.mat'))
ICWrapper_NoPlot;
CDC60=[CDC60 PreConcD/PostConcD];
IDC60=[IDC60 PreInitD/PostInitD];
PreIs60=[PreIs60 PreInitD];
PreCs60=[PreCs60 PreConcD];

clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170302_Data_Analysis\orig_movies\fol2_008_BS_Cell1_Red';
load(strcat(path,'.mat'))
ICWrapper_NoPlot;
CDC60=[CDC60 PreConcD/PostConcD];
IDC60=[IDC60 PreInitD/PostInitD];
PreIs60=[PreIs60 PreInitD];
PreCs60=[PreCs60 PreConcD];

clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170302_Data_Analysis\orig_movies\fol2_008_BS_Cell2_DimRed';
load(strcat(path,'.mat'))
ICWrapper_NoPlot;
CDC60=[CDC60 PreConcD/PostConcD];
IDC60=[IDC60 PreInitD/PostInitD];
PreIs60=[PreIs60 PreInitD];
PreCs60=[PreCs60 PreConcD];

clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170302_Data_Analysis\orig_movies\fol2_008_BS_Cell3_NoRed';
load(strcat(path,'.mat'))
ICWrapper_NoPlot;
CDC60=[CDC60 PreConcD/PostConcD];
IDC60=[IDC60 PreInitD/PostInitD];
PreIs60=[PreIs60 PreInitD];
PreCs60=[PreCs60 PreConcD];


CM60=mean(CDC60);
IM60=mean(IDC60);
EBC60=sqrt(var(CDC60))/sqrt(length(CDC60));
EBI60=sqrt(var(IDC60))/sqrt(length(IDC60));
PIM60=mean(PreIs60);
PCM60=mean(PreCs60);
EBPI60=sqrt(var(PreIs60))/sqrt(length(PreIs60));
EBPC60=sqrt(var(PreCs60))/sqrt(length(PreCs60));

%70+
clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_013_BS_Cell1_Red';
load(strcat(path,'.mat'))
ICWrapper_NoPlot;
CDC80=[CDC80 PreConcD/PostConcD];
IDC80=[IDC80 PreInitD/PostInitD];
PreIs80=[PreIs80 PreInitD];
PreCs80=[PreCs80 PreConcD];

clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_013_BS_Cell2_NoRed';
load(strcat(path,'.mat'))
ICWrapper_NoPlot;
CDC80=[CDC80 PreConcD/PostConcD];
IDC80=[IDC80 PreInitD/PostInitD];
PreIs80=[PreIs80 PreInitD];
PreCs80=[PreCs80 PreConcD];

clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_013_BS_pCell3_NoRed';
load(strcat(path,'.mat'))
ICWrapper_NoPlot;
CDC80=[CDC80 PreConcD/PostConcD];
IDC80=[IDC80 PreInitD/PostInitD];
PreIs80=[PreIs80 PreInitD];
PreCs80=[PreCs80 PreConcD];

clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170302_Data_Analysis\orig_movies\fol2_010_BS_Cell1_Red';
load(strcat(path,'.mat'))
ICWrapper_NoPlot;
CDC80=[CDC80 PreConcD/PostConcD];
IDC80=[IDC80 PreInitD/PostInitD];
PreIs80=[PreIs80 PreInitD];
PreCs80=[PreCs80 PreConcD];

clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170302_Data_Analysis\orig_movies\fol2_010_BS_Cell2_Red';
load(strcat(path,'.mat'))
ICWrapper_NoPlot;
CDC80=[CDC80 PreConcD/PostConcD];
IDC80=[IDC80 PreInitD/PostInitD];
PreIs80=[PreIs80 PreInitD];
PreCs80=[PreCs80 PreConcD];

clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170302_Data_Analysis\orig_movies\fol2_010_BS_pCell3_NoRed';
load(strcat(path,'.mat'))
ICWrapper_NoPlot;
CDC80=[CDC80 PreConcD/PostConcD];
IDC80=[IDC80 PreInitD/PostInitD];
PreIs80=[PreIs80 PreInitD];
PreCs80=[PreCs80 PreConcD];

clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170302_Data_Analysis\orig_movies\fol2_010_BS_pCell4_NoRed';
load(strcat(path,'.mat'))
ICWrapper_NoPlot;
CDC80=[CDC80 PreConcD/PostConcD];
IDC80=[IDC80 PreInitD/PostInitD];
PreIs80=[PreIs80 PreInitD];
PreCs80=[PreCs80 PreConcD];

clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170302_Data_Analysis\orig_movies\fol2_010_BS_Cell5_NoRed';
load(strcat(path,'.mat'))
ICWrapper_NoPlot;
CDC80=[CDC80 PreConcD/PostConcD];
IDC80=[IDC80 PreInitD/PostInitD];
PreIs80=[PreIs80 PreInitD];
PreCs80=[PreCs80 PreConcD];


CM80=mean(CDC80);
IM80=mean(IDC80);
EBC80=sqrt(var(CDC80))/sqrt(length(CDC80));
EBI80=sqrt(var(IDC80))/sqrt(length(IDC80));
PIM80=mean(PreIs80);
PCM80=mean(PreCs80);
EBPI80=sqrt(var(PreIs80))/sqrt(length(PreIs80));
EBPC80=sqrt(var(PreCs80))/sqrt(length(PreCs80));

%20
clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_004_BS_Cell1_Red';
figpath=strcat(path,'_20pWater');
load(strcat(path,'.mat'))
ICWrapper_NoPlot;
CDC20=[CDC20 PreConcD/PostConcD];
IDC20=[IDC20 PreInitD/PostInitD];
PreIs20=[PreIs20 PreInitD];
PreCs20=[PreCs20 PreConcD];

clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_004_BS_Cell2_NoRed';
figpath=strcat(path,'_20pWater');
load(strcat(path,'.mat'))
ICWrapper_NoPlot;
CDC20=[CDC20 PreConcD/PostConcD];
IDC20=[IDC20 PreInitD/PostInitD];
PreIs20=[PreIs20 PreInitD];
PreCs20=[PreCs20 PreConcD];

clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_004_BS_Cell3_NoRed';
figpath=strcat(path,'_20pWater');
load(strcat(path,'.mat'))
ICWrapper_NoPlot;
CDC20=[CDC20 PreConcD/PostConcD];
IDC20=[IDC20 PreInitD/PostInitD];
PreIs20=[PreIs20 PreInitD];
PreCs20=[PreCs20 PreConcD];

clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170302_Data_Analysis\orig_movies\fol2_004_BS_Cell1_Red';
figpath=strcat(path,'_20pWater');
load(strcat(path,'.mat'))
ICWrapper_NoPlot;
CDC20=[CDC20 PreConcD/PostConcD];
IDC20=[IDC20 PreInitD/PostInitD];
PreIs20=[PreIs20 PreInitD];
PreCs20=[PreCs20 PreConcD];


CM20=mean(CDC20);
IM20=mean(IDC20);
EBC20=sqrt(var(CDC20))/sqrt(length(CDC20));
EBI20=sqrt(var(IDC20))/sqrt(length(IDC20));
PIM20=mean(PreIs20);
PCM20=mean(PreCs20);
EBPI20=sqrt(var(PreIs20))/sqrt(length(PreIs20));
EBPC20=sqrt(var(PreCs20))/sqrt(length(PreCs20));

clear Threshfxyc JOSH JOSHF

