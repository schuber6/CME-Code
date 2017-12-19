Pres=[];
Posts=[];
OFs=[];
Waters=[];
Reds=[];
SHs=[];
Parts=[];
OLFs=[];
LFs=[];

PreLTs=[];
PostLTs=[];
PreMaxInts=[];
PostMaxInts=[];
TotalMaxInts=[];
MaxIntFs=[];

PreJHs=[];
PostJHs=[];

path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_004_BS_Cell1_Red';
figpath=strcat(path,'_20pWater');
load(strcat(path,'.mat'))
%LifetimeVFrameWrapper;
%print(strcat(figpath,'_LT'),'-djpeg')
JHsdPlotter;
PreJHs=[PreJHs pre];
PostJHs=[PostJHs post];
%print(strcat(figpath,'_JHSD'),'-djpeg')
%LifetimeVFrameWrapper_EC;
%print(strcat(figpath,'_LT_EC'),'-djpeg')
%JoshLTWrapper_NoPlot;
clear Threshfxyc JOSH JOSHF
% OLFs=[OLFs OLF];
% LFs=[LFs LF];
% Pres=[Pres pre];
% Posts=[Posts post];
% OFs=[OFs OF];
Waters=[Waters 20];
Reds=[Reds 1];
SHs=[SHs 1];
Parts=[Parts 0];

path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_004_BS_Cell2_NoRed';
figpath=strcat(path,'_20pWater');
load(strcat(path,'.mat'))
%LifetimeVFrameWrapper;
%print(strcat(figpath,'_LT'),'-djpeg')
JHsdPlotter;
PreJHs=[PreJHs pre];
PostJHs=[PostJHs post];
%print(strcat(figpath,'_JHSD'),'-djpeg')
%LifetimeVFrameWrapper_EC;
%print(strcat(figpath,'_LT_EC'),'-djpeg')
%JoshLTWrapper_NoPlot;
clear Threshfxyc JOSH JOSHF
% OLFs=[OLFs OLF];
% LFs=[LFs LF];
% Pres=[Pres pre];
% Posts=[Posts post];
% OFs=[OFs OF];
Waters=[Waters 20];
Reds=[Reds 0];
SHs=[SHs 1];
Parts=[Parts 0];

path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_004_BS_Cell3_NoRed';
figpath=strcat(path,'_20pWater');
load(strcat(path,'.mat'))
%LifetimeVFrameWrapper;
%print(strcat(figpath,'_LT'),'-djpeg')
JHsdPlotter;
PreJHs=[PreJHs pre];
PostJHs=[PostJHs post];
%print(strcat(figpath,'_JHSD'),'-djpeg')
%LifetimeVFrameWrapper_EC;
%print(strcat(figpath,'_LT_EC'),'-djpeg')
%JoshLTWrapper_NoPlot;
clear Threshfxyc JOSH JOSHF
% OLFs=[OLFs OLF];
% LFs=[LFs LF];
% Pres=[Pres pre];
% Posts=[Posts post];
% OFs=[OFs OF];
Waters=[Waters 20];
Reds=[Reds 0];
SHs=[SHs 1];
Parts=[Parts 0];

path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_008_BS_Cell1_Red';
figpath=strcat(path,'_40pWater');
load(strcat(path,'.mat'))
%LifetimeVFrameWrapper;
%print(strcat(figpath,'_LT'),'-djpeg')
JHsdPlotter;
PreJHs=[PreJHs pre];
PostJHs=[PostJHs post];
%print(strcat(figpath,'_JHSD'),'-djpeg')
%LifetimeVFrameWrapper_EC;
%print(strcat(figpath,'_LT_EC'),'-djpeg')
%JoshLTWrapper_NoPlot;
clear Threshfxyc JOSH JOSHF
% OLFs=[OLFs OLF];
% LFs=[LFs LF];
% Pres=[Pres pre];
% Posts=[Posts post];
% OFs=[OFs OF];
Waters=[Waters 40];
Reds=[Reds 1];
SHs=[SHs 1];
Parts=[Parts 0];

path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_008_BS_pCell2_NoRed';
figpath=strcat(path,'_40pWater');
load(strcat(path,'.mat'))
%LifetimeVFrameWrapper;
%print(strcat(figpath,'_LT'),'-djpeg')
JHsdPlotter;
PreJHs=[PreJHs pre];
PostJHs=[PostJHs post];
%print(strcat(figpath,'_JHSD'),'-djpeg')
%LifetimeVFrameWrapper_EC;
%print(strcat(figpath,'_LT_EC'),'-djpeg')
%JoshLTWrapper_NoPlot;
clear Threshfxyc JOSH JOSHF
% OLFs=[OLFs OLF];
% LFs=[LFs LF];
% Pres=[Pres pre];
% Posts=[Posts post];
% OFs=[OFs OF];
Waters=[Waters 40];
Reds=[Reds 0];
SHs=[SHs 1];
Parts=[Parts 1];

path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_010_BS_Cell1_Red';
figpath=strcat(path,'_60pWater');
load(strcat(path,'.mat'))
%LifetimeVFrameWrapper;
%print(strcat(figpath,'_LT'),'-djpeg')
JHsdPlotter;
PreJHs=[PreJHs pre];
PostJHs=[PostJHs post];
%print(strcat(figpath,'_JHSD'),'-djpeg')
%LifetimeVFrameWrapper_EC;
%print(strcat(figpath,'_LT_EC'),'-djpeg')
%JoshLTWrapper_NoPlot;
clear Threshfxyc JOSH JOSHF
% OLFs=[OLFs OLF];
% LFs=[LFs LF];
% Pres=[Pres pre];
% Posts=[Posts post];
% OFs=[OFs OF];
Waters=[Waters 60];
Reds=[Reds 1];
SHs=[SHs 1];
Parts=[Parts 0];

path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_010_BS_Cell2_NoRed';
figpath=strcat(path,'_60pWater');
load(strcat(path,'.mat'))
%LifetimeVFrameWrapper;
%print(strcat(figpath,'_LT'),'-djpeg')
JHsdPlotter;
PreJHs=[PreJHs pre];
PostJHs=[PostJHs post];
%print(strcat(figpath,'_JHSD'),'-djpeg')
%LifetimeVFrameWrapper_EC;
%print(strcat(figpath,'_LT_EC'),'-djpeg')
%JoshLTWrapper_NoPlot;
clear Threshfxyc JOSH JOSHF
% OLFs=[OLFs OLF];
% LFs=[LFs LF];
% Pres=[Pres pre];
% Posts=[Posts post];
% OFs=[OFs OF];
Waters=[Waters 60];
Reds=[Reds 0];
SHs=[SHs 1];
Parts=[Parts 0];

