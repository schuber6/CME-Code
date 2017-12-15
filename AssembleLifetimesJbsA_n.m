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
nJbsA=[];
nJas80=[];
xbins=1:300;
xbins=xbins*3;

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
nJbsA=[nJbsA Jb];
subplot(5,5,1)
H=hist(Jb,xbins);
plot(xbins,H,'b')
hold on
xlim([0 300])
M=max(H);
text(100,M*1.1,strcat('Mean=',num2str(mean(Jb))))
clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170308_Data_Analysis\orig_movies\003_BS_Cell2';
figpath=strcat(path,'_40pWater');
load(strcat(path,'.mat'))
[Jb,Ja]=FindRelevantLifetimes(300,Threshfxyc);
nLT40L=[nLT40L mean(Ja)/mean(Jb)];
nLTb40L=[nLTb40L mean(Jb)];
Jbs=[Jbs Jb];
Jas=[Jas Ja];
nJbsA=[nJbsA Jb];
subplot(5,5,2)
H=hist(Jb,xbins);
plot(xbins,H,'b')
hold on
xlim([0 300])
M=max(H);
text(100,M*1.1,strcat('Mean=',num2str(mean(Jb))))

nAv40b=mean(Jbs);
nAv40a=mean(Jas);
nLTC40=nAv40a/nAv40b;
nLTEB40=sqrt(var(nLT40L))/sqrt(length(nLT40L));
nLTEBb40=sqrt(var(nLTb40L))/sqrt(length(nLTb40L));

Jbs=[];
Jas=[];

%50-70
% clear Threshfxyc JOSH JOSHF
% path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_cell2008_BS_Cell1_Red';
% figpath=strcat(path,'_50pWater');
% load(strcat(path,'.mat'))
% [Jb,Ja]=FindRelevantLifetimes(300,Threshfxyc);
% nLT60L=[nLT60L mean(Ja)/mean(Jb)];
% nLTb60L=[nLTb60L mean(Jb)];
% Jbs=[Jbs Jb];
% Jas=[Jas Ja];
% nJbsA=[nJbsA Jb];
% subplot(5,5,3)
% H=hist(Jb,xbins);
% plot(xbins,H,'b')
% hold on
% xlim([0 300])
% M=max(H);
% text(100,M*1.1,strcat('Mean=',num2str(mean(Jb))))
% clear Threshfxyc JOSH JOSHF
% path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_cell2008_BS_Cell2_NoRed';
% figpath=strcat(path,'_50pWater');
% load(strcat(path,'.mat'))
% [Jb,Ja]=FindRelevantLifetimes(300,Threshfxyc);
% nLT60L=[nLT60L mean(Ja)/mean(Jb)];
% nLTb60L=[nLTb60L mean(Jb)];
% Jbs=[Jbs Jb];
% Jas=[Jas Ja];
% nJbsA=[nJbsA Jb];
% subplot(5,5,4)
% H=hist(Jb,xbins);
% plot(xbins,H,'b')
% hold on
% xlim([0 300])
% M=max(H);
% text(100,M*1.1,strcat('Mean=',num2str(mean(Jb))))
clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170221_Analysis\orig_movies\001_BS_Crop';
figpath=strcat(path,'_50pWater');
load(strcat(path,'.mat'))
[Jb,Ja]=FindRelevantLifetimes(300,Threshfxyc);
nLT60L=[nLT60L mean(Ja)/mean(Jb)];
nLTb60L=[nLTb60L mean(Jb)];
Jbs=[Jbs Jb];
Jas=[Jas Ja];
nJbsA=[nJbsA Jb];
subplot(5,5,5)
H=hist(Jb,xbins);
plot(xbins,H,'b')
hold on
xlim([0 300])
M=max(H);
text(100,M*1.1,strcat('Mean=',num2str(mean(Jb))))
% clear Threshfxyc JOSH JOSHF
% path='E:\CME Superfolder\CME Data\170221_Analysis\orig_movies\002_BS_Crop';
% OsmoT=165;
% figpath=strcat(path,'_64pWater');
% load(strcat(path,'.mat'))
% [Jb,Ja]=FindRelevantLifetimes(OsmoT,Threshfxyc);
% nLT60L=[nLT60L mean(Ja)/mean(Jb)];
% nLTb60L=[nLTb60L mean(Jb)];
% Jbs=[Jbs Jb];
% Jas=[Jas Ja];
% nJbsA=[nJbsA Jb];
% subplot(5,5,6)
% H=hist(Jb,xbins);
% plot(xbins,H,'b')
% hold on
% xlim([0 300])
% M=max(H);
% text(100,M*1.1,strcat('Mean=',num2str(mean(Jb))))

