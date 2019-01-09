function PlotTwoColorCohorts_Overlayed(FXYCMS,MaxFrame,MasterName,SlaveName,FrameGap)

NumCohorts=4;
%FrameGap=3;
CohortEdges=30:(60/NumCohorts):90;
CohortEdgesF=CohortEdges/FrameGap;
[Mints,Sints,~,Inds]=SeparateTracesByCohort_FXYCMS(FXYCMS,CohortEdgesF,1,[3],0,MaxFrame);

figure
for i=1:length(Mints)
    subplot(2,2,i)
    MMIs=StatCell(Mints{i},'median');
    MMIs=MMIs-min(MMIs);
    t=(1:length(MMIs))*FrameGap;
    plot(t,MMIs/max(MMIs),'g')
    hold on

    xlabel('Time (s)')
    ylabel('Intensity')
    MSIs=StatCell(Sints{i},'median');
    MSIs=MSIs-min(MSIs);
    plot(t,MSIs/max(MSIs),'r')
    hold on
    

    L{i}=strcat(num2str(CohortEdges(i)),'-',num2str(CohortEdges(i+1)),'s Cohort: N=',num2str(length(Mints{i}{1})));
    title(L{i})
    legend(MasterName,SlaveName)
end