path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_010_BS_Cell3_NoRed';
figpath=strcat(path,'_60pWater');
load(strcat(path,'.mat'))
%LifetimeVFrameWrapper;
%print(strcat(figpath,'_LT'),'-djpeg')
JHsdPlotter;
PreJHs=[PreJHs pre];
PostJHs=[PostJHs post];
%print(strcat(figpath,'_JHSD'),'-djpeg')
%LifetimeVFrameWrapper_EC;
%print(strcat(figpath,'_LT_EC'),'-djpeg')
%JoshLTWrapper_NoPlot;
clear Threshfxyc JOSH JOSHF
% OLFs=[OLFs OLF];
% LFs=[LFs LF];
% Pres=[Pres pre];
% Posts=[Posts post];
% OFs=[OFs OF];
Waters=[Waters 60];
Reds=[Reds 0];
SHs=[SHs 1];
Parts=[Parts 0];

path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_013_BS_Cell1_Red';
figpath=strcat(path,'_80pWater');
load(strcat(path,'.mat'))
%LifetimeVFrameWrapper;
%print(strcat(figpath,'_LT'),'-djpeg')
JHsdPlotter;
PreJHs=[PreJHs pre];
PostJHs=[PostJHs post];
%print(strcat(figpath,'_JHSD'),'-djpeg')
%LifetimeVFrameWrapper_EC;
%print(strcat(figpath,'_LT_EC'),'-djpeg')
%JoshLTWrapper_NoPlot;
clear Threshfxyc JOSH JOSHF
% OLFs=[OLFs OLF];
% LFs=[LFs LF];
% Pres=[Pres pre];
% Posts=[Posts post];
% OFs=[OFs OF];
Waters=[Waters 80];
Reds=[Reds 1];
SHs=[SHs 1];
Parts=[Parts 0];

path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_013_BS_Cell2_NoRed';
figpath=strcat(path,'_80pWater');
load(strcat(path,'.mat'))
%LifetimeVFrameWrapper;
%print(strcat(figpath,'_LT'),'-djpeg')
JHsdPlotter;
PreJHs=[PreJHs pre];
PostJHs=[PostJHs post];
%print(strcat(figpath,'_JHSD'),'-djpeg')
%LifetimeVFrameWrapper_EC;
%print(strcat(figpath,'_LT_EC'),'-djpeg')
%JoshLTWrapper_NoPlot;
clear Threshfxyc JOSH JOSHF
% OLFs=[OLFs OLF];
% LFs=[LFs LF];
% Pres=[Pres pre];
% Posts=[Posts post];
% OFs=[OFs OF];
Waters=[Waters 80];
Reds=[Reds 0];
SHs=[SHs 1];
Parts=[Parts 0];

path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_013_BS_pCell3_NoRed';
figpath=strcat(path,'_80pWater');
load(strcat(path,'.mat'))
%LifetimeVFrameWrapper;
%print(strcat(figpath,'_LT'),'-djpeg')
JHsdPlotter;
PreJHs=[PreJHs pre];
PostJHs=[PostJHs post];
%print(strcat(figpath,'_JHSD'),'-djpeg')
%LifetimeVFrameWrapper_EC;
%print(strcat(figpath,'_LT_EC'),'-djpeg')
%JoshLTWrapper_NoPlot;
clear Threshfxyc JOSH JOSHF
% OLFs=[OLFs OLF];
% LFs=[LFs LF];
% Pres=[Pres pre];
% Posts=[Posts post];
% OFs=[OFs OF];
Waters=[Waters 80];
Reds=[Reds 0];
SHs=[SHs 1];
Parts=[Parts 1];

path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_cell2005_GFP_BS_Cell1_Red';
figpath=strcat(path,'_0pWater');
load(strcat(path,'.mat'))
%LifetimeVFrameWrapper;
%print(strcat(figpath,'_LT'),'-djpeg')
JHsdPlotter;
PreJHs=[PreJHs pre];
PostJHs=[PostJHs post];
%print(strcat(figpath,'_JHSD'),'-djpeg')
%LifetimeVFrameWrapper_EC;
%print(strcat(figpath,'_LT_EC'),'-djpeg')
%JoshLTWrapper_NoPlot;
clear Threshfxyc JOSH JOSHF
% OLFs=[OLFs OLF];
% LFs=[LFs LF];
% Pres=[Pres pre];
% Posts=[Posts post];
% OFs=[OFs OF];
Waters=[Waters 0];
Reds=[Reds 1];
SHs=[SHs 0];
Parts=[Parts 0];


path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_cell2006_GFP_BS_Cell1_Red';
figpath=strcat(path,'_0pWater');
load(strcat(path,'.mat'))
%LifetimeVFrameWrapper;
%print(strcat(figpath,'_LT'),'-djpeg')
JHsdPlotter;
PreJHs=[PreJHs pre];
PostJHs=[PostJHs post];
%print(strcat(figpath,'_JHSD'),'-djpeg')
%LifetimeVFrameWrapper_EC;
%print(strcat(figpath,'_LT_EC'),'-djpeg')
%JoshLTWrapper_NoPlot;
clear Threshfxyc JOSH JOSHF
% OLFs=[OLFs OLF];
% LFs=[LFs LF];
% Pres=[Pres pre];
% Posts=[Posts post];
% OFs=[OFs OF];
Waters=[Waters 0];
Reds=[Reds 1];
SHs=[SHs 0];
Parts=[Parts 0];


path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_cell2006_GFP_BS_Cell2_NoRed';
figpath=strcat(path,'_0pWater');
load(strcat(path,'.mat'))
%LifetimeVFrameWrapper;
%print(strcat(figpath,'_LT'),'-djpeg')
JHsdPlotter;
PreJHs=[PreJHs pre];
PostJHs=[PostJHs post];
%print(strcat(figpath,'_JHSD'),'-djpeg')
%LifetimeVFrameWrapper_EC;
%print(strcat(figpath,'_LT_EC'),'-djpeg')
%JoshLTWrapper_NoPlot;
clear Threshfxyc JOSH JOSHF
% OLFs=[OLFs OLF];
% LFs=[LFs LF];
% Pres=[Pres pre];
% Posts=[Posts post];
% OFs=[OFs OF];
Waters=[Waters 0];
Reds=[Reds 0];
SHs=[SHs 0];
Parts=[Parts 0];


path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_cell2006_GFP_BS_Cell3_NoRed';
figpath=strcat(path,'_0pWater');
load(strcat(path,'.mat'))
%LifetimeVFrameWrapper;
%print(strcat(figpath,'_LT'),'-djpeg')
JHsdPlotter;
PreJHs=[PreJHs pre];
PostJHs=[PostJHs post];
%print(strcat(figpath,'_JHSD'),'-djpeg')
%LifetimeVFrameWrapper_EC;
%print(strcat(figpath,'_LT_EC'),'-djpeg')
%JoshLTWrapper_NoPlot;
clear Threshfxyc JOSH JOSHF
% OLFs=[OLFs OLF];
% LFs=[LFs LF];
% Pres=[Pres pre];
% Posts=[Posts post];
% OFs=[OFs OF];
Waters=[Waters 0];
Reds=[Reds 0];
SHs=[SHs 0];
Parts=[Parts 0];


