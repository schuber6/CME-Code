function PlotACVsZ_MultiStacks(files,newplot,color,title1)
    
    if newplot
        FSFig()
    end
    for i=1:5
        load(files{i})
        NSTA=NSTAms;
        usedC=SelectReasonableZGaussFits(NSTA);
        used=MakeVectorOfGood(usedC);
%         Samp(i)=length(used);
% 
%         MenCA(i)=mean([NSTA(used).ZGaussA]);
%         MedCA(i)=median([NSTA(used).ZGaussA]);
% 
%         MenCL(i)=mean([NSTA(used).SZGaussA]);
%         MedCL(i)=median([NSTA(used).SZGaussA]);
% 
%         MenAC(i)=mean(log([NSTA(used).ZGaussA]./[NSTA(used).SZGaussA]));
%         MedAC(i)=median(log([NSTA(used).ZGaussA]./[NSTA(used).SZGaussA]));
        subplot(2,3,i)
        hexscatter([NSTA(used).ZGaussX0].',log([NSTA(used).ZGaussA]./[NSTA(used).SZGaussA]).')
    end

