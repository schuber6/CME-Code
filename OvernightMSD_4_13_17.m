fileDNRFXYC='E:\CME Superfolder\CME Data\Hydrogel\movies\80ph2o1t\orig_movies\Stack_1.mat';
fileDNRtif='E:\CME Superfolder\CME Data\Hydrogel\movies\80ph2o1t\orig_movies\Stack_1.tif';
fileCLTAFXYC='E:\CME Superfolder\CME Data\Hydrogel\movies\80ph2o1t\orig_movies\Stack_2.mat';
fileCLTAtif='E:\CME Superfolder\CME Data\Hydrogel\movies\80ph2o1t\orig_movies\Stack_2.tif';
filesave1='E:\CME Superfolder\CME Data\Hydrogel\movies\80ph2o1t\orig_movies\M1S2D.mat';
filesave2='E:\CME Superfolder\CME Data\Hydrogel\movies\80ph2o1t\orig_movies\M2S1D.mat';
load(fileDNRFXYC);
[SlaveINT,MasterINT]=GenerateMasterSlaveINTs(Threshfxyc,fileCLTAtif,400);
MSD=ConstructMasterSlaveDataCell(SlaveINT,Threshfxyc,400);
save(filesave1)
load(fileCLTAFXYC);
[SlaveINT,MasterINT]=GenerateMasterSlaveINTs(Threshfxyc,fileDNRtif,400);
MSD=ConstructMasterSlaveDataCell(SlaveINT,Threshfxyc,400);
save(filesave2)
1
fileDNRFXYC='E:\CME Superfolder\CME Data\Hydrogel\movies\80ph2o2t\orig_movies\Stack_1.mat';
fileDNRtif='E:\CME Superfolder\CME Data\Hydrogel\movies\80ph2o2t\orig_movies\Stack_1.tif';
fileCLTAFXYC='E:\CME Superfolder\CME Data\Hydrogel\movies\80ph2o2t\orig_movies\Stack_2.mat';
fileCLTAtif='E:\CME Superfolder\CME Data\Hydrogel\movies\80ph2o2t\orig_movies\Stack_2.tif';
filesave1='E:\CME Superfolder\CME Data\Hydrogel\movies\80ph2o2t\orig_movies\M1S2D.mat';
filesave2='E:\CME Superfolder\CME Data\Hydrogel\movies\80ph2o2t\orig_movies\M2S1D.mat';
load(fileDNRFXYC);
[SlaveINT,MasterINT]=GenerateMasterSlaveINTs(Threshfxyc,fileCLTAtif,400);
MSD=ConstructMasterSlaveDataCell(SlaveINT,Threshfxyc,400);
save(filesave1)
load(fileCLTAFXYC);
[SlaveINT,MasterINT]=GenerateMasterSlaveINTs(Threshfxyc,fileDNRtif,400);
MSD=ConstructMasterSlaveDataCell(SlaveINT,Threshfxyc,400);
save(filesave2)
2
fileDNRFXYC='E:\CME Superfolder\CME Data\Hydrogel\movies\80ph2o3t\orig_movies\Stack_1.mat';
fileDNRtif='E:\CME Superfolder\CME Data\Hydrogel\movies\80ph2o3t\orig_movies\Stack_1.tif';
fileCLTAFXYC='E:\CME Superfolder\CME Data\Hydrogel\movies\80ph2o3t\orig_movies\Stack_2.mat';
fileCLTAtif='E:\CME Superfolder\CME Data\Hydrogel\movies\80ph2o3t\orig_movies\Stack_2.tif';
filesave1='E:\CME Superfolder\CME Data\Hydrogel\movies\80ph2o3t\orig_movies\M1S2D.mat';
filesave2='E:\CME Superfolder\CME Data\Hydrogel\movies\80ph2o3t\orig_movies\M2S1D.mat';
load(fileDNRFXYC);
[SlaveINT,MasterINT]=GenerateMasterSlaveINTs(Threshfxyc,fileCLTAtif,400);
MSD=ConstructMasterSlaveDataCell(SlaveINT,Threshfxyc,400);
save(filesave1)
load(fileCLTAFXYC);
[SlaveINT,MasterINT]=GenerateMasterSlaveINTs(Threshfxyc,fileDNRtif,400);
MSD=ConstructMasterSlaveDataCell(SlaveINT,Threshfxyc,400);
save(filesave2)
3
fileDNRFXYC='E:\CME Superfolder\CME Data\Hydrogel\movies\80ph2o4t\orig_movies\Stack_1.mat';
fileDNRtif='E:\CME Superfolder\CME Data\Hydrogel\movies\80ph2o4t\orig_movies\Stack_1.tif';
fileCLTAFXYC='E:\CME Superfolder\CME Data\Hydrogel\movies\80ph2o4t\orig_movies\Stack_2.mat';
fileCLTAtif='E:\CME Superfolder\CME Data\Hydrogel\movies\80ph2o4t\orig_movies\Stack_2.tif';
filesave1='E:\CME Superfolder\CME Data\Hydrogel\movies\80ph2o4t\orig_movies\M1S2D.mat';
filesave2='E:\CME Superfolder\CME Data\Hydrogel\movies\80ph2o4t\orig_movies\M2S1D.mat';
load(fileDNRFXYC);
[SlaveINT,MasterINT]=GenerateMasterSlaveINTs(Threshfxyc,fileCLTAtif,400);
MSD=ConstructMasterSlaveDataCell(SlaveINT,Threshfxyc,400);
save(filesave1)
load(fileCLTAFXYC);
[SlaveINT,MasterINT]=GenerateMasterSlaveINTs(Threshfxyc,fileDNRtif,400);
MSD=ConstructMasterSlaveDataCell(SlaveINT,Threshfxyc,400);
save(filesave2)
4
fileDNRFXYC='E:\CME Superfolder\CME Data\Hydrogel\movies\control_dynamin_1x_1002\orig_movies\Stack_1.mat';
fileDNRtif='E:\CME Superfolder\CME Data\Hydrogel\movies\control_dynamin_1x_1002\orig_movies\Stack_1.tif';
fileCLTAFXYC='E:\CME Superfolder\CME Data\Hydrogel\movies\control_dynamin_1x_1002\orig_movies\Stack_2.mat';
fileCLTAtif='E:\CME Superfolder\CME Data\Hydrogel\movies\control_dynamin_1x_1002\orig_movies\Stack_2.tif';
filesave1='E:\CME Superfolder\CME Data\Hydrogel\movies\control_dynamin_1x_1002\orig_movies\M1S2D.mat';
filesave2='E:\CME Superfolder\CME Data\Hydrogel\movies\control_dynamin_1x_1002\orig_movies\M2S1D.mat';
load(fileDNRFXYC);
[SlaveINT,MasterINT]=GenerateMasterSlaveINTs(Threshfxyc,fileCLTAtif,400);
MSD=ConstructMasterSlaveDataCell(SlaveINT,Threshfxyc,400);
save(filesave1)
load(fileCLTAFXYC);
[SlaveINT,MasterINT]=GenerateMasterSlaveINTs(Threshfxyc,fileDNRtif,400);
MSD=ConstructMasterSlaveDataCell(SlaveINT,Threshfxyc,400);
save(filesave2)
5
fileDNRFXYC='E:\CME Superfolder\CME Data\Hydrogel\movies\control_dynamin_1x_1003\orig_movies\Stack_1.mat';
fileDNRtif='E:\CME Superfolder\CME Data\Hydrogel\movies\control_dynamin_1x_1003\orig_movies\Stack_1.tif';
fileCLTAFXYC='E:\CME Superfolder\CME Data\Hydrogel\movies\control_dynamin_1x_1003\orig_movies\Stack_2.mat';
fileCLTAtif='E:\CME Superfolder\CME Data\Hydrogel\movies\control_dynamin_1x_1003\orig_movies\Stack_2.tif';
filesave1='E:\CME Superfolder\CME Data\Hydrogel\movies\control_dynamin_1x_1003\orig_movies\M1S2D.mat';
filesave2='E:\CME Superfolder\CME Data\Hydrogel\movies\control_dynamin_1x_1003\orig_movies\M2S1D.mat';
load(fileDNRFXYC);
[SlaveINT,MasterINT]=GenerateMasterSlaveINTs(Threshfxyc,fileCLTAtif,400);
MSD=ConstructMasterSlaveDataCell(SlaveINT,Threshfxyc,400);
save(filesave1)
load(fileCLTAFXYC);
[SlaveINT,MasterINT]=GenerateMasterSlaveINTs(Threshfxyc,fileDNRtif,400);
MSD=ConstructMasterSlaveDataCell(SlaveINT,Threshfxyc,400);
save(filesave2)
6
fileDNRFXYC='E:\CME Superfolder\CME Data\Hydrogel\movies\control_2\orig_movies\Stack_1.mat';
fileDNRtif='E:\CME Superfolder\CME Data\Hydrogel\movies\control_2\orig_movies\Stack_1.tif';
fileCLTAFXYC='E:\CME Superfolder\CME Data\Hydrogel\movies\control_2\orig_movies\Stack_2.mat';
fileCLTAtif='E:\CME Superfolder\CME Data\Hydrogel\movies\control_2\orig_movies\Stack_2.tif';
filesave1='E:\CME Superfolder\CME Data\Hydrogel\movies\control_2\orig_movies\M1S2D.mat';
filesave2='E:\CME Superfolder\CME Data\Hydrogel\movies\control_2\orig_movies\M2S1D.mat';
load(fileDNRFXYC);
[SlaveINT,MasterINT]=GenerateMasterSlaveINTs(Threshfxyc,fileCLTAtif,400);
MSD=ConstructMasterSlaveDataCell(SlaveINT,Threshfxyc,400);
save(filesave1)
load(fileCLTAFXYC);
[SlaveINT,MasterINT]=GenerateMasterSlaveINTs(Threshfxyc,fileDNRtif,400);
MSD=ConstructMasterSlaveDataCell(SlaveINT,Threshfxyc,400);
save(filesave2)
