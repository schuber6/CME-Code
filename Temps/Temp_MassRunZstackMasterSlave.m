% clear XYAmAs_Z
% for i=1:7
%     fileSlave='E:\CME Superfolder\CME Data\170520_ZstackAnalysis\pre_z1_003_RFP_BS_10X.tif';
%     fileSave='E:\CME Superfolder\CME Data\170520_ZstackAnalysis\pre_z1_003_RFP_BS_10X_prez1.mat';
%     SlaveFrame=i;
%     fileFXYC=strcat('E:\CME Superfolder\CME Data\170520_ZstackAnalysis\movies\pre_z1_003_GFP_BS_10X\orig_movies\Stack_',num2str(i),'.mat');
%     load(fileFXYC)
%     XYA=XYAfromRepeatFXYC(Threshfxyc);
%     XYAmAs_Z{i}=FindSlaveINT_SingleFrame(XYA,fileSlave,SlaveFrame);
%     save(fileSave,'XYAmAs_Z')
% end
% 1
clear XYAmAs_Z
for i=1:7
    fileSlave='E:\CME Superfolder\CME Data\170520_ZstackAnalysis\pre_z2_003_RFP_BS_10X.tif';
    fileSave='E:\CME Superfolder\CME Data\170520_ZstackAnalysis\pre_z2_003_RFP_BS_10X_prez1.mat';
    SlaveFrame=i;
    fileFXYC=strcat('E:\CME Superfolder\CME Data\170520_ZstackAnalysis\movies\pre_z2_003_GFP_BS_10X\orig_movies\Stack_',num2str(i),'.mat');
    load(fileFXYC)
    XYA=XYAfromRepeatFXYC(Threshfxyc);
    XYAmAs_Z{i}=FindSlaveINT_SingleFrame(XYA,fileSlave,SlaveFrame);
    save(fileSave,'XYAmAs_Z')
end
2
clear XYAmAs_Z
for i=1:7
    fileSlave='E:\CME Superfolder\CME Data\170520_ZstackAnalysis\post_z1_003_RFP_BS_10X.tif';
    fileSave='E:\CME Superfolder\CME Data\170520_ZstackAnalysis\post_z1_003_RFP_BS_10X_prez1.mat';
    SlaveFrame=i;
    fileFXYC=strcat('E:\CME Superfolder\CME Data\170520_ZstackAnalysis\movies\post_z1_003_GFP_BS_10X\orig_movies\Stack_',num2str(i),'.mat');
    load(fileFXYC)
    XYA=XYAfromRepeatFXYC(Threshfxyc);
    XYAmAs_Z{i}=FindSlaveINT_SingleFrame(XYA,fileSlave,SlaveFrame);
    save(fileSave,'XYAmAs_Z')
end
3
clear XYAmAs_Z
for i=1:7
    fileSlave='E:\CME Superfolder\CME Data\170520_ZstackAnalysis\post_z2_003_RFP_BS_10X.tif';
    fileSave='E:\CME Superfolder\CME Data\170520_ZstackAnalysis\post_z2_003_RFP_BS_10X_prez1.mat';
    SlaveFrame=i;
    fileFXYC=strcat('E:\CME Superfolder\CME Data\170520_ZstackAnalysis\movies\post_z2_003_GFP_BS_10X\orig_movies\Stack_',num2str(i),'.mat');
    load(fileFXYC)
    XYA=XYAfromRepeatFXYC(Threshfxyc);
    XYAmAs_Z{i}=FindSlaveINT_SingleFrame(XYA,fileSlave,SlaveFrame);
    save(fileSave,'XYAmAs_Z')
