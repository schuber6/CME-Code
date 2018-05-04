function MSr=MSratiosAtMax(FXYCMS)
    
    for i=1:length(FXYCMS)
        fxyc=FXYCMS{i};
        MSr(i)=max(fxyc(:,6))/max(fxyc(:,7));
    end