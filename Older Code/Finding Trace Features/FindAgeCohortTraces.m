function Traces=FindAgeCohortTraces(FXYCMS,CohortEdges,Frame)
    
    Traces=cell(1,length(CohortEdges));
    for i=1:length(FXYCMS)
        fxyc=FXYCMS{i};
        if ismember(Frame,fxyc(:,1)) && max(fxyc(:,6))>5000 && max(fxyc(:,7))>5000
            Age=Frame-min(fxyc(:,1));
            Group=find(CohortEdges<Age,1,'Last');
            if ~isempty(Group)
                Traces{Group}=[Traces{Group} i];
            end
        end
    end