nAv60b=mean(Jbs);
nAv60a=mean(Jas);
nLTC60=nAv60a/nAv60b;
nLTEB60=sqrt(var(nLT60L))/sqrt(length(nLT60L));
nLTEBb60=sqrt(var(nLTb60L))/sqrt(length(nLTb60L));

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
nJbsA=[nJbsA Jb];
subplot(5,5,7)
H=hist(Jb,xbins);
plot(xbins,H,'b')
hold on
xlim([0 300])
M=max(H);
text(100,M*1.1,strcat('Mean=',num2str(mean(Jb))))
clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_cell2011_BS_Cell2_NoRed';
figpath=strcat(path,'_80pWater');
load(strcat(path,'.mat'))
[Jb,Ja]=FindRelevantLifetimes(300,Threshfxyc);
nLT80L=[nLT80L mean(Ja)/mean(Jb)];
nLTb80L=[nLTb80L mean(Jb)];
Jbs=[Jbs Jb];
Jas=[Jas Ja];
nJbsA=[nJbsA Jb];
subplot(5,5,8)
H=hist(Jb,xbins);
plot(xbins,H,'b')
hold on
xlim([0 300])
M=max(H);
text(100,M*1.1,strcat('Mean=',num2str(mean(Jb))))
clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_cell2011_BS_pCell3_NoRed';
figpath=strcat(path,'_80pWater');
load(strcat(path,'.mat'))
[Jb,Ja]=FindRelevantLifetimes(300,Threshfxyc);
nLT80L=[nLT80L mean(Ja)/mean(Jb)];
nLTb80L=[nLTb80L mean(Jb)];
Jbs=[Jbs Jb];
Jas=[Jas Ja];
nJbsA=[nJbsA Jb];
subplot(5,5,9)
H=hist(Jb,xbins);
plot(xbins,H,'b')
hold on
xlim([0 300])
M=max(H);
text(100,M*1.1,strcat('Mean=',num2str(mean(Jb))))
clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_cell2011_BS_pCell4_NoRed';
figpath=strcat(path,'_80pWater');
load(strcat(path,'.mat'))
[Jb,Ja]=FindRelevantLifetimes(300,Threshfxyc);
nLT80L=[nLT80L mean(Ja)/mean(Jb)];
nLTb80L=[nLTb80L mean(Jb)];
Jbs=[Jbs Jb];
Jas=[Jas Ja];
nJbsA=[nJbsA Jb];
subplot(5,5,10)
H=hist(Jb,xbins);
plot(xbins,H,'b')
hold on
xlim([0 300])
M=max(H);
text(100,M*1.1,strcat('Mean=',num2str(mean(Jb))))
clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170302_Data_Analysis\orig_movies\fol2_002_BS_Cell1_Red';
figpath=strcat(path,'_75pWater');
load(strcat(path,'.mat'))
[Jb,Ja]=FindRelevantLifetimes(300,Threshfxyc);
nLT80L=[nLT80L mean(Ja)/mean(Jb)];
nLTb80L=[nLTb80L mean(Jb)];
Jbs=[Jbs Jb];
Jas=[Jas Ja];
nJbsA=[nJbsA Jb];
subplot(5,5,11)
H=hist(Jb,xbins);
plot(xbins,H,'b')
hold on
xlim([0 300])
M=max(H);
text(100,M*1.1,strcat('Mean=',num2str(mean(Jb))))
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
nJbsA=[nJbsA Jb];
subplot(5,5,12)
H=hist(Jb,xbins);
plot(xbins,H,'b')
hold on
xlim([0 300])
M=max(H);
text(100,M*1.1,strcat('Mean=',num2str(mean(Jb))))
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
nJbsA=[nJbsA Jb];
subplot(5,5,13)
H=hist(Jb,xbins);
plot(xbins,H,'b')
hold on
xlim([0 300])
M=max(H);
text(100,M*1.1,strcat('Mean=',num2str(mean(Jb))))

nJas80=Jas;
nJbs80=Jbs;

