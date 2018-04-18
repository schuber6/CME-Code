function PlotSlopeHistogram(FXYCMS)
    
    [Mslopes,Sslopes]=FindAllSlopes_InRange(FXYCMS,1:120,2500);
    figure
    subplot(1,2,1)
    hist(Mslopes,100)
    subplot(1,2,2)
    hist(Sslopes,100)