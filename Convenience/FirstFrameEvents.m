function events=FirstFrameEvents(FXYCMS)
    
    events=[];
    for i=1:length(FXYCMS)
        fxyc=FXYCMS{i};
        if fxyc(1,1)==1
            events=[events ; [fxyc(1,1:3)]];
        end
    end