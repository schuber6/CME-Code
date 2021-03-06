function MsqE_Traces=CalculateMsqE_ByTrace(FXYCMS,movie,sd,r)
    
    MF=MaxFrameFXYCMS(FXYCMS);
    MsqE_Traces=cell(1,length(FXYCMS));
    h=waitbar(0,'Measuring Gaussianitude');
    for i=1:MF
        waitbar(i/MF)
        [events,inds]=FrameEvents_FXYCMS(FXYCMS,i,1);
        MsqE=CalculateFramePSFmeansquarederror(movie,events,i,sd,r);
        for i2=1:length(inds)
            MsqE_Traces{inds(i2)}=[MsqE_Traces{inds(i2)} MsqE(i2)];
        end
    end
    close(h)
        