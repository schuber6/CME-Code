path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_013_BS_Cell2_NoRed';
load(strcat(path,'.mat'))
LifetimeVFrameWrapperScaled;
used=find(time>=60);
plot(time(used),life(used),'Color',[0 0 1])
hold on
%legend('80% Water','60% Water','40% Water','20% Water')
xlabel('Time (s)')
ylabel('Average Lifetime (s)')
%line([60*5 60*5],ylim,'Color','g');
xlim([0 600])
ylim([0 300])
YL=ylim;
plot([60*1 60*1],YL,'--','Color','k');
plot([60*4 60*4],YL,'--','Color','k');
plot([60*6 60*6],YL,'Color','k');
plot([60*9 60*9],YL,'Color','k');

figure
FrameBins=10;
JHsdPlotter_NoPlot_NoBing_Rolling;
plot(f*FrameGap,sd,'Color',[0 0 1])
hold on
xlim([0 600])
ylim([0 .045])
YL=ylim;
YL=ylim;
plot([60*1 60*1],YL,'--','Color','k');
plot([60*4 60*4],YL,'--','Color','k');
plot([60*6 60*6],YL,'Color','k');
plot([60*9 60*9],YL,'Color','k');
xlabel('Time (s)')
ylabel('Standard Deviation of the Growth Rates')

figure
Color=[0 0 1];
PlotBAJoshHistograms_NoUnit(path,Color)

figure
PlotBALTHistogram(path,Color)