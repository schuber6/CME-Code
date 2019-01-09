function [Mints,Sints,varargout]=SeparateTracesByCohort_FXYCMS(FXYCMS,CohortEdgesF,Scottify,Categories,OverCohort,MaxFrame)
    
    if OverCohort
        MF=MaxFrameFXYCMS(FXYCMS);
        CohortEdgesF=[CohortEdgesF MF];
    end
    for i=1:length(CohortEdgesF)-1
        Mints{i}=cell(1,CohortEdgesF(i+1));
        Sints{i}=cell(1,CohortEdgesF(i+1));
        MaxM{i}=[];
        MaxS{i}=[];
        Max10sM{i}=[];
        Max10sS{i}=[];
        Inds{i}=[];
    end
    for i=1:length(FXYCMS)
        fxyc=FXYCMS{i};
        LT=length(fxyc(:,1));
        Group=find(CohortEdgesF<LT,1,'last');
        if ~isempty(Group) && Group<length(CohortEdgesF) && ismember(fxyc(1,4),Categories) && max(fxyc(:,1))<=MaxFrame
            Inds{Group}=[Inds{Group} i];
            MaxM{Group}=[MaxM{Group} max(fxyc(:,6))];
            MaxS{Group}=[MaxS{Group} max(fxyc(:,7))];
            if length(fxyc(:,6))>=10
                Max10sM{Group}=[Max10sM{Group} max(fxyc(1:10,6))];
                Max10sS{Group}=[Max10sS{Group} max(fxyc(1:10,7))];
            else
                Max10sM{Group}=[Max10sM{Group} max(fxyc(1:end,6))];
                Max10sS{Group}=[Max10sS{Group} max(fxyc(1:end,7))];
            end
            if ~Scottify
                for i2=1:LT
                    Mints{Group}{i2}=[Mints{Group}{i2} fxyc(i2,6)];
                    Sints{Group}{i2}=[Sints{Group}{i2} fxyc(i2,7)];
                end
            else
                traceM=fxyc(:,6);
                traceS=fxyc(:,7);
                NBins=CohortEdgesF(Group+1);
                NBinsV=1:NBins;
                xq=(NBinsV-1)/(NBins-1)*(length(traceM)-1)+1;
                vqM=interp1(traceM,xq);
                vqS=interp1(traceS,xq);
                for i2=1:length(xq)
                    Mints{Group}{i2}=[Mints{Group}{i2} vqM(i2)];
                    Sints{Group}{i2}=[Sints{Group}{i2} vqS(i2)];
                    
                end
            end
        end
    end
    for i=1:length(CohortEdgesF)-1
        N(i)=length(Mints{i}{1});
    end
    varargout{1}=N;
    varargout{2}=Inds;
    varargout{3}=MaxM;
    varargout{4}=MaxS;
    varargout{5}=Max10sM;
    varargout{6}=Max10sS;