folder='E:\CME Superfolder\CME Data\180420_SUM_CALM_AP2_SIRNA\Isolated Cells\Split Channels';
files=FindFiles(folder,'*FXYCMS.mat').';
i=12;
load(files{i})
movieR=strcat(files{i}(1:end-11),'.tif');
movieG=strcat(files{i}(1:end-14),'Green.tif');
filetst=strcat(files{i}(1:end-11),'_tst_Large.mat');
FXYCMS_Sel=SelectSmallOnes(FXYCMS);
tracest=FXYCMS2Tracest(FXYCMS_Sel,'Slave');
save(filetst,'tracest')
figure_code_for_scott(movieG,movieR,filetst);

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