path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_cell2008_BS_Cell1_Red';
figpath=strcat(path,'_50pWater');
load(strcat(path,'.mat'))
%LifetimeVFrameWrapper;
%print(strcat(figpath,'_LT'),'-djpeg')
JHsdPlotter;
PreJHs=[PreJHs pre];
PostJHs=[PostJHs post];
%print(strcat(figpath,'_JHSD'),'-djpeg')
%LifetimeVFrameWrapper_EC;
%print(strcat(figpath,'_LT_EC'),'-djpeg')
%JoshLTWrapper_NoPlot;
clear Threshfxyc JOSH JOSHF
% OLFs=[OLFs OLF];
% LFs=[LFs LF];
% Pres=[Pres pre];
% Posts=[Posts post];
% OFs=[OFs OF];
Waters=[Waters 50];
Reds=[Reds 1];
SHs=[SHs 0];
Parts=[Parts 0];


path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_cell2008_BS_Cell2_NoRed';
figpath=strcat(path,'_50pWater');
load(strcat(path,'.mat'))
%LifetimeVFrameWrapper;
%print(strcat(figpath,'_LT'),'-djpeg')
JHsdPlotter;
PreJHs=[PreJHs pre];
PostJHs=[PostJHs post];
%print(strcat(figpath,'_JHSD'),'-djpeg')
%LifetimeVFrameWrapper_EC;
%print(strcat(figpath,'_LT_EC'),'-djpeg')
%JoshLTWrapper_NoPlot;
clear Threshfxyc JOSH JOSHF
% OLFs=[OLFs OLF];
% LFs=[LFs LF];
% Pres=[Pres pre];
% Posts=[Posts post];
% OFs=[OFs OF];
Waters=[Waters 50];
Reds=[Reds 0];
SHs=[SHs 0];
Parts=[Parts 0];


path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_cell2009_GFP_BS_Cell1_DimRed';
figpath=strcat(path,'_0pWater');
load(strcat(path,'.mat'))
%LifetimeVFrameWrapper;
%print(strcat(figpath,'_LT'),'-djpeg')
JHsdPlotter;
PreJHs=[PreJHs pre];
PostJHs=[PostJHs post];
%print(strcat(figpath,'_JHSD'),'-djpeg')
%LifetimeVFrameWrapper_EC;
%print(strcat(figpath,'_LT_EC'),'-djpeg')
%JoshLTWrapper_NoPlot;
clear Threshfxyc JOSH JOSHF
% OLFs=[OLFs OLF];
% LFs=[LFs LF];
% Pres=[Pres pre];
% Posts=[Posts post];
% OFs=[OFs OF];
Waters=[Waters 0];
Reds=[Reds 1];
SHs=[SHs 0];
Parts=[Parts 0];


path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_cell2009_GFP_BS_Cell2_NoRed';
figpath=strcat(path,'_0pWater');
load(strcat(path,'.mat'))
%LifetimeVFrameWrapper;
%print(strcat(figpath,'_LT'),'-djpeg')
JHsdPlotter;
PreJHs=[PreJHs pre];
PostJHs=[PostJHs post];
%print(strcat(figpath,'_JHSD'),'-djpeg')
%LifetimeVFrameWrapper_EC;
%print(strcat(figpath,'_LT_EC'),'-djpeg')
%JoshLTWrapper_NoPlot;
clear Threshfxyc JOSH JOSHF
% OLFs=[OLFs OLF];
% LFs=[LFs LF];
% Pres=[Pres pre];
% Posts=[Posts post];
% OFs=[OFs OF];
Waters=[Waters 0];
Reds=[Reds 0];
SHs=[SHs 0];
Parts=[Parts 0];


path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_cell2009_GFP_BS_pCell3_NoRed';
figpath=strcat(path,'_0pWater');
load(strcat(path,'.mat'))
%LifetimeVFrameWrapper;
%print(strcat(figpath,'_LT'),'-djpeg')
JHsdPlotter;
PreJHs=[PreJHs pre];
PostJHs=[PostJHs post];
%print(strcat(figpath,'_JHSD'),'-djpeg')
%LifetimeVFrameWrapper_EC;
%print(strcat(figpath,'_LT_EC'),'-djpeg')
%JoshLTWrapper_NoPlot;
clear Threshfxyc JOSH JOSHF
% OLFs=[OLFs OLF];
% LFs=[LFs LF];
% Pres=[Pres pre];
% Posts=[Posts post];
% OFs=[OFs OF];
Waters=[Waters 0];
Reds=[Reds 0];
SHs=[SHs 0];
Parts=[Parts 1];


path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_cell2011_BS_Cell1_Red';
figpath=strcat(path,'_80pWater');
load(strcat(path,'.mat'))
%LifetimeVFrameWrapper;
%print(strcat(figpath,'_LT'),'-djpeg')
JHsdPlotter;
PreJHs=[PreJHs pre];
PostJHs=[PostJHs post];
%print(strcat(figpath,'_JHSD'),'-djpeg')
%LifetimeVFrameWrapper_EC;
%print(strcat(figpath,'_LT_EC'),'-djpeg')
%JoshLTWrapper_NoPlot;
clear Threshfxyc JOSH JOSHF
% OLFs=[OLFs OLF];
% LFs=[LFs LF];
% Pres=[Pres pre];
% Posts=[Posts post];
% OFs=[OFs OF];
Waters=[Waters 80];
Reds=[Reds 1];
SHs=[SHs 0];
Parts=[Parts 0];


path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_cell2011_BS_Cell2_NoRed';
figpath=strcat(path,'_80pWater');
load(strcat(path,'.mat'))
%LifetimeVFrameWrapper;
%print(strcat(figpath,'_LT'),'-djpeg')
JHsdPlotter;
PreJHs=[PreJHs pre];
PostJHs=[PostJHs post];
%print(strcat(figpath,'_JHSD'),'-djpeg')
%LifetimeVFrameWrapper_EC;
%print(strcat(figpath,'_LT_EC'),'-djpeg')
%JoshLTWrapper_NoPlot;
clear Threshfxyc JOSH JOSHF
% OLFs=[OLFs OLF];
% LFs=[LFs LF];
% Pres=[Pres pre];
% Posts=[Posts post];
% OFs=[OFs OF];
Waters=[Waters 80];
Reds=[Reds 0];
SHs=[SHs 0];
Parts=[Parts 0];


path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_cell2011_BS_pCell3_NoRed';
figpath=strcat(path,'_80pWater');
load(strcat(path,'.mat'))
%LifetimeVFrameWrapper;
%print(strcat(figpath,'_LT'),'-djpeg')
JHsdPlotter;
PreJHs=[PreJHs pre];
PostJHs=[PostJHs post];
%print(strcat(figpath,'_JHSD'),'-djpeg')
%LifetimeVFrameWrapper_EC;
%print(strcat(figpath,'_LT_EC'),'-djpeg')
%JoshLTWrapper_NoPlot;
clear Threshfxyc JOSH JOSHF
% OLFs=[OLFs OLF];
% LFs=[LFs LF];
% Pres=[Pres pre];
% Posts=[Posts post];
% OFs=[OFs OF];
Waters=[Waters 80];
Reds=[Reds 0];
SHs=[SHs 0];
Parts=[Parts 1];


