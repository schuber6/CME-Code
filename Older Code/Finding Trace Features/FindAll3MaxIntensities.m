function [MI,SI]=FindAll3MaxIntensities(FXYCMS)
    
    MI=[];
    SI=[];
    for i=1:length(FXYCMS)
        fxyc=FXYCMS{i};
        if fxyc(1,4)==3
            MI=[MI ; max(fxyc(:,6))];
            SI=[SI ; max(fxyc(:,7))];
        end
    end