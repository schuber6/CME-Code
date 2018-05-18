function [Hsi xbins]=PlotLifetimeHistogram(FXYCMS,LTbins)
    
    MinLT=min(LTbins);
    [~,LTs,~,~]=SelectSmallOnes(FXYCMS,MinLT,1:100);
    [Hsi,xbins]=hist(LTs,LTbins);
    Hsi=Hsi(1:end-1);
    xbins=xbins(1:end-1);

    plot(xbins*3,Hsi/sum(Hsi),'r')