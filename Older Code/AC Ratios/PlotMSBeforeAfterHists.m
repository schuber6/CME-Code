function PlotMSBeforeAfterHists(MIb,MIa,SIb,SIa,titleM,titleS)
    
    [Hmb,xbinsM]=hist(MIb,ceil(length(MIb)/20));
    Hma=hist(MIa,xbinsM);
    [Hsb,xbinsS]=hist(SIb,ceil(length(SIb)/20));
    Hsa=hist(SIa,xbinsS);
    subplot(1,2,1)
    plot(xbinsM,Hmb/sum(Hmb),'g')
    hold on
    plot(xbinsM,Hma/sum(Hma),'r')
    title(titleM)
    legend(strcat('Before, N=',num2str(length(MIb))),strcat('After, N=',num2str(length(MIa))))
    subplot(1,2,2)
    plot(xbinsS,Hsb/sum(Hsb),'g')
    hold on
    plot(xbinsS,Hsa/sum(Hsa),'r')
    title(titleS)
    legend(strcat('Before, N=',num2str(length(SIb))),strcat('After, N=',num2str(length(SIa))))
    