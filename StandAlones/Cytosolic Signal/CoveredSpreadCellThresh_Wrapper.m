folder='E:\CME Superfolder\CME Data\180420_SUM_CALM_AP2_SIRNA\Isolated Cells\Split Channels';
files=FindFiles(folder,'*FXYCMS.mat').';
for i0=3:3 %length(files)
    load(files{i0})
    movieR=strcat(files{i0}(1:end-11),'.tif');
    movieG=strcat(files{i0}(1:end-14),'Green.tif');
    [masks, Thresh] = spread_cell_thresholding_FirstFrame_Covered(movieR,FXYCMS);
    IM=imread(movieG,'Index',1);
    events=FirstFrameEvents(FXYCMS);
    IM=CoverEventsImage(IM,events);
    masksbool=masks>0;
    masked=masksbool.*double(IM);
    [a,b]=size(masked);
    vect=reshape(masked,[1 a*b]);
    Cyt(i0)=median(nonzeros(vect));
    Invmasksbool=masks==0;
    Invmasked=Invmasksbool.*double(IM);
    vect=reshape(Invmasked,[1 a*b]);
    Back(i0)=median(nonzeros(vect));
end