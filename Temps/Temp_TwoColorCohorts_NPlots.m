function varargout=Temp_TwoColorCohorts_NPlots(FXYCMS,FrameGap,R,type,normalize,varargin)




%NumCohorts=14;
%FrameGap=3;
%CohortEdges=10:(140/NumCohorts):150;
%CohortEdges=[10 20 30 40 50 60 70 80 90];
%CohortEdges=[30 50 70 90];
CohortEdges=[10 24 80 150 300];
CohortEdgesF=CohortEdges/FrameGap;
if nargin==5
    SlopeConcs=0;
else
    SlopeConcs=varargin{1};
end
if SlopeConcs
    [~,~,FXYCMS_Sel]=CountConclusions_BySlope(FXYCMS,3000,5,FrameGap,Inf,1);
else
    FXYCMS_Sel=FXYCMS;
end
[Mints,Sints,~,~,MaxM,MaxS]=SeparateTracesByCohort_FXYCMS(FXYCMS_Sel,CohortEdgesF,1,[3],0,100);
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
    subplot(1,length(CohortEdges)-1,i)
    if R
        MMIs=StatCell(Mints{i},'median');
        if normalize
            MMIs=(MMIs-Min)/(Max-Min);
        end
        t=(1:length(MMIs))*FrameGap;
        plot(t,MMIs,strcat('r',type))
        hold on
        %title('Average AP2 Traces')
        xlabel('Time (s)')
        varargout{1}=Mints;
        varargout{2}=MaxM;
    else
        MSIs=StatCell(Sints{i},'median');
        if normalize
            MSIs=(MSIs-Min)/(Max-Min);
        end
        t=(1:length(MSIs))*FrameGap;
        plot(t,MSIs,strcat('g',type))
        hold on
        %title('Average CALM Traces')
        xlabel('Time (s)')
        varargout{1}=Sints;
        varargout{2}=MaxS;
    end
    L{i}=strcat(num2str(CohortEdges(i)),'-',num2str(CohortEdges(i+1)),'s Cohort');
    title(L{i})
end


