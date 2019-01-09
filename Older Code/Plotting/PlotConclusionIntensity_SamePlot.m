function PlotConclusionIntensity_SamePlot(MI,SI,LineSpec)
    

subplot(1,2,1)
x=(1:length(MI))*5;
plot(x,MI,strcat('g',LineSpec))
hold on
plot(x,SI,strcat('r',LineSpec))
YL=ylim;
line([300 300],YL)
legend('CALM','Clathrin','Time of Osmoshock')
xlabel('Time (seconds)')
ylabel('Median Intensity of Conclusions')
subplot(1,2,2)
plot(x,MI./SI,strcat('g',LineSpec))
hold on
YL=ylim;
line([300 300],YL)
ylabel('A:C Ratio')