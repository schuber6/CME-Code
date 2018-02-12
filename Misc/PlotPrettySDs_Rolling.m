FrameBins=10;
path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_004_BS_Cell2_NoRed';
load(strcat(path,'.mat'))
JHsdPlotter_NoPlot_NoBing_Rolling;
sd1=sd;
f1=f;
pre1=pre;
path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_008_BS_pCell2_NoRed';
load(strcat(path,'.mat'))
JHsdPlotter_NoPlot_NoBing_Rolling;
sd2=sd;
f2=f;
pre2=pre;
path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_010_BS_Cell1_Red';
load(strcat(path,'.mat'))
JHsdPlotter_NoPlot_NoBing_Rolling;
sd3=sd;
f3=f;
pre3=pre;
path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_013_BS_pCell3_NoRed';
load(strcat(path,'.mat'))
JHsdPlotter_NoPlot_NoBing_Rolling;
sd4=sd;
f4=f;
pre4=pre;
plot(f4*FrameGap,sd4/pre4,'Color',[0 1 1])

hold on
plot(f3*FrameGap,sd3/pre3,'Color',[1 0 1])
plot(f2*FrameGap,sd2/pre2,'Color',[1 0 0])

plot(f1*FrameGap,sd1/pre1,'Color',[0 0 1])

legend('80% Water','60% Water','40% Water','20% Water')
xlabel('Time (s)')
ylabel('Standard Deviation of the Growth Rates Relative to Pre-Osmoshock')

xlim([0 600])
ylim([0 1.4])
YL=ylim;
YL=ylim;
plot([60*1 60*1],YL,'--','Color','k');
plot([60*4 60*4],YL,'--','Color','k');
plot([60*6 60*6],YL,'Color','k');
plot([60*9 60*9],YL,'Color','k');