path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_cell2011_BS_pCell4_NoRed';
figpath=strcat(path,'_80pWater');
load(strcat(path,'.mat'))
%LifetimeVFrameWrapper;
%print(strcat(figpath,'_LT'),'-djpeg')
JHsdPlotter;
PreJHs=[PreJHs pre];
PostJHs=[PostJHs post];
%print(strcat(figpath,'_JHSD'),'-djpeg')
%LifetimeVFrameWrapper_EC;
%print(strcat(figpath,'_LT_EC'),'-djpeg')
%JoshLTWrapper_NoPlot;
clear Threshfxyc JOSH JOSHF
% OLFs=[OLFs OLF];
% LFs=[LFs LF];
% Pres=[Pres pre];
% Posts=[Posts post];
% OFs=[OFs OF];
Waters=[Waters 80];
Reds=[Reds 0];
SHs=[SHs 0];
Parts=[Parts 1];

path='E:\CME Superfolder\CME Data\170302_Data_Analysis\orig_movies\fol2_002_BS_Cell1_Red';
figpath=strcat(path,'_75pWater');
load(strcat(path,'.mat'))
%LifetimeVFrameWrapper;
%print(strcat(figpath,'_LT'),'-djpeg')
JHsdPlotter;
PreJHs=[PreJHs pre];
PostJHs=[PostJHs post];
%print(strcat(figpath,'_JHSD'),'-djpeg')
%LifetimeVFrameWrapper_EC;
%print(strcat(figpath,'_LT_EC'),'-djpeg')
%JoshLTWrapper_NoPlot;
clear Threshfxyc JOSH JOSHF
% OLFs=[OLFs OLF];
% LFs=[LFs LF];
% Pres=[Pres pre];
% Posts=[Posts post];
% OFs=[OFs OF];
Waters=[Waters 75];
Reds=[Reds 1];
SHs=[SHs 0];
Parts=[Parts 0];

path='E:\CME Superfolder\CME Data\170302_Data_Analysis\orig_movies\fol2_004_BS_Cell1_Red';
figpath=strcat(path,'_20pWater');
load(strcat(path,'.mat'))
%LifetimeVFrameWrapper;
%print(strcat(figpath,'_LT'),'-djpeg')
JHsdPlotter;
PreJHs=[PreJHs pre];
PostJHs=[PostJHs post];
%print(strcat(figpath,'_JHSD'),'-djpeg')
%LifetimeVFrameWrapper_EC;
%print(strcat(figpath,'_LT_EC'),'-djpeg')
%JoshLTWrapper_NoPlot;
clear Threshfxyc JOSH JOSHF
% OLFs=[OLFs OLF];
% LFs=[LFs LF];
% Pres=[Pres pre];
% Posts=[Posts post];
% OFs=[OFs OF];
Waters=[Waters 20];
Reds=[Reds 1];
SHs=[SHs 1];
Parts=[Parts 0];

path='E:\CME Superfolder\CME Data\170302_Data_Analysis\orig_movies\fol2_006_BS_Cell1_Red';
figpath=strcat(path,'_40pWater');
load(strcat(path,'.mat'))
%LifetimeVFrameWrapper;
%print(strcat(figpath,'_LT'),'-djpeg')
JHsdPlotter;
PreJHs=[PreJHs pre];
PostJHs=[PostJHs post];
%print(strcat(figpath,'_JHSD'),'-djpeg')
%LifetimeVFrameWrapper_EC;
%print(strcat(figpath,'_LT_EC'),'-djpeg')
%JoshLTWrapper_NoPlot;
clear Threshfxyc JOSH JOSHF
% OLFs=[OLFs OLF];
% LFs=[LFs LF];
% Pres=[Pres pre];
% Posts=[Posts post];
% OFs=[OFs OF];
Waters=[Waters 40];
Reds=[Reds 1];
SHs=[SHs 1];
Parts=[Parts 0];

path='E:\CME Superfolder\CME Data\170302_Data_Analysis\orig_movies\fol2_006_BS_Cell2_NoRed';
figpath=strcat(path,'_40pWater');
load(strcat(path,'.mat'))
%LifetimeVFrameWrapper;
%print(strcat(figpath,'_LT'),'-djpeg')
JHsdPlotter;
PreJHs=[PreJHs pre];
PostJHs=[PostJHs post];
%print(strcat(figpath,'_JHSD'),'-djpeg')
%LifetimeVFrameWrapper_EC;
%print(strcat(figpath,'_LT_EC'),'-djpeg')
%JoshLTWrapper_NoPlot;
clear Threshfxyc JOSH JOSHF
% OLFs=[OLFs OLF];
% LFs=[LFs LF];
% Pres=[Pres pre];
% Posts=[Posts post];
% OFs=[OFs OF];
Waters=[Waters 40];
Reds=[Reds 0];
SHs=[SHs 1];
Parts=[Parts 0];

path='E:\CME Superfolder\CME Data\170302_Data_Analysis\orig_movies\fol2_006_BS_Cell3_NoRed_Unattached';
figpath=strcat(path,'_40pWater');
load(strcat(path,'.mat'))
%LifetimeVFrameWrapper;
%print(strcat(figpath,'_LT'),'-djpeg')
JHsdPlotter;
PreJHs=[PreJHs pre];
PostJHs=[PostJHs post];
%print(strcat(figpath,'_JHSD'),'-djpeg')
%LifetimeVFrameWrapper_EC;
%print(strcat(figpath,'_LT_EC'),'-djpeg')
%JoshLTWrapper_NoPlot;
clear Threshfxyc JOSH JOSHF
% OLFs=[OLFs OLF];
% LFs=[LFs LF];
% Pres=[Pres pre];
% Posts=[Posts post];
% OFs=[OFs OF];
Waters=[Waters 40];
Reds=[Reds 0];
SHs=[SHs 1];
Parts=[Parts 0];

path='E:\CME Superfolder\CME Data\170302_Data_Analysis\orig_movies\fol2_008_BS_Cell1_Red';
figpath=strcat(path,'_55pWater');
load(strcat(path,'.mat'))
%LifetimeVFrameWrapper;
%print(strcat(figpath,'_LT'),'-djpeg')
JHsdPlotter;
PreJHs=[PreJHs pre];
PostJHs=[PostJHs post];
%print(strcat(figpath,'_JHSD'),'-djpeg')
%LifetimeVFrameWrapper_EC;
%print(strcat(figpath,'_LT_EC'),'-djpeg')
%JoshLTWrapper_NoPlot;
clear Threshfxyc JOSH JOSHF
% OLFs=[OLFs OLF];
% LFs=[LFs LF];
% Pres=[Pres pre];
% Posts=[Posts post];
% OFs=[OFs OF];
Waters=[Waters 55];
Reds=[Reds 1];
SHs=[SHs 1];
Parts=[Parts 0];

