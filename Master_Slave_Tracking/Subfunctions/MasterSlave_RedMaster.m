function MasterSlave_RedMaster(fxycfolder,Moviefolder)

folder=fxycfolder; %'E:\CME Superfolder\CME Data\180529_AllSUM_Green\WT\orig_movies';
[Matfiles,MatDesc]=FindFiles_Full(folder,'*Red.mat');
%Moviefolder='E:\CME Superfolder\CME Data\180529_AllSUM_Green\WT\BS\First5';
for i=1:length(Matfiles)
    movieM=strcat(Moviefolder,'/',MatDesc{i}(1:end-4),'.tif');
    movieS=strcat(movieM(1:end-7),'Green.tif');
    
    load(Matfiles{i})
    newfile=strcat(movieM(1:end-4),'_FXYCMS.mat');
    %load(movies{i0});
    [FXYCMS]=GenerateMasterSlaveINTs_PixelSum(Threshfxyc,movieS,400,movieM);
    save(newfile,'FXYCMS')
end