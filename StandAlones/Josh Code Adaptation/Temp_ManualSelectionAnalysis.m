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
