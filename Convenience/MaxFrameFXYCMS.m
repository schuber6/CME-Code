function MF=MaxFrameFXYCMS(FXYCMS)
    
    MF=0;
    for i=1:length(FXYCMS)
        if max(FXYCMS{i}(:,1))>MF
            MF=max(FXYCMS{i}(:,1));
        end
    end