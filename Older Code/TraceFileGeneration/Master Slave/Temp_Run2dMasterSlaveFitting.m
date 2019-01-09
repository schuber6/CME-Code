folder='E:\CME Superfolder\CME Data\180214_CALMandAP2_CLCa_2dMovies\Traces';
files=FindFiles(folder,'*.mat').';
folder='E:\CME Superfolder\CME Data\180214_CALMandAP2_CLCa_2dMovies\orig_movies';
filesM=FindFiles(folder,'*.tif').';
for i=1:length(files)/2
    load(files{2*(i-1)+1})
    Mfxyc=Threshfxyc;
    load(files{2*i})
    Sfxyc=Threshfxyc;
%     [SlaveINT,MasterINT]=GenerateMasterSlaveINTs_BothFit(Mfxyc,filesM{2*i-1},400,filesM{2*i});
%     [MSD,Background]=ConstructMasterSlaveDataCell_BothFit(MasterINT,SlaveINT,Mfxyc,400);
    [FXYCMS]=GenerateMasterSlaveINTs_PixelSum(Mfxyc,filesM{2*i},400,filesM{2*i-1});
    newfile=strcat(filesM{2*i-1}(1:end-4),'_FXYCMS_PixelSum.mat');
    save(newfile,'FXYCMS')
end
