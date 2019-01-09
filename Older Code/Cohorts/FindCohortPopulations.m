function Nt=FindCohortPopulations(FXYCMS,CohortEdges)   


    NumCohorts=5;
    FrameGap=3;
    %CohortEdges=30:(90/NumCohorts):120;
%     CohortEdges=[21 45 90 135];
    CohortEdgesF=CohortEdges/FrameGap;
    [Mints,Sints,Nt]=SeparateTracesByCohort_FXYCMS(FXYCMS,CohortEdgesF,1,[3],0,100);
    F2=SelectLargeOnes(FXYCMS,200);
    Nt=[Nt length(F2)];

