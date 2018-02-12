function PlotACInts_MultiStacks(files,newplot,color,title1)
    
    if newplot
        FSFig()
    end
    for i=1:5
        load(files{i})
        NSTA=NSTAms;
        usedC=SelectReasonableZGaussFits(NSTA);
        used=MakeVectorOfGood(usedC);
        Samp(i)=length(used);

        MenCA(i)=mean([NSTA(used).ZGaussA]);
        MedCA(i)=median([NSTA(used).ZGaussA]);

        MenCL(i)=mean([NSTA(used).SZGaussA]);
        MedCL(i)=median([NSTA(used).SZGaussA]);

        MenAC(i)=mean(log([NSTA(used).ZGaussA]./[NSTA(used).SZGaussA]));
        MedAC(i)=median(log([NSTA(used).ZGaussA]./[NSTA(used).SZGaussA]));

    end
    subplot(2,2,1)
    %plot(MenCA,'g')
    %hold on
    plot(MedCA/MedCA(1),'Color',color)
    hold on
    %legend('Mean','Median')
    title(title1)
    subplot(2,2,2)
    %plot(MenCL,'g')
    %hold on
    plot(MedCL/MedCL(1),'Color',color)
    hold on
    title('Clathrin Intensity')
    subplot(2,2,3)
    %plot(MenAC,'g')
    %hold on
    title('Log A:C Ratio')
    plot(MedAC-MedAC(1),'Color',color)
    hold on
    subplot(2,2,4)
    plot(Samp/Samp(1),'Color',color)
    hold on
    title('Number of Spots')
