function PlotConclusionIntensity(MI,SI)
    
    figure
subplot(1,2,1)
x=(1:length(MI))*5;
plot(x,MI,'g')
hold on
plot(x,SI,'r')
YL=ylim;
line([300 300],YL)
legend('CALM','Clathrin','Time of Osmoshock')
xlabel('Time (seconds)')
ylabel('Median Intensity of Conclusions')
subplot(1,2,2)
plot(x,MI./SI,'g')
hold on
YL=ylim;
line([300 300],YL)
ylabel('A:C Ratio')