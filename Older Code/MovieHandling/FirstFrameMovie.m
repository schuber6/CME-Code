function FirstFrameMovie(folder,newfolder)
%Takes all movies in folder and makes a 2 frame movie of
%the first frame in newfoler for cmeAnalysis
    
%folder='E:\CME Superfolder\CME Data\180420_SUM_CALM_AP2_SIRNA\Isolated Cells\Split Channels';
[files,names]=FindFiles_Full(folder,'*.tif');
%newfolder='E:\CME Superfolder\CME Data\SingleFrameCMEAnalysisTest\orig_movies';
mkdir(newfolder);
for i0=1:length(files)
    IM=imread(files{i0},'Index',1);
    newmovie=strcat(newfolder,'\',names{i0});
    for i=1:2
        imwrite(IM,newmovie,'Writemode','append','Compression','none')
    end
end