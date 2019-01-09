function [Cyt,Back,Area]=CytosolicBackground_SingleFile(file,FXYCMS)



    %movieR=strcat(files{i0}(1:end-11),'.tif');
    %movieG=strcat(files{i0}(1:end-14),'Green.tif');
    movieG=file;
    [masks, Thresh] = spread_cell_thresholding_FirstFrame(file);
    [masks1,~]=spread_cell_thresholding_FirstFrame_1Thresh(file);
    masks1bool=imfill(masks1(:,:,1)>0,'holes');
    IM=imread(movieG,'Index',1);
    events=FirstFrameEvents_FXYCMS(FXYCMS,0);
    IM=CoverEventsImage(IM,events);
    masksbool=imfill(masks(:,:,1)>0,'holes');
    Area=sum(sum(double(masksbool)))*.16^2;
    masked=masksbool.*(double(IM)+1);
    [a,b]=size(masked);
    vect=reshape(masked,[1 a*b]);
    Cyt=mean(nonzeros(vect))-1;
    Invmasksbool=masks1bool & ~masksbool;
    Invmasked=Invmasksbool.*(double(IM)+1);
    vect=reshape(Invmasked,[1 a*b]);
    Back=mean(nonzeros(vect)-1);
    

    
    
