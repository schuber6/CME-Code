function MSr=MedianMSratios(FXYCMS)
    
    for i=1:length(FXYCMS)
        fxyc=FXYCMS{i};
        MSr(i)=median(fxyc(:,6))/median(fxyc(:,7));
    end