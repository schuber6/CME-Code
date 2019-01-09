function [MI,SI]=FindAllConclusionMaxIntensities_InRange(FXYCMS,Range)
    
    MI=[];
    SI=[];
    for i=1:length(FXYCMS)
        fxyc=FXYCMS{i};
        if ismember(fxyc(1,4),[2 3 6]) && length(fxyc(:,1))>=10  && min(ismember(fxyc(:,1),Range))==1
            MI=[MI ; max(fxyc(:,6))];
            SI=[SI ; max(fxyc(:,7))];
        end
    end