path='E:\CME Superfolder\CME Data\170302_Data_Analysis\orig_movies\fol2_008_BS_Cell2_DimRed';
figpath=strcat(path,'_55pWater');
load(strcat(path,'.mat'))
%LifetimeVFrameWrapper;
%print(strcat(figpath,'_LT'),'-djpeg')
JHsdPlotter;
PreJHs=[PreJHs pre];
PostJHs=[PostJHs post];
%print(strcat(figpath,'_JHSD'),'-djpeg')
%LifetimeVFrameWrapper_EC;
%print(strcat(figpath,'_LT_EC'),'-djpeg')
%JoshLTWrapper_NoPlot;
clear Threshfxyc JOSH JOSHF
% OLFs=[OLFs OLF];
% LFs=[LFs LF];
% Pres=[Pres pre];
% Posts=[Posts post];
% OFs=[OFs OF];
Waters=[Waters 55];
Reds=[Reds 1];
SHs=[SHs 1];
Parts=[Parts 0];

path='E:\CME Superfolder\CME Data\170302_Data_Analysis\orig_movies\fol2_008_BS_Cell3_NoRed';
figpath=strcat(path,'_55pWater');
load(strcat(path,'.mat'))
%LifetimeVFrameWrapper;
%print(strcat(figpath,'_LT'),'-djpeg')
JHsdPlotter;
PreJHs=[PreJHs pre];
PostJHs=[PostJHs post];
%print(strcat(figpath,'_JHSD'),'-djpeg')
%LifetimeVFrameWrapper_EC;
%print(strcat(figpath,'_LT_EC'),'-djpeg')
%JoshLTWrapper_NoPlot;
clear Threshfxyc JOSH JOSHF
% OLFs=[OLFs OLF];
% LFs=[LFs LF];
% Pres=[Pres pre];
% Posts=[Posts post];
% OFs=[OFs OF];
Waters=[Waters 55];
Reds=[Reds 0];
SHs=[SHs 1];
Parts=[Parts 0];

path='E:\CME Superfolder\CME Data\170302_Data_Analysis\orig_movies\fol2_010_BS_Cell1_Red';
figpath=strcat(path,'_80pWater');
load(strcat(path,'.mat'))
%LifetimeVFrameWrapper;
%print(strcat(figpath,'_LT'),'-djpeg')
JHsdPlotter;
PreJHs=[PreJHs pre];
PostJHs=[PostJHs post];
%print(strcat(figpath,'_JHSD'),'-djpeg')
%LifetimeVFrameWrapper_EC;
%print(strcat(figpath,'_LT_EC'),'-djpeg')
%JoshLTWrapper_NoPlot;
clear Threshfxyc JOSH JOSHF
% OLFs=[OLFs OLF];
% LFs=[LFs LF];
% Pres=[Pres pre];
% Posts=[Posts post];
% OFs=[OFs OF];
Waters=[Waters 80];
Reds=[Reds 1];
SHs=[SHs 1];
Parts=[Parts 0];

path='E:\CME Superfolder\CME Data\170302_Data_Analysis\orig_movies\fol2_010_BS_Cell2_Red';
figpath=strcat(path,'_80pWater');
load(strcat(path,'.mat'))
%LifetimeVFrameWrapper;
%print(strcat(figpath,'_LT'),'-djpeg')
JHsdPlotter;
PreJHs=[PreJHs pre];
PostJHs=[PostJHs post];
%print(strcat(figpath,'_JHSD'),'-djpeg')
%LifetimeVFrameWrapper_EC;
%print(strcat(figpath,'_LT_EC'),'-djpeg')
%JoshLTWrapper_NoPlot;
clear Threshfxyc JOSH JOSHF
% OLFs=[OLFs OLF];
% LFs=[LFs LF];
% Pres=[Pres pre];
% Posts=[Posts post];
% OFs=[OFs OF];
Waters=[Waters 80];
Reds=[Reds 1];
SHs=[SHs 1];
Parts=[Parts 0];

path='E:\CME Superfolder\CME Data\170302_Data_Analysis\orig_movies\fol2_010_BS_pCell3_NoRed';
figpath=strcat(path,'_80pWater');
load(strcat(path,'.mat'))
%LifetimeVFrameWrapper;
%print(strcat(figpath,'_LT'),'-djpeg')
JHsdPlotter;
PreJHs=[PreJHs pre];
PostJHs=[PostJHs post];
%print(strcat(figpath,'_JHSD'),'-djpeg')
%LifetimeVFrameWrapper_EC;
%print(strcat(figpath,'_LT_EC'),'-djpeg')
%JoshLTWrapper_NoPlot;
clear Threshfxyc JOSH JOSHF
% OLFs=[OLFs OLF];
% LFs=[LFs LF];
% Pres=[Pres pre];
% Posts=[Posts post];
% OFs=[OFs OF];
Waters=[Waters 80];
Reds=[Reds 0];
SHs=[SHs 1];
Parts=[Parts 1];

path='E:\CME Superfolder\CME Data\170302_Data_Analysis\orig_movies\fol2_010_BS_pCell4_NoRed';
figpath=strcat(path,'_80pWater');
load(strcat(path,'.mat'))
%LifetimeVFrameWrapper;
%print(strcat(figpath,'_LT'),'-djpeg')
JHsdPlotter;
PreJHs=[PreJHs pre];
PostJHs=[PostJHs post];
%print(strcat(figpath,'_JHSD'),'-djpeg')
%LifetimeVFrameWrapper_EC;
%print(strcat(figpath,'_LT_EC'),'-djpeg')
%JoshLTWrapper_NoPlot;
clear Threshfxyc JOSH JOSHF
% OLFs=[OLFs OLF];
% LFs=[LFs LF];
% Pres=[Pres pre];
% Posts=[Posts post];
% OFs=[OFs OF];
Waters=[Waters 80];
Reds=[Reds 0];
SHs=[SHs 1];
Parts=[Parts 1];

path='E:\CME Superfolder\CME Data\170302_Data_Analysis\orig_movies\fol2_010_BS_Cell5_NoRed';
figpath=strcat(path,'_80pWater');
load(strcat(path,'.mat'))
%LifetimeVFrameWrapper;
%print(strcat(figpath,'_LT'),'-djpeg')
JHsdPlotter;
PreJHs=[PreJHs pre];
PostJHs=[PostJHs post];
%print(strcat(figpath,'_JHSD'),'-djpeg')
%LifetimeVFrameWrapper_EC;
%print(strcat(figpath,'_LT_EC'),'-djpeg')
%JoshLTWrapper_NoPlot;
clear Threshfxyc JOSH JOSHF
% OLFs=[OLFs OLF];
% LFs=[LFs LF];
% Pres=[Pres pre];
% Posts=[Posts post];
% OFs=[OFs OF];
Waters=[Waters 80];
Reds=[Reds 0];
SHs=[SHs 1];
Parts=[Parts 0];

