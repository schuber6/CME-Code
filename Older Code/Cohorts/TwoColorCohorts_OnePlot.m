function TwoColorCohorts_OnePlot(FXYCMS,FrameGap,R,type,normalize)




NumCohorts=5;
%FrameGap=3;
CohortEdges=30:(90/NumCohorts):120;
CohortEdgesF=CohortEdges/FrameGap;
[Mints,Sints]=SeparateTracesByCohort_FXYCMS(FXYCMS,CohortEdgesF,1,[3],0,100);
MMIs=[];
MSIs=[];
for i=1:length(Mints)
    if R
        MMIs=[MMIs StatCell(Mints{i},'median')];
        Max=max(MMIs);
        Min=min(MMIs);
        
    else
        MSIs=[MSIs StatCell(Sints{i},'median')];
        Max=max(MSIs);
        Min=min(MSIs);
    end
end
for i=1:length(Mints)
    if R
        MMIs=StatCell(Mints{i},'median');
        if normalize
            MMIs=(MMIs-Min)/(Max-Min);
        end
        t=(1:length(MMIs))*FrameGap;
        plot(t,MMIs,strcat('r',type))
        hold on
        title('Average AP2 Traces')
        xlabel('Time (s)')
    else
        MSIs=StatCell(Sints{i},'median');
        if normalize
            MSIs=(MSIs-Min)/(Max-Min);
        end
        t=(1:length(MSIs))*FrameGap;
        plot(t,MSIs,strcat('g',type))
        hold on
        title('Average CALM Traces')
        xlabel('Time (s)')
    end
    L{i}=strcat(num2str(CohortEdges(i)),'-',num2str(CohortEdges(i+1)),'s Cohort: N=',num2str(length(Mints{i}{1})));
end

