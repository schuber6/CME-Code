plot(time,life/pre,'Color',[0 1 1])

hold on
plot(time3,life3/pre3,'Color',[1 0 1])
plot(time2,life2/pre2,'Color',[1 0 0])

plot(time1,life1/pre1,'Color',[0 0 1])
hold off
legend('80% Water','60% Water','40% Water','20% Water')
xlabel('Time (s)')
ylabel('Average Lifetime Relative to Pre-Osmoshock')
line([60*5 60*5],ylim,'Color','g');
xlim([0 600])
%ylim([0 400])
line([60*1 60*1],ylim,'Color','b');
line([60*4 60*4],ylim,'Color','b');
line([60*6 60*6],ylim,'Color','r');
line([60*9 60*9],ylim,'Color','r');