path='E:\CME Superfolder\CME Data\170303_Data_Analysis\orig_movies\002_BS_Cell1_Red';
figpath=strcat(path,'_85pWater');
load(strcat(path,'.mat'))
%LifetimeVFrameWrapper;
%print(strcat(figpath,'_LT'),'-djpeg')
JHsdPlotter;
PreJHs=[PreJHs pre];
PostJHs=[PostJHs post];
%print(strcat(figpath,'_JHSD'),'-djpeg')
%LifetimeVFrameWrapper_EC;
%print(strcat(figpath,'_LT_EC'),'-djpeg')
%JoshLTWrapper_NoPlot;
clear Threshfxyc JOSH JOSHF
% OLFs=[OLFs OLF];
% LFs=[LFs LF];
% Pres=[Pres pre];
% Posts=[Posts post];
% OFs=[OFs OF];
Waters=[Waters 85];
Reds=[Reds 1];
SHs=[SHs 1];
Parts=[Parts 0];

path='E:\CME Superfolder\CME Data\170303_Data_Analysis\orig_movies\002_BS_Cell2_NoRed';
figpath=strcat(path,'_85pWater');
load(strcat(path,'.mat'))
%LifetimeVFrameWrapper;
%print(strcat(figpath,'_LT'),'-djpeg')
JHsdPlotter;
PreJHs=[PreJHs pre];
PostJHs=[PostJHs post];
%print(strcat(figpath,'_JHSD'),'-djpeg')
%LifetimeVFrameWrapper_EC;
%print(strcat(figpath,'_LT_EC'),'-djpeg')
%JoshLTWrapper_NoPlot;
clear Threshfxyc JOSH JOSHF
% OLFs=[OLFs OLF];
% LFs=[LFs LF];
% Pres=[Pres pre];
% Posts=[Posts post];
% OFs=[OFs OF];
Waters=[Waters 85];
Reds=[Reds 0];
SHs=[SHs 1];
Parts=[Parts 0];

path='E:\CME Superfolder\CME Data\170303_Data_Analysis\orig_movies\002_BS_Cell3_NoRed';
figpath=strcat(path,'_85pWater');
load(strcat(path,'.mat'))
%LifetimeVFrameWrapper;
%print(strcat(figpath,'_LT'),'-djpeg')
JHsdPlotter;
PreJHs=[PreJHs pre];
PostJHs=[PostJHs post];
%print(strcat(figpath,'_JHSD'),'-djpeg')
%LifetimeVFrameWrapper_EC;
%print(strcat(figpath,'_LT_EC'),'-djpeg')
%JoshLTWrapper_NoPlot;
clear Threshfxyc JOSH JOSHF
% OLFs=[OLFs OLF];
% LFs=[LFs LF];
% Pres=[Pres pre];
% Posts=[Posts post];
% OFs=[OFs OF];
Waters=[Waters 85];
Reds=[Reds 0];
SHs=[SHs 1];
Parts=[Parts 0];

path='E:\CME Superfolder\CME Data\170303_Data_Analysis\orig_movies\004_BS_Cell1_Red';
figpath=strcat(path,'_60pWater');
load(strcat(path,'.mat'))
%LifetimeVFrameWrapper;
%print(strcat(figpath,'_LT'),'-djpeg')
JHsdPlotter;
PreJHs=[PreJHs pre];
PostJHs=[PostJHs post];
%print(strcat(figpath,'_JHSD'),'-djpeg')
%LifetimeVFrameWrapper_EC;
%print(strcat(figpath,'_LT_EC'),'-djpeg')
%JoshLTWrapper_NoPlot;
clear Threshfxyc JOSH JOSHF
% OLFs=[OLFs OLF];
% LFs=[LFs LF];
% Pres=[Pres pre];
% Posts=[Posts post];
% OFs=[OFs OF];
Waters=[Waters 60];
Reds=[Reds 1];
SHs=[SHs 1];
Parts=[Parts 0];

path='E:\CME Superfolder\CME Data\170303_Data_Analysis\orig_movies\004_BS_Cell2_NoRed';
figpath=strcat(path,'_60pWater');
load(strcat(path,'.mat'))
%LifetimeVFrameWrapper;
%print(strcat(figpath,'_LT'),'-djpeg')
JHsdPlotter;
PreJHs=[PreJHs pre];
PostJHs=[PostJHs post];
%print(strcat(figpath,'_JHSD'),'-djpeg')
%LifetimeVFrameWrapper_EC;
%print(strcat(figpath,'_LT_EC'),'-djpeg')
%JoshLTWrapper_NoPlot;
clear Threshfxyc JOSH JOSHF
% OLFs=[OLFs OLF];
% LFs=[LFs LF];
% Pres=[Pres pre];
% Posts=[Posts post];
% OFs=[OFs OF];
Waters=[Waters 60];
Reds=[Reds 0];
SHs=[SHs 1];
Parts=[Parts 0];

path='E:\CME Superfolder\CME Data\170303_Data_Analysis\orig_movies\007_BS_Cell1_Red';
figpath=strcat(path,'_40pWater');
load(strcat(path,'.mat'))
%LifetimeVFrameWrapper;
%print(strcat(figpath,'_LT'),'-djpeg')
JHsdPlotter;
PreJHs=[PreJHs pre];
PostJHs=[PostJHs post];
%print(strcat(figpath,'_JHSD'),'-djpeg')
%LifetimeVFrameWrapper_EC;
%print(strcat(figpath,'_LT_EC'),'-djpeg')
%JoshLTWrapper_NoPlot;
clear Threshfxyc JOSH JOSHF
% OLFs=[OLFs OLF];
% LFs=[LFs LF];
% Pres=[Pres pre];
% Posts=[Posts post];
% OFs=[OFs OF];
Waters=[Waters 40];
Reds=[Reds 1];
SHs=[SHs 1];
Parts=[Parts 0];

path='E:\CME Superfolder\CME Data\170303_Data_Analysis\orig_movies\007_BS_Cell2_NoRed';
figpath=strcat(path,'_40pWater');
load(strcat(path,'.mat'))
%LifetimeVFrameWrapper;
%print(strcat(figpath,'_LT'),'-djpeg')
JHsdPlotter;
PreJHs=[PreJHs pre];
PostJHs=[PostJHs post];
%print(strcat(figpath,'_JHSD'),'-djpeg')
%LifetimeVFrameWrapper_EC;
%print(strcat(figpath,'_LT_EC'),'-djpeg')
%JoshLTWrapper_NoPlot;
clear Threshfxyc JOSH JOSHF
% OLFs=[OLFs OLF];
% LFs=[LFs LF];
% Pres=[Pres pre];
% Posts=[Posts post];
% OFs=[OFs OF];
Waters=[Waters 40];
Reds=[Reds 0];
SHs=[SHs 1];
Parts=[Parts 0];

