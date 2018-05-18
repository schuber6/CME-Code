function [Cyt,Back,Area]=CytosolicBackground(folder)

%folder='E:\CME Superfolder\CME Data\SingleFrameCMEAnalysisTest\orig_movies';
[files,names]=FindFiles_Full(folder,'*Green.tif');
%splitf1='E:\CME Superfolder\CME Data\SingleFrameCMEAnalysisTest\split_movies\';
splitf1=strcat(folder(1:end-11),'split_movies\');
splitf2='\Section1\Cell1_3\ch1\Tracking\ProcessedTracks.mat';
for i0=1:length(files)
    fileG=strcat(splitf1,names{i0}(1:end-4),splitf2);
    load(fileG)
    %movieR=strcat(files{i0}(1:end-11),'.tif');
    %movieG=strcat(files{i0}(1:end-14),'Green.tif');
    movieG=files{i0};
    [masks, Thresh] = spread_cell_thresholding_FirstFrame(files{i0});
    [masks1,~]=spread_cell_thresholding_FirstFrame_1Thresh(files{i0});
    masks1bool=imfill(masks1(:,:,1)>0,'holes');
    IM=imread(movieG,'Index',1);
    events=FirstFrameEvents_Tracks(tracks);
    IM=CoverEventsImage(IM,events);
    masksbool=imfill(masks(:,:,1)>0,'holes');
    Area(i0)=sum(sum(double(masksbool)))*.16^2;
    masked=masksbool.*(double(IM)+1);
    [a,b]=size(masked);
    vect=reshape(masked,[1 a*b]);
    Cyt(i0)=mean(nonzeros(vect))-1;
    Invmasksbool=masks1bool & ~masksbool;
    Invmasked=Invmasksbool.*(double(IM)+1);
    vect=reshape(Invmasked,[1 a*b]);
    Back(i0)=mean(nonzeros(vect)-1);
end