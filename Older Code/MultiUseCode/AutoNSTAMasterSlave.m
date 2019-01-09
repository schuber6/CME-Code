%Change for loop bounds
clear all
exp_name='E:\CME Superfolder\CME Data\170518_Analsis_GFP\orig_movies';
SlaveFolder='E:\CME Superfolder\CME Data\170518_Analysis';
omd=fullfile(exp_name);
tmpd = dir(fullfile(omd,'*.tif'));
for i=1:length(tmpd)
    movies{i} = fullfile(omd,tmpd(i).name);
    SlaveMovies{i}=fullfile(SlaveFolder,strcat(tmpd(i).name(1:end-10),'RFP_BS.tif'));  %May need to alter naming conventions
    fileFXYC{i}=strcat(movies{i}(1:end-4),'.mat');
    fileFXYCstruct{i}=strcat(movies{i}(1:end-4),'_NSTAwMasterSlave.mat');
    MasterThresh=400;
    load(fileFXYC{i})
    [NSTAgood]=GenerateMasterSlaveINTs_NSTA_0s(NSTA,fileSlave,MasterThresh);
    

    
    save(fileFXYCstruct{i},'NSTAgood')
    i
end