nAv80b=mean(Jbs);
nAv80a=mean(Jas);
nLTC80=nAv80a/nAv80b;
nLTEB80=sqrt(var(nLT80L))/sqrt(length(nLT80L));
nLTEBb80=sqrt(var(nLTb80L))/sqrt(length(nLTb80L));

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
nJbsA=[nJbsA Jb];
subplot(5,5,14)
H=hist(Jb,xbins);
plot(xbins,H,'b')
hold on
xlim([0 300])
M=max(H);
text(100,M*1.1,strcat('Mean=',num2str(mean(Jb))))
% clear Threshfxyc JOSH JOSHF
% path='E:\CME Superfolder\CME Data\170308_Data_Analysis\orig_movies\004_BS_Cell1';
% figpath=strcat(path,'_29pWater');
% load(strcat(path,'.mat'))
% [Jb,Ja]=FindRelevantLifetimes(OsmoT,Threshfxyc);
% nLT20L=[nLT20L mean(Ja)/mean(Jb)];
% nLTb20L=[nLTb20L mean(Jb)];
% Jbs=[Jbs Jb];
% Jas=[Jas Ja];
% nJbsA=[nJbsA Jb];
% subplot(5,5,15)
% H=hist(Jb,xbins);
% plot(xbins,H,'b')
% hold on
% xlim([0 300])
% M=max(H);
% text(100,M*1.1,strcat('Mean=',num2str(mean(Jb))))
clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170308_Data_Analysis\orig_movies\002_BS_Cell2';
figpath=strcat(path,'_20pWater');
load(strcat(path,'.mat'))
[Jb,Ja]=FindRelevantLifetimes(OsmoT,Threshfxyc);
nLT20L=[nLT20L mean(Ja)/mean(Jb)];
nLTb20L=[nLTb20L mean(Jb)];
Jbs=[Jbs Jb];
Jas=[Jas Ja];
nJbsA=[nJbsA Jb];
subplot(5,5,16)
H=hist(Jb,xbins);
plot(xbins,H,'b')
hold on
xlim([0 300])
M=max(H);
text(100,M*1.1,strcat('Mean=',num2str(mean(Jb))))
clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170308_Data_Analysis\orig_movies\002_BS_Cell1';
figpath=strcat(path,'_20pWater');
load(strcat(path,'.mat'))
[Jb,Ja]=FindRelevantLifetimes(OsmoT,Threshfxyc);
nLT20L=[nLT20L mean(Ja)/mean(Jb)];
nLTb20L=[nLTb20L mean(Jb)];
Jbs=[Jbs Jb];
Jas=[Jas Ja];
nJbsA=[nJbsA Jb];
subplot(5,5,17)
H=hist(Jb,xbins);
plot(xbins,H,'b')
hold on
xlim([0 300])
M=max(H);
text(100,M*1.1,strcat('Mean=',num2str(mean(Jb))))
clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170308_Data_Analysis\orig_movies\001_BS_Cell2';
figpath=strcat(path,'_29pWater');
load(strcat(path,'.mat'))
[Jb,Ja]=FindRelevantLifetimes(OsmoT,Threshfxyc);
nLT20L=[nLT20L mean(Ja)/mean(Jb)];
nLTb20L=[nLTb20L mean(Jb)];
Jbs=[Jbs Jb];
Jas=[Jas Ja];
nJbsA=[nJbsA Jb];
subplot(5,5,18)
H=hist(Jb,xbins);
plot(xbins,H,'b')
hold on
xlim([0 300])
M=max(H);
text(100,M*1.1,strcat('Mean=',num2str(mean(Jb))))
clear Threshfxyc JOSH JOSHF
path='E:\CME Superfolder\CME Data\170308_Data_Analysis\orig_movies\001_BS_Cell1';
figpath=strcat(path,'_29pWater');
load(strcat(path,'.mat'))
[Jb,Ja]=FindRelevantLifetimes(OsmoT,Threshfxyc);
nLT20L=[nLT20L mean(Ja)/mean(Jb)];
nLTb20L=[nLTb20L mean(Jb)];
Jbs=[Jbs Jb];
Jas=[Jas Ja];
nJbsA=[nJbsA Jb];
subplot(5,5,19)
H=hist(Jb,xbins);
plot(xbins,H,'b')
hold on
xlim([0 300])
M=max(H);
text(100,M*1.1,strcat('Mean=',num2str(mean(Jb))))

nAv20b=mean(Jbs);
nAv20a=mean(Jas);
nLTC20=nAv20a/nAv20b;
nLTEB20=sqrt(var(nLT20L))/sqrt(length(nLT20L));
nLTEBb20=sqrt(var(nLTb20L))/sqrt(length(nLTb20L));
clear Threshfxyc JOSH JOSHF

% errorbar([26 40 53.5 78],[nLTC20 nLTC40 nLTC60 nLTC80],[nLTEB20 nLTEB40 nLTEB60 nLTEB80])
% hold on
