path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_004_BS_Cell2_NoRed';
load(path)
ICWrapper;
xlim([0 600])
ylim([0 .001])
title('20% Water (Blue: Initiations, Red: Conclusions)')
figure

path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_008_BS_pCell2_NoRed';
load(path)
ICWrapper;
xlim([0 600])
ylim([0 .001])
title('40% Water (Blue: Initiations, Red: Conclusions)')
figure
path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_010_BS_Cell1_Red';
load(path)
ICWrapper;
xlim([0 600])
ylim([0 .001])
title('60% Water (Blue: Initiations, Red: Conclusions)')
figure
path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_013_BS_pCell3_NoRed';
load(path)
ICWrapper;
xlim([0 600])
ylim([0 .001])
title('80% Water (Blue: Initiations, Red: Conclusions)')

figure

path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_013_BS_Cell2_NoRed';
load(path)
ICWrapper;
xlim([0 600])
ylim([0 .001])
title('80% Water (From single movie plots) (Blue: Initiations, Red: Conclusions)')