function [Mints,Sints]=SeparateTracesByCohort_FXYCMS(FXYCMS,CohortEdgesF,Scottify)
    
    for i=1:length(CohortEdgesF)-1
        Mints{i}=cell(1,CohortEdgesF(i+1));
        Sints{i}=cell(1,CohortEdgesF(i+1));
    end
    for i=1:length(FXYCMS)
        fxyc=FXYCMS{i};
        LT=length(fxyc(:,1));
        Group=find(CohortEdgesF<LT,1,'last');
        if ~isempty(Group) && Group<length(CohortEdgesF)
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