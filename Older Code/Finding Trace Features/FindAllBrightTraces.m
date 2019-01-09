function [Traces,MIO,SIO]=FindAllBrightTraces(FXYCMS)

    Traces=[];
    MIO=[];
    SIO=[];
    for i=1:length(FXYCMS)
        
        if max(FXYCMS{i}(:,6))>5000 && max(FXYCMS{i}(:,7))>5000
            fxyc=FXYCMS{i};
            Traces=[Traces i];
            MIO=[MIO max(fxyc(:,6))];
            SIO=[SIO max(fxyc(:,7))];
        end
    end