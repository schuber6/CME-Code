function [slopes,rsqs,LTs]=FindACSlopeOfTraces(FXYCMS,Traces)
    
    for i=1:length(Traces)
        fxyc=FXYCMS{Traces(i)};
        used=find(fxyc(:,6)>0 & fxyc(:,7)>0);
        MI=fxyc(used,6);
        SI=fxyc(used,7);
        [slopes(i), rsqs(i)]=LinearSlopeandR2_0Intercept(SI.',MI.');
        LTs(i)=length(MI);
    end