fileSlave='E:\CME Superfolder\CME Data\170520_ZstackAnalysis\pre_z1_003_RFP_BS_10X.tif';
fileMaster='E:\CME Superfolder\CME Data\170520_ZstackAnalysis\pre_z1_003_GFP_BS_10X.tif';
SlaveFrame=3;
fileFXYC='E:\CME Superfolder\CME Data\170520_ZstackAnalysis\movies\pre_z1_003_GFP_BS_10X\orig_movies\Stack_3.mat';
load(fileFXYC)

XYA=XYAfromRepeatFXYC(Threshfxyc);
XYAmAs=FindSlaveINT_SingleFrame(XYA,fileSlave,SlaveFrame);
XYAmAs_M=FindSlaveINT_SingleFrame(XYA,fileMaster,SlaveFrame);
XYAmAs_R=FindSlaveINT_SingleFrame_Randomized(XYA,fileSlave,SlaveFrame);
XYAmAs=[XYAmAs XYAmAs_M(:,4) XYAmAs_R(:,4)];