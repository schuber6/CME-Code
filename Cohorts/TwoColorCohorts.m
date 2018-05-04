function TwoColorCohorts(FXYCMS,FrameGap)



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

figure
for i=1:length(Mints)
    subplot(1,2,1)
    MMIs=StatCell(Mints{i},'median');
    t=(1:length(MMIs))*FrameGap;
    plot(t,MMIs)
    hold on
    title('Average AP2 Traces')
    xlabel('Time (s)')
    subplot(1,2,2)
    MSIs=StatCell(Sints{i},'median');
    plot(t,MSIs)
    hold on
    title('Average CALM Traces')
    xlabel('Time (s)')
    L{i}=strcat(num2str(CohortEdges(i)),'-',num2str(CohortEdges(i+1)),'s Cohort: N=',num2str(length(Mints{i}{1})));
end
subplot(1,2,1)
legend(L)
subplot(1,2,2)
legend(L)
