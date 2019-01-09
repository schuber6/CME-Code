folder='E:\CME Superfolder\CME Data\180420_SUM_CALM_AP2_SIRNA\Isolated Cells\Split Channels';
files=FindFiles(folder,'*FXYCMS.mat').';
i=8;
movieR=strcat(files{i}(1:end-11),'.tif');
movieG=strcat(files{i}(1:end-14),'Green.tif');


[masks_Cell, Thresh] = spread_cell_thresholding_FirstFrame(movieR);
[masks_Pits, Thresh] = spread_cell_thresholding_FirstFrame(movieR);

Cytosol_mask=masks_Cell-masks_Pits;
Cytosol_maskbool=Cytosol_mask>0;
IM=imread(movieG,'Index',1);
Masked=double(IM).*Cytosol_maskbool(:,:,1);
[a,b]=size(Masked);
Med=median(nonzeros(reshape(Masked,[1 a*b])));

BackMask=~(masks_Cell(:,:,1)>0);
Masked=double(IM).*BackMask;
[a,b]=size(Masked);
MedBack=median(nonzeros(reshape(Masked,[1 a*b])));


%%

IM=imread(movieR,'Index',1);
[bx,by,mask] = thresholding(IM,42);

%%

clear A
L=length(masks(1,1,:));
for i=1:L
    A(i)=sum(sum(masks(:,:,i)>0));
end
figure
plot(A)

Area=mean(A(1:5))*.16^2;

%%

MF=MaxFrameFXYCMS(FXYCMS_Sel);
Is=zeros(1,MF);
for i=1:length(FXYCMS_Sel)
    F=FXYCMS_Sel{i}(1,1);
    Is(F)=Is(F)+1;
end
figure
plot(Is)
MIs=mean(Is(100:200));

IsPum2Pmin=MIs*20/Area;

%%

folder='E:\CME Superfolder\CME Data\180412_SUM_CALM_AP2_GoodData\RedTraces\AP2 CALM';
files=FindFiles(folder,'*170409*.mat').';
i=1;
folderM='E:\CME Superfolder\CME Data\180412_SUM_CALM_AP2_GoodData\RedTraces\AP2 CALM\movies';
filesM=FindFiles(folderM,'*170409*Red*');


[masks, Thresh] = spread_cell_thresholding(filesM{1});

%%

IM=imread(movieR,'Index',1);
[bx,by,mask] = thresholding(IM,42);

%%

clear A
L=length(masks(1,1,:));
for i=1:L
    A(i)=sum(sum(masks(:,:,i)>0));
end
figure
plot(A)

Area=mean(A(1:5))*.16^2;

%%
i=1;
load(files{i})
FXYCMS_Sel=SelectSmallOnes(FXYCMS);
MF=MaxFrameFXYCMS(FXYCMS_Sel);
Is=zeros(1,MF);
for i=1:length(FXYCMS_Sel)
    F=FXYCMS_Sel{i}(1,1);
    Is(F)=Is(F)+1;
end
figure
plot(Is)
MIs=mean(Is(25:75));

IsPum2Pmin=MIs*20/Area;
