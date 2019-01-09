function HistACInts_MultiStacks(files)
    

    FSFig()
    for i=1:5
        load(files{i})
        NSTA=NSTAms;
        usedC=SelectReasonableZGaussFits(NSTA);
        used=MakeVectorOfGood(usedC);
        Samp(i)=length(used);
        subplot(3,6,i)
        hist([NSTA(used).ZGaussA],25)
        MenCA(i)=mean([NSTA(used).ZGaussA]);
        MedCA(i)=median([NSTA(used).ZGaussA]);
        title(strcat('Mean=',num2str(MenCA(i)),'Median=',num2str(MedCA(i))))
        xlabel('CALM Intensities')
        xlim([0 25000])
        subplot(3,6,i+6)
        hist([NSTA(used).SZGaussA],25)
        MenCL(i)=mean([NSTA(used).SZGaussA]);
        MedCL(i)=median([NSTA(used).SZGaussA]);
        title(strcat('Mean=',num2str(MenCL(i)),'Median=',num2str(MedCL(i))))
        xlabel('CLCa Intensities')
        xlim([0 15000])
        subplot(3,6,i+12)
        hist(log([NSTA(used).ZGaussA]./[NSTA(used).SZGaussA]),25)
        MenAC(i)=mean(log([NSTA(used).ZGaussA]./[NSTA(used).SZGaussA]));
        MedAC(i)=median(log([NSTA(used).ZGaussA]./[NSTA(used).SZGaussA]));
        title(strcat('Mean=',num2str(MenAC(i)),'Median=',num2str(MedAC(i))))
        xlabel('Log A:C Ratios')
        xlim([-.5 1.5])
    end
    subplot(3,6,6)
    plot(MenCA,'g')
    hold on
    plot(MedCA,'r')
    subplot(3,6,12)
    plot(MenCL,'g')
    hold on
    plot(MedCL,'r')
    subplot(3,6,18)
    plot(MenAC,'g')
    hold on
    plot(MedAC,'r')
    subplot(3,6,17)
    plot(Samp,'b')
    title(files{1})