path='E:\CME Superfolder\CME Data\170303_Data_Analysis\orig_movies\009_BS_Cell1_Red';
figpath=strcat(path,'_20pWater');
load(strcat(path,'.mat'))
%LifetimeVFrameWrapper;
%print(strcat(figpath,'_LT'),'-djpeg')
JHsdPlotter;
PreJHs=[PreJHs pre];
PostJHs=[PostJHs post];
%print(strcat(figpath,'_JHSD'),'-djpeg')
%LifetimeVFrameWrapper_EC;
%print(strcat(figpath,'_LT_EC'),'-djpeg')
%JoshLTWrapper_NoPlot;
clear Threshfxyc JOSH JOSHF
% OLFs=[OLFs OLF];
% LFs=[LFs LF];
% Pres=[Pres pre];
% Posts=[Posts post];
% OFs=[OFs OF];
Waters=[Waters 20];
Reds=[Reds 1];
SHs=[SHs 1];
Parts=[Parts 0];

path='E:\CME Superfolder\CME Data\170303_Data_Analysis\orig_movies\009_BS_Cell2_NoRed';
figpath=strcat(path,'_20pWater');
load(strcat(path,'.mat'))
%LifetimeVFrameWrapper;
%print(strcat(figpath,'_LT'),'-djpeg')
JHsdPlotter;
PreJHs=[PreJHs pre];
PostJHs=[PostJHs post];
%print(strcat(figpath,'_JHSD'),'-djpeg')
%LifetimeVFrameWrapper_EC;
%print(strcat(figpath,'_LT_EC'),'-djpeg')
%JoshLTWrapper_NoPlot;
clear Threshfxyc JOSH JOSHF
% OLFs=[OLFs OLF];
% LFs=[LFs LF];
% Pres=[Pres pre];
% Posts=[Posts post];
% OFs=[OFs OF];
Waters=[Waters 20];
Reds=[Reds 0];
SHs=[SHs 1];
Parts=[Parts 0];

path='E:\CME Superfolder\CME Data\170303_Data_Analysis\orig_movies\009_BS_Cell3_NoRed';
figpath=strcat(path,'_20pWater');
load(strcat(path,'.mat'))
%LifetimeVFrameWrapper;
%print(strcat(figpath,'_LT'),'-djpeg')
JHsdPlotter;
PreJHs=[PreJHs pre];
PostJHs=[PostJHs post];
%print(strcat(figpath,'_JHSD'),'-djpeg')
%LifetimeVFrameWrapper_EC;
%print(strcat(figpath,'_LT_EC'),'-djpeg')
%JoshLTWrapper_NoPlot;
clear Threshfxyc JOSH JOSHF
% OLFs=[OLFs OLF];
% LFs=[LFs LF];
% Pres=[Pres pre];
% Posts=[Posts post];
% OFs=[OFs OF];
Waters=[Waters 20];
Reds=[Reds 0];
SHs=[SHs 1];
Parts=[Parts 0];

path='E:\CME Superfolder\CME Data\170221_Analysis\orig_movies\001_BS_Crop';
figpath=strcat(path,'_50pWater');
load(strcat(path,'.mat'))
%LifetimeVFrameWrapper;
%print(strcat(figpath,'_LT'),'-djpeg')
JHsdPlotter;
PreJHs=[PreJHs pre];
PostJHs=[PostJHs post];
%print(strcat(figpath,'_JHSD'),'-djpeg')
%LifetimeVFrameWrapper_EC;
%print(strcat(figpath,'_LT_EC'),'-djpeg')
%JoshLTWrapper_NoPlot;
clear Threshfxyc JOSH JOSHF
% OLFs=[OLFs OLF];
% LFs=[LFs LF];
% Pres=[Pres pre];
% Posts=[Posts post];
% OFs=[OFs OF];
Waters=[Waters 50];
Reds=[Reds 0];
SHs=[SHs 0];
Parts=[Parts 0];

path='E:\CME Superfolder\CME Data\170221_Analysis\orig_movies\002_BS_Crop';
OsmoT=165;
figpath=strcat(path,'_64pWater');
load(strcat(path,'.mat'))
%LifetimeVFrameWrapper;
%print(strcat(figpath,'_LT'),'-djpeg')
JHsdPlotter;
PreJHs=[PreJHs pre];
PostJHs=[PostJHs post];
%print(strcat(figpath,'_JHSD'),'-djpeg')
%LifetimeVFrameWrapper_EC;
%print(strcat(figpath,'_LT_EC'),'-djpeg')
%JoshLTWrapper_NoPlot;
clear Threshfxyc JOSH JOSHF
% OLFs=[OLFs OLF];
% LFs=[LFs LF];
% Pres=[Pres pre];
% Posts=[Posts post];
% OFs=[OFs OF];
Waters=[Waters 64];
Reds=[Reds 0];
SHs=[SHs 0];
Parts=[Parts 0];

path='E:\CME Superfolder\CME Data\170221_Analysis\orig_movies\003_BS_Crop';
OsmoT=180;
figpath=strcat(path,'_77pWater');
load(strcat(path,'.mat'))
%LifetimeVFrameWrapper;
%print(strcat(figpath,'_LT'),'-djpeg')
JHsdPlotter;
PreJHs=[PreJHs pre];
PostJHs=[PostJHs post];
%print(strcat(figpath,'_JHSD'),'-djpeg')
%LifetimeVFrameWrapper_EC;
%print(strcat(figpath,'_LT_EC'),'-djpeg')
%JoshLTWrapper_NoPlot;
clear Threshfxyc JOSH JOSHF
% OLFs=[OLFs OLF];
% LFs=[LFs LF];
% Pres=[Pres pre];
% Posts=[Posts post];
% OFs=[OFs OF];
Waters=[Waters 77];
Reds=[Reds 0];
SHs=[SHs 0];
Parts=[Parts 0];

path='E:\CME Superfolder\CME Data\170221_Analysis\orig_movies\004_BS_Crop';
OsmoT=200;
figpath=strcat(path,'_73pWater');
load(strcat(path,'.mat'))
%LifetimeVFrameWrapper;
%print(strcat(figpath,'_LT'),'-djpeg')
JHsdPlotter;
PreJHs=[PreJHs pre];
PostJHs=[PostJHs post];
%print(strcat(figpath,'_JHSD'),'-djpeg')
%LifetimeVFrameWrapper_EC;
%print(strcat(figpath,'_LT_EC'),'-djpeg')
%JoshLTWrapper_NoPlot;
clear Threshfxyc JOSH JOSHF
% OLFs=[OLFs OLF];
% LFs=[LFs LF];
% Pres=[Pres pre];
% Posts=[Posts post];
% OFs=[OFs OF];
Waters=[Waters 73];
Reds=[Reds 0];
SHs=[SHs 0];
Parts=[Parts 0];

path='E:\CME Superfolder\CME Data\170308_Data_Analysis\orig_movies\001_BS_Cell1';
figpath=strcat(path,'_29pWater');
load(strcat(path,'.mat'))
%LifetimeVFrameWrapper;
%print(strcat(figpath,'_LT'),'-djpeg')
JHsdPlotter;
PreJHs=[PreJHs pre];
PostJHs=[PostJHs post];
%print(strcat(figpath,'_JHSD'),'-djpeg')
%LifetimeVFrameWrapper_EC;
%print(strcat(figpath,'_LT_EC'),'-djpeg')
%JoshLTWrapper_NoPlot;
clear Threshfxyc JOSH JOSHF
% OLFs=[OLFs OLF];
% LFs=[LFs LF];
% Pres=[Pres pre];
% Posts=[Posts post];
% OFs=[OFs OF];
Waters=[Waters 29];
Reds=[Reds 0];
SHs=[SHs 0];
Parts=[Parts 0];

