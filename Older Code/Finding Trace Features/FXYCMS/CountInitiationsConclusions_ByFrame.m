function [Ni,Nc]=CountInitiationsConclusions_ByFrame(FXYCMS,MaxFrame,Tmast,Tslave)
    
    MF=MaxFrameFXYCMS(FXYCMS);
    Ni=zeros(1,MF);
    Nc=zeros(1,MF);
    for i=1:length(FXYCMS)
        fxyc=FXYCMS{i};
        C=fxyc(1,4);
        MM=max(fxyc(:,6));
        MS=max(fxyc(:,7));
        FF=fxyc(1,1);
        LF=fxyc(end,1);
        if ismember(fxyc(1,4),[1 3 5]) && MM>Tmast && MS>Tslave && FF<=max(MaxFrame)
            Ni(FF)=Ni(FF)+1;
        end
        if ismember(fxyc(1,4),[2 3 6]) && MM>Tmast && MS>Tslave && LF<=max(MaxFrame)
            Nc(LF)=Nc(LF)+1;
        end
    end