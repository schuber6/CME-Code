function [MasterMax,SlaveMax,LT]=FindConclusionMaxIntensity(FXYCMS,ind,MinL)
    
    fxyc=FXYCMS{ind};
    FM=fxyc(:,6);
    FS=fxyc(:,7);
    MI=FM((end-MinL+1):end);
    SI=FS((end-MinL+1):end);
    MasterMax=max(MI);
    SlaveMax=max(SI);
    if fxyc(1,4)==3
        LT=length(fxyc(:,1));
    else
        LT=0;
    end
    