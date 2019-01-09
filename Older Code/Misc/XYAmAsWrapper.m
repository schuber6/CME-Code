clear all
fileSlave='E:\CME Superfolder\CME Data\170520_ZstackAnalysis\pre_z1_003_RFP_BS_10X.tif';
SlaveFrame=3;
fileFXYC='E:\CME Superfolder\CME Data\170520_ZstackAnalysis\movies\pre_z1_003_GFP_BS_10X\orig_movies\Stack_3.mat';
load(fileFXYC)

XYA=XYAfromRepeatFXYC(Threshfxyc);
XYAmAs{1}=FindSlaveINT_SingleFrame(XYA,fileSlave,SlaveFrame);
1
fileSlave='E:\CME Superfolder\CME Data\170520_ZstackAnalysis\pre_z2_003_RFP_BS_10X.tif';
SlaveFrame=3;
fileFXYC='E:\CME Superfolder\CME Data\170520_ZstackAnalysis\movies\pre_z2_003_GFP_BS_10X\orig_movies\Stack_3.mat';
load(fileFXYC)

XYA=XYAfromRepeatFXYC(Threshfxyc);
XYAmAs{2}=FindSlaveINT_SingleFrame(XYA,fileSlave,SlaveFrame);
2
fileSlave='E:\CME Superfolder\CME Data\170520_ZstackAnalysis\post_z1_003_RFP_BS_10X.tif';
SlaveFrame=3;
fileFXYC='E:\CME Superfolder\CME Data\170520_ZstackAnalysis\movies\post_z1_003_GFP_BS_10X\orig_movies\Stack_3.mat';
load(fileFXYC)

XYA=XYAfromRepeatFXYC(Threshfxyc);
XYAmAs{3}=FindSlaveINT_SingleFrame(XYA,fileSlave,SlaveFrame);
3
fileSlave='E:\CME Superfolder\CME Data\170520_ZstackAnalysis\post_z2_003_RFP_BS_10X.tif';
SlaveFrame=3;
fileFXYC='E:\CME Superfolder\CME Data\170520_ZstackAnalysis\movies\post_z2_003_GFP_BS_10X\orig_movies\Stack_3.mat';
load(fileFXYC)

XYA=XYAfromRepeatFXYC(Threshfxyc);
XYAmAs{4}=FindSlaveINT_SingleFrame(XYA,fileSlave,SlaveFrame);
4
fileSlave='E:\CME Superfolder\CME Data\170520_ZstackAnalysis\post_z3_003_RFP_BS_10X.tif';
SlaveFrame=3;
fileFXYC='E:\CME Superfolder\CME Data\170520_ZstackAnalysis\movies\post_z3_003_GFP_BS_10X\orig_movies\Stack_3.mat';
load(fileFXYC)

XYA=XYAfromRepeatFXYC(Threshfxyc);
XYAmAs{5}=FindSlaveINT_SingleFrame(XYA,fileSlave,SlaveFrame);
5
fileSlave='E:\CME Superfolder\CME Data\170520_ZstackAnalysis\post_z4_003_RFP_BS_10X.tif';
SlaveFrame=3;
fileFXYC='E:\CME Superfolder\CME Data\170520_ZstackAnalysis\movies\post_z4_003_GFP_BS_10X\orig_movies\Stack_3.mat';
load(fileFXYC)

XYA=XYAfromRepeatFXYC(Threshfxyc);
XYAmAs{6}=FindSlaveINT_SingleFrame(XYA,fileSlave,SlaveFrame);
6
fileSlave='E:\CME Superfolder\CME Data\170520_ZstackAnalysis\post_z5_003_RFP_BS_10X.tif';
SlaveFrame=3;
fileFXYC='E:\CME Superfolder\CME Data\170520_ZstackAnalysis\movies\post_z5_003_GFP_BS_10X\orig_movies\Stack_3.mat';
load(fileFXYC)

XYA=XYAfromRepeatFXYC(Threshfxyc);
XYAmAs{7}=FindSlaveINT_SingleFrame(XYA,fileSlave,SlaveFrame);
7
fileSlave='E:\CME Superfolder\CME Data\170520_ZstackAnalysis\post_z6_003_RFP_BS_10X.tif';
SlaveFrame=3;
fileFXYC='E:\CME Superfolder\CME Data\170520_ZstackAnalysis\movies\post_z6_003_GFP_BS_10X\orig_movies\Stack_3.mat';
load(fileFXYC)

XYA=XYAfromRepeatFXYC(Threshfxyc);
XYAmAs{8}=FindSlaveINT_SingleFrame(XYA,fileSlave,SlaveFrame);
8
fileSlave='E:\CME Superfolder\CME Data\170520_ZstackAnalysis\post_z7_003_RFP_BS_10X.tif';
SlaveFrame=3;
fileFXYC='E:\CME Superfolder\CME Data\170520_ZstackAnalysis\movies\post_z7_003_GFP_BS_10X\orig_movies\Stack_3.mat';
load(fileFXYC)

XYA=XYAfromRepeatFXYC(Threshfxyc);
XYAmAs{9}=FindSlaveINT_SingleFrame(XYA,fileSlave,SlaveFrame);




