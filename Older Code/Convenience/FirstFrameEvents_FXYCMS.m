function [events,varargout]=FirstFrameEvents_FXYCMS(FXYCMS,Isolated)
    
    events=[];
    inds=[];
    MI=[];
    SI=[];
    CrowdedEvents=[];
    CrowdedInds=[];
    CrowdedMI=[];
    CrowdedSI=[];
    for i=1:length(FXYCMS)
        fxyc=FXYCMS{i};
        used=find(fxyc(:,1)==1);
        if ~isempty(used)
            events=[events ; [1 fxyc(used(1),2) fxyc(used(1),3)]];
            inds=[inds i];
            MI=[MI fxyc(used(1),6)];
            SI=[SI fxyc(used(1),7)];
        end
    end
    if Isolated
        Dists=FindDistanceToNearestSpot(events(:,2),events(:,3));
        
        Crowd=find(Dists<sqrt(50));
        CrowdedEvents=events(Crowd,:);
        CrowdedInds=inds(Crowd);
        CrowdedMI=MI(Crowd);
        CrowdedSI=SI(Crowd);
        
        Iso=find(Dists>sqrt(50));
        events=events(Iso,:);
        inds=inds(Iso);
        MI=MI(Iso);
        SI=SI(Iso);

    end
    
    varargout{1}=inds;
    varargout{2}=MI;
    varargout{3}=SI;
    varargout{4}=CrowdedEvents;
    varargout{5}=CrowdedInds;
    varargout{6}=CrowdedMI;
    varargout{7}=CrowdedSI;