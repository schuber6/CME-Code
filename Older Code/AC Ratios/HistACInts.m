function HistACInts(NSTA)
    
    usedC=SelectReasonableZGaussFits(NSTA);
    used=MakeVectorOfGood(usedC);
    figure
    subplot(1,3,1)
    hist([NSTA(used).ZGaussA],25)
    Men=mean([NSTA(used).ZGaussA]);
    Med=median([NSTA(used).ZGaussA]);
    title(strcat('CALM Intensities  ','Mean=',num2str(Men),'Median=',num2str(Med)))
    subplot(1,3,2)
    hist([NSTA(used).SZGaussA],25)
    Men=mean([NSTA(used).SZGaussA]);
    Med=median([NSTA(used).SZGaussA]);
    title(strcat('CLCa Intensities  ','Mean=',num2str(Men),'Median=',num2str(Med)))

    subplot(1,3,3)
    hist(log([NSTA(used).ZGaussA]./[NSTA(used).SZGaussA]),25)
    Men=mean(log([NSTA(used).ZGaussA]./[NSTA(used).SZGaussA]));
    Med=median(log([NSTA(used).ZGaussA]./[NSTA(used).SZGaussA]));
    title(strcat('Log A:C Ratios  ','Mean=',num2str(Men),'Median=',num2str(Med)))
