function [slopes,rsqs,LTs]=FindACSlopeOfTraces(FXYCMS,Traces,CNormalize)
    %Finds A:C slopes of traces with indices in "Traces"
    %If CNormalize=1--max clathrin of each trace is normalized to 1 (to get
    %unbiased correlation between A:C slope and max C)
    
    
    for i=1:length(Traces)
        fxyc=FXYCMS{Traces(i)};
        used=find(fxyc(:,6)>0 & fxyc(:,7)>0);
        MI=fxyc(used,6);
        if ~CNormalize
            SI=fxyc(used,7);
        else
            SI=fxyc(used,7)/max(fxyc(used,7));
        end
        [slopes(i), rsqs(i)]=LinearSlopeandR2_0Intercept(SI.',MI.');
        LTs(i)=length(MI);
    end