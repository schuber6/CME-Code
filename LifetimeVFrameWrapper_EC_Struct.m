[C,L,T]=TranslateFXYCS(fxycS);

ltf=PlotAverageLifetime_NoPlot(C,L,T,1,0);
%close all
first=1;
last=max(max(Threshfxyc(:,1,:)));
FrameGap=3;
clear time
for i=1:last
    time(i)=FrameGap*i-FrameGap;
end
plot(time,ltf*3)
ylim([0 max(ltf*3)*1.1])
xlabel('Time (s)')
ylabel('Average Lifetime (s)')
line([60*5 60*5],ylim,'Color','g');