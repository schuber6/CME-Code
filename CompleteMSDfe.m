% fileSlave='E:\CME Superfolder\CME Data\skmel_squish_copy\orig_movies\007_CLTA_BS.tif';
% [SlaveINT,MasterINT]=GenerateMasterSlaveINTsFromEvents(Threshfxyc,fileSlave,eventsFXYCndc);
% MSDfe=ConstructMasterSlaveDataCellFromEvents(SlaveINT,Threshfxyc,eventsFXYCndc);
% save('S007_MSDfe.mat');

% fileSlave='E:\CME Superfolder\CME Data\skmel_squish_copy\orig_movies\006_CLTA_BS.tif';
% [SlaveINT,MasterINT]=GenerateMasterSlaveINTsFromEvents(Threshfxyc,fileSlave,eventsFXYCndc);
% MSDfe=ConstructMasterSlaveDataCellFromEvents(SlaveINT,Threshfxyc,eventsFXYCndc);
% save('S006_MSDfe.mat');

fileSlave='E:\CME Superfolder\CME Data\skmel_test_copy\orig_movies\006_CLTA_BS.tif';
[SlaveINT,MasterINT]=GenerateMasterSlaveINTsFromEvents(Threshfxyc,fileSlave,eventsFXYC);
MSDfe=ConstructMasterSlaveDataCellFromEvents(SlaveINT,Threshfxyc,eventsFXYC);
save('C006_MSDfe.mat');