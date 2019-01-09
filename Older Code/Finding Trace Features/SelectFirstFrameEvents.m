function [MI,SI,fxy]=SelectFirstFrameEvents(FXYCMS,MinInt)

fxy=[];
MI=[];
SI=[];
for i=1:length(FXYCMS)
    fxyc=FXYCMS{i};
    used=find(fxyc(:,1)==1);
    if ~isempty(used) && fxyc(used(1),6)>=MinInt && fxyc(used(1),7)>=MinInt
        fxy=[fxy ; [fxyc(used(1),1:3)]];
        MI=[MI fxyc(used(1),6)];
        SI=[SI fxyc(used(1),7)];
    end
end
            
            
            
            