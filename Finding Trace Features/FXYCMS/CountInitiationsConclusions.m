function [Ni,Nc]=CountInitiationsConclusions(FXYCMS,MaxFrame,Tmast,Tslave)
    
    Ni=0;
    Nc=0;
    for i=1:length(FXYCMS)
        fxyc=FXYCMS{i};
        C=fxyc(1,4);
        MM=max(fxyc(:,6));
        MS=max(fxyc(:,7));
        FF=fxyc(1,1);
        LF=fxyc(end,1);
        if ismember(fxyc(1,4),[1 3 5]) && MM>Tmast && MS>Tslave && FF<=max(MaxFrame)
            Ni=Ni+1;
        end
        if ismember(fxyc(1,4),[2 3 6]) && MM>Tmast && MS>Tslave && LF<=max(MaxFrame)
            Nc=Nc+1;
        end
    end