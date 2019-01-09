function PlotTraceParts(Trace)
    
    Plat=.9;
    MI=max(Trace);
    Iend=find(Trace>MI*Plat,1,'first');
    Cbeg=find(Trace>MI*Plat,1,'last');
    t=(1:length(Trace))*100/length(Trace);
    plot(t,Trace)
    hold on
    YL=ylim;
    line([t(Iend) t(Iend)],YL,'Color','g')
    line([t(Cbeg) t(Cbeg)],YL,'Color','r')