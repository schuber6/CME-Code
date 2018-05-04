function TwoColorCohorts_OnePlot(FXYCMS,FrameGap,R)



Before=1:120;
Dividers=[1 61];
NumCohorts=5;
%FrameGap=3;
CohortEdges=30:(90/NumCohorts):120;
CohortEdgesF=CohortEdges/FrameGap;
xbinsAC=-2:.25:4;
Nbins=20;

BM=cell(1,NumCohorts);
BS=cell(1,NumCohorts);
BAC=cell(1,NumCohorts);

[Mints,Sints]=SeparateTracesByCohort_FXYCMS(FXYCMS,CohortEdgesF,1,[3]);


for i=1:length(Mints)
    if R
    MMIs=StatCell(Mints{i},'median');
    t=(1:length(MMIs))*FrameGap;
    plot(t,MMIs,'r')
    hold on
    title('Average AP2 Traces')
    xlabel('Time (s)')
    else
    MSIs=StatCell(Sints{i},'median');
    t=(1:length(MSIs))*FrameGap;
    plot(t,MSIs,'g')
    hold on
    title('Average CALM Traces')
    xlabel('Time (s)')
    end
    L{i}=strcat(num2str(CohortEdges(i)),'-',num2str(CohortEdges(i+1)),'s Cohort: N=',num2str(length(Mints{i}{1})));
end

