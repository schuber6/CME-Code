function events=FirstFrameEvents_FXYCMS(FXYCMS,Isolated)
    
    events=[];
    for i=1:length(FXYCMS)
        fxyc=FXYCMS{i};
        used=find(fxyc(:,1)==1);
        if ~isempty(used)
            events=[events ; [1 fxyc(used(1),2) fxyc(used(1),3)]];
        end
    end
    if Isolated
        Dists=FindDistanceToNearestSpot(events(:,2),events(:,3));
        Iso=find(Dists>sqrt(50));
        events=events(Iso,:);
    end