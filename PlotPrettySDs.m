path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_004_BS_Cell2_NoRed';
load(strcat(path,'.mat'))
JHsdPlotter;
hold on
path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_008_BS_pCell2_NoRed';
load(strcat(path,'.mat'))
JHsdPlotter;
hold on
path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_010_BS_Cell1_Red';
load(strcat(path,'.mat'))
JHsdPlotter;
hold on
path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_013_BS_pCell3_NoRed';
load(strcat(path,'.mat'))
JHsdPlotter;
 xlim([0 600])
% ylim([0 400])
line([60*1 60*1],ylim,'Color','b');
line([60*4 60*4],ylim,'Color','b');
line([60*6 60*6],ylim,'Color','r');
line([60*9 60*9],ylim,'Color','r');