function [MasterMax,SlaveMax]=FindConclusionMaxIntensity(FXYCMS,ind)
    
    fxyc=FXYCMS{ind};
    FM=fxyc(:,6);
    FS=fxyc(:,7);
    MI=FM((end-9):end);
    SI=FS((end-9):end);
    MasterMax=max(MI);
    SlaveMax=max(SI);
    