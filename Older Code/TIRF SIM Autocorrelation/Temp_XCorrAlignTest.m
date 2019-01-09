folder='E:\CME Superfolder\CME Data\TIRF SIM\Control CALM Clathrin';
files=FindFiles(folder,'*.tif').';
Inds=[9 10];
IM1=imread(files{Inds(1)},'Index',1);
IM2=imread(files{Inds(2)},'Index',1);

%IM3 = imtranslate(IM2,[5,4],'outputview','same');
[shift_x,shift_y,DM,SIM1,SIM2]=AlignAndMaxXCorr(IM1,IM2);

%%

IM3 = imtranslate(IM2,[shift_x,shift_y],'outputview','same');

figure
imagesc(IM1(1:end+round(shift_y),round(shift_x):end))
figure
imagesc(IM3(1:end+round(shift_y),round(shift_x):end))