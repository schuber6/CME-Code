    [Traces,MIO,SIO]=FindAllMidOsmoTraces(FXYCMS,60);
    FSFig
    scatter(MIO,SIO,[],[0 1 0])
    hold on
    AddLinearRegLine_Color_0Intercept(MIO,SIO,[0 1 0])
    xlabel('Adaptor Intensity')
    ylabel('Clathrin Intensity')
    [MI,SI]=ReturnAllMSIntsAtFrame(FXYCMS,Traces,66);
    scatter(MI,SI,[],[1 0 0])
    AddLinearRegLine_Color_0Intercept(MI,SI,[1 0 0])
        [MI,SI]=ReturnAllMSIntsAtFrame(FXYCMS,Traces,72);
    scatter(MI,SI,[],[0 0 1])
    AddLinearRegLine_Color_0Intercept(MI,SI,[0 0 1])
    legend('Time of Osmo','Best Fit With 0 Intercept','30 s After Osmo','Best Fit With 0 Intercept','60 s After Osmo','Best Fit With 0 Intercept')
%     [MI,SI]=ReturnAllMSIntsAtFrame(FXYCMS,Traces,60);
%     scatter(MI,SI,[],[1 0 0])