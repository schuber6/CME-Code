function DualHistogram(Dr,Dg,Nbins)
    
    [Hr,xbins1]=hist(Dr,Nbins);
    [Hg,xbins2]=hist(Dg,Nbins);
    plot(xbins1,Hr/sum(Hr)/(xbins1(2)-xbins1(1)),'r')
    hold on
    plot(xbins2,Hg/sum(Hg)/(xbins2(2)-xbins2(1)),'g')
