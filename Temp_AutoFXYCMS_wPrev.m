%Change for loop bounds
clear all
%exp_name='E:\CME Superfolder\CME Data\170906_Analysis\orig_movies';
%SlaveFolder='E:\CME Superfolder\CME Data\170906_CALM_CLCa_Osmo';
SlaveFolder='E:\CME Superfolder\CME Data\170518_Analysis\170519_movies';
exp_name='E:\CME Superfolder\CME Data\170518_Analsis_GFP\orig_movies\170519_Data';
omd=fullfile(exp_name);
tmpd = dir(fullfile(omd,'*BS.mat'));
for i=1:length(tmpd)
    movies{i} = fullfile(omd,tmpd(i).name);
    SlaveMovies{i}=fullfile(SlaveFolder,strcat(tmpd(i).name(1:end-10),'RFP_BS.tif'));
    MasterMovies{i}=fullfile(SlaveFolder,strcat(tmpd(i).name(1:end-10),'GFP_BS.tif'));
    fileFXYC{i}=strcat(movies{i}(1:end-4),'.mat');
    fileFXYCstruct{i}=strcat(movies{i}(1:end-4),'_fxycMS_prev_medB.mat');
    MasterThresh=0;
    load(fileFXYC{i})
    Prevfxyc=AddPrevFrames(Threshfxyc);
    [fxycMS]=GenerateMasterSlaveINTs_FXYC_0s_faster_medB(Prevfxyc,SlaveMovies{i},MasterThresh,MasterMovies{i});
    
%     [SlaveINT,MasterINT]=GenerateMasterSlaveINTs_ALL(Threshfxyc,SlaveMovies{i},MasterThresh);
%     [MasterSlaveINT,~]=GenerateMasterSlaveINTs_ALL(Threshfxyc,movies{i},MasterThresh);
    
%     [MSD,Background]=ConstructMasterSlaveDataCell(SlaveINT,Threshfxyc,MasterThresh);
%     [MSDm,Backgroundm]=ConstructMasterSlaveDataCell(MasterSlaveINT,Threshfxyc,MasterThresh);
%     
%     [SlaveINT5,MasterINT5]=GenerateMasterSlaveINTs_ALL5(Threshfxyc,SlaveMovies{i},MasterThresh,Background);
%     [MasterSlaveINT5,~]=GenerateMasterSlaveINTs_ALL5(Threshfxyc,movies{i},MasterThresh,Backgroundm);
%     
%     [MSD5,Background5]=ConstructMasterSlaveDataCell5(SlaveINT5,Threshfxyc,MasterThresh);
%     [MSD5m,Background5m]=ConstructMasterSlaveDataCell5(MasterSlaveINT5,Threshfxyc,MasterThresh);
%     
%     fxyc_struct = fxyc_to_struct(Threshfxyc,false);
%     fxyc_struct = slope_finding(fxyc_struct,3,400);
%     
%     fxyc_struct=AddSlaveInt(fxyc_struct,MSD);
%     fxyc_struct=AddSlaveInt5(fxyc_struct,MSD5);
%     
%     fxyc_struct=AddMasterInt(fxyc_struct,MSDm);
%     fxyc_struct=AddMasterInt5(fxyc_struct,MSD5m);
    
    save(fileFXYCstruct{i},'fxycMS')
    i
end
%Change for loop bounds
clear all
exp_name='E:\CME Superfolder\CME Data\170906_Analysis\orig_movies';
SlaveFolder='E:\CME Superfolder\CME Data\170906_CALM_CLCa_Osmo';
%SlaveFolder='E:\CME Superfolder\CME Data\170518_Analysis\170519_movies';
%exp_name='E:\CME Superfolder\CME Data\170518_Analsis_GFP\orig_movies\170519_Data';
omd=fullfile(exp_name);
tmpd = dir(fullfile(omd,'*BS.mat'));
for i=1:length(tmpd)
    movies{i} = fullfile(omd,tmpd(i).name);
    SlaveMovies{i}=fullfile(SlaveFolder,strcat(tmpd(i).name(1:end-10),'RFP_BS.tif'));
    MasterMovies{i}=fullfile(SlaveFolder,strcat(tmpd(i).name(1:end-10),'GFP_BS.tif'));
    fileFXYC{i}=strcat(movies{i}(1:end-4),'.mat');
    fileFXYCstruct{i}=strcat(movies{i}(1:end-4),'_fxycMS_prev_medB.mat');
    MasterThresh=0;
    load(fileFXYC{i})
    Prevfxyc=AddPrevFrames(Threshfxyc);
    [fxycMS]=GenerateMasterSlaveINTs_FXYC_0s_faster_medB(Prevfxyc,SlaveMovies{i},MasterThresh,MasterMovies{i});
    
%     [SlaveINT,MasterINT]=GenerateMasterSlaveINTs_ALL(Threshfxyc,SlaveMovies{i},MasterThresh);
%     [MasterSlaveINT,~]=GenerateMasterSlaveINTs_ALL(Threshfxyc,movies{i},MasterThresh);
    
%     [MSD,Background]=ConstructMasterSlaveDataCell(SlaveINT,Threshfxyc,MasterThresh);
%     [MSDm,Backgroundm]=ConstructMasterSlaveDataCell(MasterSlaveINT,Threshfxyc,MasterThresh);
%     
%     [SlaveINT5,MasterINT5]=GenerateMasterSlaveINTs_ALL5(Threshfxyc,SlaveMovies{i},MasterThresh,Background);
%     [MasterSlaveINT5,~]=GenerateMasterSlaveINTs_ALL5(Threshfxyc,movies{i},MasterThresh,Backgroundm);
%     
%     [MSD5,Background5]=ConstructMasterSlaveDataCell5(SlaveINT5,Threshfxyc,MasterThresh);
%     [MSD5m,Background5m]=ConstructMasterSlaveDataCell5(MasterSlaveINT5,Threshfxyc,MasterThresh);
%     
%     fxyc_struct = fxyc_to_struct(Threshfxyc,false);
%     fxyc_struct = slope_finding(fxyc_struct,3,400);
%     
%     fxyc_struct=AddSlaveInt(fxyc_struct,MSD);
%     fxyc_struct=AddSlaveInt5(fxyc_struct,MSD5);
%     
%     fxyc_struct=AddMasterInt(fxyc_struct,MSDm);
%     fxyc_struct=AddMasterInt5(fxyc_struct,MSD5m);
    
    save(fileFXYCstruct{i},'fxycMS')
    i
end