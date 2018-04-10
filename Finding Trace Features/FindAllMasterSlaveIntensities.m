function [MI,SI]=FindAllMasterSlaveIntensities(FXYCMS)
    
    MI=[];
    SI=[];
    for i=1:length(FXYCMS)
        fxyc=FXYCMS{i};
        MI=[MI ; fxyc(:,6)];
        SI=[SI ; fxyc(:,7)];
    end