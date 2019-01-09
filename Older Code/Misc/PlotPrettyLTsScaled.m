close all
path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_004_BS_Cell2_NoRed';
load(strcat(path,'.mat'))
LifetimeVFrameWrapperScaled;
time1=time; life1=life; pre1=pre;
path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_008_BS_pCell2_NoRed';
load(strcat(path,'.mat'))
LifetimeVFrameWrapperScaled;
time2=time; life2=life; pre2=pre;
path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_010_BS_Cell3_NoRed';
load(strcat(path,'.mat'))
LifetimeVFrameWrapperScaled;
time3=time; life3=life; pre3=pre;
path='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies\fol1_013_BS_pCell3_NoRed';
load(strcat(path,'.mat'))
LifetimeVFrameWrapperScaled;
used=find(time>=60);
plot(time(used),life(used)/pre,'Color',[0 1 1])

hold on
used=find(time3>=60);
plot(time3(used),life3(used)/pre3,'Color',[1 0 1])
used=find(time2>=60);
plot(time2(used),life2(used)/pre2,'Color',[1 0 0])
used=find(time1>=60);
plot(time1(used),life1(used)/pre1,'Color',[0 0 1])

legend('80% Water','60% Water','40% Water','20% Water')
xlabel('Time (s)')
ylabel('Average Lifetime Relative to Pre-Osmoshock')
%line([60*5 60*5],ylim,'Color','g');
xlim([0 600])
ylim([0 3])
YL=ylim;
plot([60*1 60*1],YL,'--','Color','k');
plot([60*4 60*4],YL,'--','Color','k');
plot([60*6 60*6],YL,'Color','k');
plot([60*9 60*9],YL,'Color','k');

