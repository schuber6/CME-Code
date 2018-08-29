folder='E:\CME Superfolder\CME Data\180420_SUM_CALM_AP2_SIRNA\Isolated Cells\Split Channels';
files=FindFiles(folder,'*FXYCMS.mat').';
i=21;
load(files{i})
movieR=strcat(files{i}(1:end-11),'.tif');
movieG=strcat(files{i}(1:end-14),'Green.tif');
filetst=strcat(files{i}(1:end-11),'_tst_Large.mat');
FXYCMS_Sel=SelectLargeOnes(FXYCMS);
tracest=FXYCMS2Tracest(FXYCMS_Sel);
save(filetst,'tracest')
figure_code_for_scott_StaticArea(movieG,movieR,filetst);

%%

folder='E:\CME Superfolder\CME Data\180420_SUM_CALM_AP2_SIRNA\Isolated Cells\Split Channels';
files=FindFiles(folder,'*FXYCMS.mat').';
i=6;
load(files{i})
movieR=strcat(files{i}(1:end-11),'.tif');
movieG=strcat(files{i}(1:end-14),'Green.tif');
filetst=strcat(files{i}(1:end-11),'_tst_Small.mat');
FXYCMS_Sel=SelectSmallOnes(FXYCMS);
tracest=FXYCMS2Tracest(FXYCMS_Sel);
save(filetst,'tracest')
figure_code_for_scott(movieR,movieR,filetst);

%%


folder='E:\CME Superfolder\CME Data\180420_SUM_CALM_AP2_SIRNA\Isolated Cells\Split Channels';
files=FindFiles(folder,'*FXYCMS.mat').';
i=12;
load(files{i})
movieR=strcat(files{i}(1:end-11),'.tif');
movieG=strcat(files{i}(1:end-14),'Green.tif');
filetst=strcat(files{i}(1:end-11),'_tst_Kept.mat');
tracest=FXYCMS2Tracest(FXYCMS_Kept);
save(filetst,'tracest')
figure_code_for_scott(movieR,movieR,filetst);

%%
file=DataWT(2).file;
movie=DataWT(2).movieR;
load(file)
filetst='TST_Test.mat';
for i=1:length(FXYCMS)
    Value2(i)=mean(MsqE_Traces{i});
end
tracest=FXYCMS2Tracest(FXYCMS,MsqE_Traces_Pad,Value);
save(filetst,'tracest')
figure_code_for_scott_StaticArea(movie,movie,filetst);

%%

folder='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\WT_osmo_3m\Movies';
files=FindFiles(folder,'*FXYCMS.mat').';
i=4;
FrameGap=2;
load(files{i})
FXYCMS=AddMSJoshSlopes(FXYCMS,FrameGap);
[FXYCMS_Sel,Value,Slopes]=SelectByJoshSlopeConclusions(FXYCMS);
movieR=strcat(files{i}(1:end-11),'.tif');
movieG=strcat(files{i}(1:end-14),'Green.tif');
filetst=strcat(files{i}(1:end-11),'_tst_Small.mat');
tracest=FXYCMS2Tracest(FXYCMS_Sel,Value,Slopes);
save(filetst,'tracest')
figure_code_for_scott_StaticArea(movieR,movieR,filetst);

%%

folder='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\WT_osmo_10m\Movies';
files=FindFiles(folder,'*FXYCMS.mat').';
i=1;
FrameGap=2;
load(files{i})
[FXYCMS_Sel]=SelectByIntensity(FXYCMS);
movieR=strcat(files{i}(1:end-11),'.tif');
movieG=strcat(files{i}(1:end-14),'Green.tif');
filetst=strcat(files{i}(1:end-11),'_tst_Small.mat');
tracest=FXYCMS2Tracest(FXYCMS_Sel);
save(filetst,'tracest')
figure_code_for_scott_StaticArea(movieR,movieR,filetst);

%%

folder='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\WT_osmo_10m\Movies';
files=FindFiles(folder,'*FXYCMS.mat').';
i=1;
FrameGap=2;
load(files{i})
FXYCMS=AddMSJoshSlopes(FXYCMS,FrameGap);
[FXYCMS_Sel,Value,Slopes]=SelectStallsByJoshSlopes(FXYCMS);
movieR=strcat(files{i}(1:end-11),'.tif');
movieG=strcat(files{i}(1:end-14),'Green.tif');
filetst=strcat(files{i}(1:end-11),'_tst_Small.mat');
tracest=FXYCMS2Tracest(FXYCMS_Sel,Value,Slopes);
save(filetst,'tracest')
figure_code_for_scott_StaticArea(movieR,movieR,filetst);

%%

