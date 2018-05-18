function [events,inds]=FrameEvents_FXYCMS(FXYCMS,frame,Isolated)
    
    events=[];
    inds=[];
    for i=1:length(FXYCMS)
        fxyc=FXYCMS{i};
        used=find(fxyc(:,1)==frame);
        if ~isempty(used)
            events=[events ; [frame fxyc(used(1),2) fxyc(used(1),3)]];
            inds=[inds i];
        end
    end
    if Isolated
        Dists=FindDistanceToNearestSpot(events(:,2),events(:,3));
        Iso=find(Dists>sqrt(50));
        events=events(Iso,:);
        inds=inds(Iso);
    end