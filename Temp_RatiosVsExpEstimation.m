for i=2:length(MSratiosMed)
    clear t e PB
    for i2=1:length(MSratiosMed{i})
        t(i2)=(i2-2)*3-1;
        e(i2)=(i2-1)*.15*7;
        PB(i2)=exp(-e(i2)/120)/exp(-e(i2)/60);
    end
    F=MSratiosMed{i}(1);
    figure
    errorbar(t,MSratiosMed{i}/F,MSratiosSE{i}/F)
    hold on
    plot(t,PB,'--g')
    legend('Data','Photobleaching Only Estimation')
    xlabel('Time From Osmoshock (minutes)')
    ylabel('CALM/CLCa Intensity Ratio')
end