folder='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\WT_osmo_10m\Movies';
files=FindFiles(folder,'*FXYCMS.mat').';
i=6;
FrameGap=2;
load(files{i})
FXYCMS=AddMSJoshSlopes(FXYCMS,FrameGap);
%[FXYCMS_Sel,Value,Slopes]=SelectStallsByJoshSlopes(FXYCMS);
[Nc,Fs,FXYCMS_Sel]=CountConclusions_BySlope(FXYCMS,3000,15,FrameGap,60);
movieR=strcat(files{i}(1:end-11),'.tif');
movieG=strcat(files{i}(1:end-14),'Green.tif');
filetst=strcat(files{i}(1:end-11),'_tst_Small.mat');
tracest=FXYCMS2Tracest(FXYCMS_Sel);
save(filetst,'tracest')
figure_code_for_scott_StaticArea(movieR,movieR,filetst);

%%

%folder='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\SI_cont\Movies';
folder='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath SI\Movies';
files=FindFiles(folder,'*FXYCMS.mat').';
i=3;
FrameGap=2;
load(files{i})
FXYCMS=AddMSJoshSlopes(FXYCMS,FrameGap); 
%[FXYCMS_Sel,Value,Slopes]=SelectStallsByJoshSlopes(FXYCMS);
[Nc,Fs,FXYCMS_Sel,slopes,value,D,R2]=CountConclusions_BySlope(FXYCMS,900,5,FrameGap);
movieR=strcat(files{i}(1:end-11),'.tif');
movieG=strcat(files{i}(1:end-14),'Green.tif');
filetst=strcat(files{i}(1:end-11),'_tst_Small.mat');
tracest=FXYCMS2Tracest(FXYCMS_Sel,R2,D);
save(filetst,'tracest')
figure_code_for_scott_StaticArea(movieR,movieR,filetst);

%%

folder='E:\CME Superfolder\CME Data\180821 DSI Omso Analysis\SI Cont\Traces';
moviefolder='E:\CME Superfolder\CME Data\180821 DSI Omso Analysis\SI Cont\Movies';
[files,names]=FindFiles_Full(folder,'*FXYCMS.mat');
i=2;
FrameGap=2;
load(files{i})
FXYCMS=AddMSJoshSlopes(FXYCMS,FrameGap); 
%[FXYCMS_Sel,Value,Slopes]=SelectStallsByJoshSlopes(FXYCMS);
[Nc,Fs,FXYCMS_Sel,slopes,value,D,R2]=CountConclusions_BySlope(FXYCMS,900,5,FrameGap);
% movieR=strcat(files{i}(1:end-11),'.tif');
% movieG=strcat(files{i}(1:end-14),'Green.tif');
movieR=strcat(moviefolder,'\',names{i}(1:end-14),'Red.tif');
movieG=strcat(moviefolder,'\',names{i}(1:end-14),'Green.tif');

filetst=strcat(files{i}(1:end-11),'_tst_Inits.mat');
tracest=FXYCMS2Tracest(FXYCMS_Sel,R2,D);
save(filetst,'tracest')
figure_code_for_scott_StaticArea(movieR,movieR,filetst);

%%

folder='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath SI\Movies';
files=FindFiles(folder,'*Red_FXYCMS.mat').';
i=2;
FrameGap=2;
load(files{i})
% Stall=FindFullMovieTraces(FXYCMS,75);
FS={};
ind=1;
Tmast=10000;
for i0=1:length(FXYCMS)
    if max(FXYCMS{i0}(:,6))>=Tmast
        FS{ind}=FXYCMS{i0};
        ind=ind+1;
    end
end
movieR=strcat(files{i}(1:end-11),'.tif');
movieG=strcat(files{i}(1:end-14),'Green.tif');
filetst=strcat(files{i}(1:end-11),'_tst_Small.mat');
tracest=FXYCMS2Tracest(FS);
save(filetst,'tracest')
figure_code_for_scott_StaticArea(movieR,movieR,filetst);

%%

%folder='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\SI_cont\Movies';
folder='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath SI\Movies';
files=FindFiles(folder,'*Red*FXYCMS.mat').';
i=1;
FrameGap=2;
load(files{i})
FXYCMS=AddMSJoshSlopes(FXYCMS,FrameGap); 
%[FXYCMS_Sel,Value,Slopes]=SelectStallsByJoshSlopes(FXYCMS);
[Nc,Fs,FXYCMS_Sel,slopes,value,D,R2]=CountAbortives_BySlope(FXYCMS,900,5,FrameGap,Inf,1);
movieR=strcat(files{i}(1:end-11),'.tif');
movieG=strcat(files{i}(1:end-14),'Green.tif');
filetst=strcat(files{i}(1:end-11),'_tst_Small.mat');
tracest=FXYCMS2Tracest(FXYCMS_Sel,value,D);
save(filetst,'tracest')
figure_code_for_scott_StaticArea(movieR,movieR,filetst);

