function [MI,SI]=FindAllMasterSlaveIntensities_InRange(FXYCMS,Range,thresh)
    
    MI=[];
    SI=[];
    for i=1:length(FXYCMS)
        fxyc=FXYCMS{i};
        used=find(ismember(fxyc(:,1),Range) & fxyc(:,6)>=thresh & fxyc(:,7)>=thresh);
        MI=[MI ; fxyc(used,6)];
        SI=[SI ; fxyc(used,7)];
    end
    MI=MI.';
    SI=SI.';