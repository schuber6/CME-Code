function varargout=Temp_TwoColorCohorts_First_10s(FXYCMS,FrameGap,R,type,normalize)




%NumCohorts=14;
%FrameGap=3;
%CohortEdges=10:(140/NumCohorts):150;
CohortEdges=[10 20 30 40 50 60 70 80 90];
%CohortEdges=[30 50 70 90];
CohortEdgesF=CohortEdges/FrameGap;
[Mints,Sints,~,~,MaxM,MaxS,Max10sM,Max10sS]=SeparateTracesByCohort_FXYCMS(FXYCMS,CohortEdgesF,1,[3],0,100);
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
        varargout{3}=Max10sM;
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
        varargout{3}=Max10sS;
    end
    L{i}=strcat(num2str(CohortEdges(i)),'-',num2str(CohortEdges(i+1)),'s Cohort');
    title(L{i})
end


