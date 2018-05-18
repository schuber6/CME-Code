
for i=1:length(DataWT)
    loc=strfind(DataWT(i).file,'WT\');
    name=DataWT(i).file(loc+3:end-14);
    fold=strcat(DataWT(i).file(1:loc+2),'TIFs\');
    DataWT(i).movieR=strcat(fold,name,'Red.tif');
    DataWT(i).movieG=strcat(fold,name,'Green.tif');
    
end
IM=imread(DataWT(1).movieR);

folder='E:\CME Superfolder\CME Data\SUM_CALM_BestData\siRNA';
files=FindFiles(folder,'*FXYCMS*');
for i=1:length(DataSI)
    DataSI(i).file=files{i};
    loc=strfind(DataSI(i).file,'NA\');
    name=DataSI(i).file(loc+3:end-14);
    fold=strcat(DataSI(i).file(1:loc+2),'TIFs\');
    DataSI(i).movieR=strcat(fold,name,'Red.tif');
    DataSI(i).movieG=strcat(fold,name,'Green.tif');
end
IM=imread(DataSI(1).movieG);

save DataWT_SI.mat DataWT DataSI