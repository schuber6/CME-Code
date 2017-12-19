clear all
exp_name='E:\CME Superfolder\CME Data\SinlgeGFP\orig_movies';
%exp_name='E:\CME Superfolder\CME Data\171010_Calibrated_AP2_DNM';

tmpd = dir(fullfile(exp_name,'*BS.mat'));
LastN=10;

MinNum=5;
for i0=2:5 %1:length(tmpd)
    
    movies{i0} = fullfile(exp_name,tmpd(i0).name);
    SaveFile=strcat(movies{i0}(1:end-4),'_ManSel.mat');
    if exist(SaveFile)~=0
        load(SaveFile)
    else
        Sevents=[];
        SAs=[];
        SIs=[];
        SUppers=[];
        SLowers=[];
        SDrops=[];
    end
    files{i0}=strcat(movies{i0}(1:end-4),'.tif');
    newfiles{i0}=strcat(movies{i0}(1:end-4),'_Boxed','.tif');
    load(movies{i0});
    if i0==2 || i0==5
        x=(10:MaxFrameFXYC(Threshfxyc)).';
        exposure=4;
        thresh=1000;
    else
        x=(5:MaxFrameFXYC(Threshfxyc)).';
        exposure=8;
        thresh=2000;
    end
    [events,As]=ListAllTracesThresholded(Threshfxyc,thresh,3);
    
    [Is,Bs]=ManualFitEvents(events,files{i0});
    [Sevents,SAs,SIs,SUppers,SLowers,SDrops]=ManuallySelectPhotobleaches(events,As,Is,Sevents,SAs,SIs,SUppers,SLowers,SDrops);
    
    save(SaveFile,'Sevents','SAs','SIs','SUppers','SLowers','SDrops')


end
    