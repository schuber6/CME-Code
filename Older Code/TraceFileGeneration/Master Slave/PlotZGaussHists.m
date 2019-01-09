function PlotZGaussHists(NSTAms)
    
    usedM=find([NSTAms.ZGaussA]>0 & [NSTAms.ZGaussA]<10^8 & [NSTAms.ZGaussX0]>1 & [NSTAms.ZGaussX0]<5 & [NSTAms.ZGaussSD]>=.5 & [NSTAms.ZGaussSD]<3);
    usedS=find([NSTAms.SZGaussA]>0 & [NSTAms.SZGaussA]<10^8 & [NSTAms.SZGaussX0]>1 & [NSTAms.SZGaussX0]<5 & [NSTAms.SZGaussSD]>=.5 & [NSTAms.SZGaussSD]<3);
    used=intersect(usedM,usedS);
    length(used)
    FSFig()
    NSTAms=NSTAms(used);
    subplot(2,3,1)
    hist([NSTAms.ZGaussA],25)
    title('Master Int')
    subplot(2,3,4)
    hist([NSTAms.SZGaussA],25)
    title('Slave Int')
    subplot(2,3,2)
    hist([NSTAms.ZGaussX0],25)
    title('Master Z')
    subplot(2,3,5)
    hist([NSTAms.SZGaussX0],25)
    title('Slave Z')
    subplot(2,3,3)
    hist([NSTAms.ZGaussSD],25)
    title('Master Z SD')
    subplot(2,3,6)
    hist([NSTAms.SZGaussSD],25)
    title('Slave Z SD')