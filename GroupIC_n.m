CDCn40=[];
CDCn20=[];
CDCn60=[];
CDCn80=[];

IDCn40=[];
IDCn20=[];
IDCn60=[];
IDCn80=[];

nPreIs40=[];
nPreCs40=[];
nPreIs60=[];
nPreCs60=[];
nPreIs80=[];
nPreCs80=[];
nPreIs20=[];
nPreCs20=[];
%40
clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170308_Data_Analysis\orig_movies\003_BS_Cell1';
figpath=strcat(path,'_40pWater');
load(strcat(path,'.mat'))
ICWrapper_NoPlot;
CDCn40=[CDCn40 PreConcD/PostConcD];
IDCn40=[IDCn40 PreInitD/PostInitD];
nPreIs40=[nPreIs40 PreInitD];
nPreCs40=[nPreCs40 PreConcD];

clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170308_Data_Analysis\orig_movies\003_BS_Cell2';
figpath=strcat(path,'_40pWater');
load(strcat(path,'.mat'))
ICWrapper_NoPlot;
CDCn40=[CDCn40 PreConcD/PostConcD];
IDCn40=[IDCn40 PreInitD/PostInitD];
nPreIs40=[nPreIs40 PreInitD];
nPreCs40=[nPreCs40 PreConcD];

CMn40=mean(CDCn40);
IMn40=mean(IDCn40);
EBCn40=sqrt(var(CDCn40))/sqrt(length(CDCn40));
EBIn40=sqrt(var(IDCn40))/sqrt(length(IDCn40));
nPIM40=mean(nPreIs40);
nPCM40=mean(nPreCs40);
nEBPI40=sqrt(var(nPreIs40))/sqrt(length(nPreIs40));
nEBPC40=sqrt(var(nPreCs40))/sqrt(length(nPreCs40));

%50-70
clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_cell2008_BS_Cell1_Red';
figpath=strcat(path,'_50pWater');
load(strcat(path,'.mat'))
ICWrapper_NoPlot;
CDCn60=[CDCn60 PreConcD/PostConcD];
IDCn60=[IDCn60 PreInitD/PostInitD];
nPreIs60=[nPreIs60 PreInitD];
nPreCs60=[nPreCs60 PreConcD];

clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_cell2008_BS_Cell2_NoRed';
figpath=strcat(path,'_50pWater');
load(strcat(path,'.mat'))
ICWrapper_NoPlot;
CDCn60=[CDCn60 PreConcD/PostConcD];
IDCn60=[IDCn60 PreInitD/PostInitD];
nPreIs60=[nPreIs60 PreInitD];
nPreCs60=[nPreCs60 PreConcD];

clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170221_Analysis\orig_movies\001_BS_Crop';
figpath=strcat(path,'_50pWater');
load(strcat(path,'.mat'))
ICWrapper_NoPlot;
CDCn60=[CDCn60 PreConcD/PostConcD];
IDCn60=[IDCn60 PreInitD/PostInitD];
nPreIs60=[nPreIs60 PreInitD];
nPreCs60=[nPreCs60 PreConcD];

clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170221_Analysis\orig_movies\002_BS_Crop';
OsmoT=165;
figpath=strcat(path,'_64pWater');
load(strcat(path,'.mat'))
ICWrapper_NoPlot_OsmoT;
CDCn60=[CDCn60 PreConcD/PostConcD];
IDCn60=[IDCn60 PreInitD/PostInitD];
nPreIs60=[nPreIs60 PreInitD];
nPreCs60=[nPreCs60 PreConcD];

CMn60=mean(CDCn60);
IMn60=mean(IDCn60);
EBCn60=sqrt(var(CDCn60))/sqrt(length(CDCn60));
EBIn60=sqrt(var(IDCn60))/sqrt(length(IDCn60));
nPIM60=mean(nPreIs60);
nPCM60=mean(nPreCs60);
nEBPI60=sqrt(var(nPreIs60))/sqrt(length(nPreIs60));
nEBPC60=sqrt(var(nPreCs60))/sqrt(length(nPreCs60));

%70+
clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_cell2011_BS_Cell1_Red';
figpath=strcat(path,'_80pWater');
load(strcat(path,'.mat'))
ICWrapper_NoPlot;
CDCn80=[CDCn80 PreConcD/PostConcD];
IDCn80=[IDCn80 PreInitD/PostInitD];
nPreIs80=[nPreIs80 PreInitD];
nPreCs80=[nPreCs80 PreConcD];

clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_cell2011_BS_Cell2_NoRed';
figpath=strcat(path,'_80pWater');
load(strcat(path,'.mat'))
ICWrapper_NoPlot;
CDCn80=[CDCn80 PreConcD/PostConcD];
IDCn80=[IDCn80 PreInitD/PostInitD];
nPreIs80=[nPreIs80 PreInitD];
nPreCs80=[nPreCs80 PreConcD];

clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_cell2011_BS_pCell3_NoRed';
figpath=strcat(path,'_80pWater');
load(strcat(path,'.mat'))
ICWrapper_NoPlot;
CDCn80=[CDCn80 PreConcD/PostConcD];
IDCn80=[IDCn80 PreInitD/PostInitD];
nPreIs80=[nPreIs80 PreInitD];
nPreCs80=[nPreCs80 PreConcD];

clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_cell2011_BS_pCell4_NoRed';
figpath=strcat(path,'_80pWater');
load(strcat(path,'.mat'))
ICWrapper_NoPlot;
CDCn80=[CDCn80 PreConcD/PostConcD];
IDCn80=[IDCn80 PreInitD/PostInitD];
nPreIs80=[nPreIs80 PreInitD];
nPreCs80=[nPreCs80 PreConcD];

clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170302_Data_Analysis\orig_movies\fol2_002_BS_Cell1_Red';
figpath=strcat(path,'_75pWater');
load(strcat(path,'.mat'))
ICWrapper_NoPlot;
CDCn80=[CDCn80 PreConcD/PostConcD];
IDCn80=[IDCn80 PreInitD/PostInitD];
nPreIs80=[nPreIs80 PreInitD];
nPreCs80=[nPreCs80 PreConcD];

clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170221_Analysis\orig_movies\003_BS_Crop';
OsmoT=180;
figpath=strcat(path,'_77pWater');
load(strcat(path,'.mat'))
ICWrapper_NoPlot_OsmoT;
CDCn80=[CDCn80 PreConcD/PostConcD];
IDCn80=[IDCn80 PreInitD/PostInitD];
nPreIs80=[nPreIs80 PreInitD];
nPreCs80=[nPreCs80 PreConcD];

clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170221_Analysis\orig_movies\004_BS_Crop';
OsmoT=200;
figpath=strcat(path,'_73pWater');
load(strcat(path,'.mat'))
ICWrapper_NoPlot_OsmoT;
CDCn80=[CDCn80 PreConcD/PostConcD];
IDCn80=[IDCn80 PreInitD/PostInitD];
nPreIs80=[nPreIs80 PreInitD];
nPreCs80=[nPreCs80 PreConcD];

CMn80=mean(CDCn80);
IMn80=mean(IDCn80);
EBCn80=sqrt(var(CDCn80))/sqrt(length(CDCn80));
EBIn80=sqrt(var(IDCn80))/sqrt(length(IDCn80));
nPIM80=mean(nPreIs80);
nPCM80=mean(nPreCs80);
nEBPI80=sqrt(var(nPreIs80))/sqrt(length(nPreIs80));
nEBPC80=sqrt(var(nPreCs80))/sqrt(length(nPreCs80));

%20
OsmoT=300;
clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170308_Data_Analysis\orig_movies\004_BS_Cell2.mat';
figpath=strcat(path,'_29pWater');
load(path)
ICWrapper_NoPlot;
CDCn20=[CDCn20 PreConcD/PostConcD];
IDCn20=[IDCn20 PreInitD/PostInitD];
nPreIs20=[nPreIs20 PreInitD];
nPreCs20=[nPreCs20 PreConcD];

clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170308_Data_Analysis\orig_movies\004_BS_Cell1';
figpath=strcat(path,'_29pWater');
load(strcat(path,'.mat'))
ICWrapper_NoPlot;
CDCn20=[CDCn20 PreConcD/PostConcD];
IDCn20=[IDCn20 PreInitD/PostInitD];
nPreIs20=[nPreIs20 PreInitD];
nPreCs20=[nPreCs20 PreConcD];

clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170308_Data_Analysis\orig_movies\002_BS_Cell2';
figpath=strcat(path,'_20pWater');
load(strcat(path,'.mat'))
ICWrapper_NoPlot;
CDCn20=[CDCn20 PreConcD/PostConcD];
IDCn20=[IDCn20 PreInitD/PostInitD];
nPreIs20=[nPreIs20 PreInitD];
nPreCs20=[nPreCs20 PreConcD];

clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170308_Data_Analysis\orig_movies\002_BS_Cell1';
figpath=strcat(path,'_20pWater');
load(strcat(path,'.mat'))
ICWrapper_NoPlot;
CDCn20=[CDCn20 PreConcD/PostConcD];
IDCn20=[IDCn20 PreInitD/PostInitD];
nPreIs20=[nPreIs20 PreInitD];
nPreCs20=[nPreCs20 PreConcD];

clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170308_Data_Analysis\orig_movies\001_BS_Cell2';
figpath=strcat(path,'_29pWater');
load(strcat(path,'.mat'))
ICWrapper_NoPlot;
CDCn20=[CDCn20 PreConcD/PostConcD];
IDCn20=[IDCn20 PreInitD/PostInitD];
nPreIs20=[nPreIs20 PreInitD];
nPreCs20=[nPreCs20 PreConcD];

clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170308_Data_Analysis\orig_movies\001_BS_Cell1';
figpath=strcat(path,'_29pWater');
load(strcat(path,'.mat'))
ICWrapper_NoPlot;
CDCn20=[CDCn20 PreConcD/PostConcD];
IDCn20=[IDCn20 PreInitD/PostInitD];
nPreIs20=[nPreIs20 PreInitD];
nPreCs20=[nPreCs20 PreConcD];

CMn20=mean(CDCn20);
IMn20=mean(IDCn20);
EBCn20=sqrt(var(CDCn20))/sqrt(length(CDCn20));
EBIn20=sqrt(var(IDCn20))/sqrt(length(IDCn20));
nPIM20=mean(nPreIs20);
nPCM20=mean(nPreCs20);
nEBPI20=sqrt(var(nPreIs20))/sqrt(length(nPreIs20));
nEBPC20=sqrt(var(nPreCs20))/sqrt(length(nPreCs20));

clear Threshfxyc JOSH JOSHF

%errorbar([20 40 60 80],[nC20 nC40 nC60 nC80],[nEB20 nEB40 nEB60 nEB80])
%hold on