path='E:\CME Superfolder\CME Data\170308_Data_Analysis\orig_movies\001_BS_Cell2';
figpath=strcat(path,'_29pWater');
load(strcat(path,'.mat'))
%LifetimeVFrameWrapper;
%print(strcat(figpath,'_LT'),'-djpeg')
JHsdPlotter;
PreJHs=[PreJHs pre];
PostJHs=[PostJHs post];
%print(strcat(figpath,'_JHSD'),'-djpeg')
%LifetimeVFrameWrapper_EC;
%print(strcat(figpath,'_LT_EC'),'-djpeg')
%JoshLTWrapper_NoPlot;
clear Threshfxyc JOSH JOSHF
% OLFs=[OLFs OLF];
% LFs=[LFs LF];
% Pres=[Pres pre];
% Posts=[Posts post];
% OFs=[OFs OF];
Waters=[Waters 29];
Reds=[Reds 0];
SHs=[SHs 0];
Parts=[Parts 0];

path='E:\CME Superfolder\CME Data\170308_Data_Analysis\orig_movies\002_BS_Cell1';
figpath=strcat(path,'_20pWater');
load(strcat(path,'.mat'))
%LifetimeVFrameWrapper;
%print(strcat(figpath,'_LT'),'-djpeg')
JHsdPlotter;
PreJHs=[PreJHs pre];
PostJHs=[PostJHs post];
%print(strcat(figpath,'_JHSD'),'-djpeg')
%LifetimeVFrameWrapper_EC;
%print(strcat(figpath,'_LT_EC'),'-djpeg')
%JoshLTWrapper_NoPlot;
clear Threshfxyc JOSH JOSHF
% OLFs=[OLFs OLF];
% LFs=[LFs LF];
% Pres=[Pres pre];
% Posts=[Posts post];
% OFs=[OFs OF];
Waters=[Waters 20];
Reds=[Reds 0];
SHs=[SHs 0];
Parts=[Parts 0];

path='E:\CME Superfolder\CME Data\170308_Data_Analysis\orig_movies\002_BS_Cell2';
figpath=strcat(path,'_20pWater');
load(strcat(path,'.mat'))
%LifetimeVFrameWrapper;
%print(strcat(figpath,'_LT'),'-djpeg')
JHsdPlotter;
PreJHs=[PreJHs pre];
PostJHs=[PostJHs post];
%print(strcat(figpath,'_JHSD'),'-djpeg')
%LifetimeVFrameWrapper_EC;
%print(strcat(figpath,'_LT_EC'),'-djpeg')
%JoshLTWrapper_NoPlot;
clear Threshfxyc JOSH JOSHF
% OLFs=[OLFs OLF];
% LFs=[LFs LF];
% Pres=[Pres pre];
% Posts=[Posts post];
% OFs=[OFs OF];
Waters=[Waters 20];
Reds=[Reds 0];
SHs=[SHs 0];
Parts=[Parts 0];

path='E:\CME Superfolder\CME Data\170308_Data_Analysis\orig_movies\003_BS_Cell1';
figpath=strcat(path,'_40pWater');
load(strcat(path,'.mat'))
%LifetimeVFrameWrapper;
%print(strcat(figpath,'_LT'),'-djpeg')
JHsdPlotter;
PreJHs=[PreJHs pre];
PostJHs=[PostJHs post];
%print(strcat(figpath,'_JHSD'),'-djpeg')
%LifetimeVFrameWrapper_EC;
%print(strcat(figpath,'_LT_EC'),'-djpeg')
%JoshLTWrapper_NoPlot;
clear Threshfxyc JOSH JOSHF
% OLFs=[OLFs OLF];
% LFs=[LFs LF];
% Pres=[Pres pre];
% Posts=[Posts post];
% OFs=[OFs OF];
Waters=[Waters 40];
Reds=[Reds 0];
SHs=[SHs 0];
Parts=[Parts 0];

path='E:\CME Superfolder\CME Data\170308_Data_Analysis\orig_movies\003_BS_Cell2';
figpath=strcat(path,'_40pWater');
load(strcat(path,'.mat'))
%LifetimeVFrameWrapper;
%print(strcat(figpath,'_LT'),'-djpeg')
JHsdPlotter;
PreJHs=[PreJHs pre];
PostJHs=[PostJHs post];
%print(strcat(figpath,'_JHSD'),'-djpeg')
%LifetimeVFrameWrapper_EC;
%print(strcat(figpath,'_LT_EC'),'-djpeg')
%JoshLTWrapper_NoPlot;
clear Threshfxyc JOSH JOSHF
% OLFs=[OLFs OLF];
% LFs=[LFs LF];
% Pres=[Pres pre];
% Posts=[Posts post];
% OFs=[OFs OF];
Waters=[Waters 40];
Reds=[Reds 0];
SHs=[SHs 0];
Parts=[Parts 0];

path='E:\CME Superfolder\CME Data\170308_Data_Analysis\orig_movies\004_BS_Cell1';
figpath=strcat(path,'_29pWater');
load(strcat(path,'.mat'))
%LifetimeVFrameWrapper;
%print(strcat(figpath,'_LT'),'-djpeg')
JHsdPlotter;
PreJHs=[PreJHs pre];
PostJHs=[PostJHs post];
%print(strcat(figpath,'_JHSD'),'-djpeg')
%LifetimeVFrameWrapper_EC;
%print(strcat(figpath,'_LT_EC'),'-djpeg')
%JoshLTWrapper_NoPlot;
clear Threshfxyc JOSH JOSHF JOSH JOSHF
% OLFs=[OLFs OLF];
% LFs=[LFs LF];
% Pres=[Pres pre];
% Posts=[Posts post];
% OFs=[OFs OF];
Waters=[Waters 29];
Reds=[Reds 0];
SHs=[SHs 0];
Parts=[Parts 0];

path='E:\CME Superfolder\CME Data\170308_Data_Analysis\orig_movies\004_BS_Cell2';
figpath=strcat(path,'_29pWater');
load(strcat(path,'.mat'))
%LifetimeVFrameWrapper;
%print(strcat(figpath,'_LT'),'-djpeg')
JHsdPlotter;
PreJHs=[PreJHs pre];
PostJHs=[PostJHs post];
%print(strcat(figpath,'_JHSD'),'-djpeg')
%LifetimeVFrameWrapper_EC;
%print(strcat(figpath,'_LT_EC'),'-djpeg')
%JoshLTWrapper_NoPlot;
clear Threshfxyc JOSH JOSHF
% OLFs=[OLFs OLF];
% LFs=[LFs LF];
% Pres=[Pres pre];
% Posts=[Posts post];
% OFs=[OFs OF];
Waters=[Waters 29];
Reds=[Reds 0];
SHs=[SHs 0];
Parts=[Parts 0];