folder='E:\CME Superfolder\CME Data\180420_SUM_CALM_AP2_SIRNA\Isolated Cells\Split Channels';
files=FindFiles(folder,'*FXYCMS.mat').';
i=9;
load(files{i})
movieR=strcat(files{i}(1:end-11),'.tif');
movieG=strcat(files{i}(1:end-14),'Green.tif');
filetst=strcat(files{i}(1:end-11),'_tst_Large.mat');
FXYCMS_Large=SelectLargeOnes(FXYCMS);
FXYCMS_Small=SelectSmallOnes(FXYCMS);