end
4
clear XYAmAs_Z
for i=1:7
    fileSlave='E:\CME Superfolder\CME Data\170520_ZstackAnalysis\post_z3_003_RFP_BS_10X.tif';
    fileSave='E:\CME Superfolder\CME Data\170520_ZstackAnalysis\post_z3_003_RFP_BS_10X_prez1.mat';
    SlaveFrame=i;
    fileFXYC=strcat('E:\CME Superfolder\CME Data\170520_ZstackAnalysis\movies\post_z3_003_GFP_BS_10X\orig_movies\Stack_',num2str(i),'.mat');
    load(fileFXYC)
    XYA=XYAfromRepeatFXYC(Threshfxyc);
    XYAmAs_Z{i}=FindSlaveINT_SingleFrame(XYA,fileSlave,SlaveFrame);
    save(fileSave,'XYAmAs_Z')
end
5
clear XYAmAs_Z
for i=1:7
    fileSlave='E:\CME Superfolder\CME Data\170520_ZstackAnalysis\post_z4_003_RFP_BS_10X.tif';
    fileSave='E:\CME Superfolder\CME Data\170520_ZstackAnalysis\post_z4_003_RFP_BS_10X_prez1.mat';
    SlaveFrame=i;
    fileFXYC=strcat('E:\CME Superfolder\CME Data\170520_ZstackAnalysis\movies\post_z4_003_GFP_BS_10X\orig_movies\Stack_',num2str(i),'.mat');
    load(fileFXYC)
    XYA=XYAfromRepeatFXYC(Threshfxyc);
    XYAmAs_Z{i}=FindSlaveINT_SingleFrame(XYA,fileSlave,SlaveFrame);
    save(fileSave,'XYAmAs_Z')
end
6
clear XYAmAs_Z
for i=1:7
    fileSlave='E:\CME Superfolder\CME Data\170520_ZstackAnalysis\post_z5_003_RFP_BS_10X.tif';
    fileSave='E:\CME Superfolder\CME Data\170520_ZstackAnalysis\post_z5_003_RFP_BS_10X_prez1.mat';
    SlaveFrame=i;
    fileFXYC=strcat('E:\CME Superfolder\CME Data\170520_ZstackAnalysis\movies\post_z5_003_GFP_BS_10X\orig_movies\Stack_',num2str(i),'.mat');
    load(fileFXYC)
    XYA=XYAfromRepeatFXYC(Threshfxyc);
    XYAmAs_Z{i}=FindSlaveINT_SingleFrame(XYA,fileSlave,SlaveFrame);
    save(fileSave,'XYAmAs_Z')
end
7
clear XYAmAs_Z
for i=1:7
    fileSlave='E:\CME Superfolder\CME Data\170520_ZstackAnalysis\post_z6_003_RFP_BS_10X.tif';
    fileSave='E:\CME Superfolder\CME Data\170520_ZstackAnalysis\post_z6_003_RFP_BS_10X_prez1.mat';
    SlaveFrame=i;
    fileFXYC=strcat('E:\CME Superfolder\CME Data\170520_ZstackAnalysis\movies\post_z6_003_GFP_BS_10X\orig_movies\Stack_',num2str(i),'.mat');
    load(fileFXYC)
    XYA=XYAfromRepeatFXYC(Threshfxyc);
    XYAmAs_Z{i}=FindSlaveINT_SingleFrame(XYA,fileSlave,SlaveFrame);
    save(fileSave,'XYAmAs_Z')
end
8
clear XYAmAs_Z
for i=1:7
    fileSlave='E:\CME Superfolder\CME Data\170520_ZstackAnalysis\post_z7_003_RFP_BS_10X.tif';
    fileSave='E:\CME Superfolder\CME Data\170520_ZstackAnalysis\post_z7_003_RFP_BS_10X_prez1.mat';
    SlaveFrame=i;
    fileFXYC=strcat('E:\CME Superfolder\CME Data\170520_ZstackAnalysis\movies\post_z7_003_GFP_BS_10X\orig_movies\Stack_',num2str(i),'.mat');
    load(fileFXYC)
    XYA=XYAfromRepeatFXYC(Threshfxyc);
    XYAmAs_Z{i}=FindSlaveINT_SingleFrame(XYA,fileSlave,SlaveFrame);
    save(fileSave,'XYAmAs_Z')
end


