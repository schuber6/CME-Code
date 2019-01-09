function [Inds,LTs,MMs,MSs]=FindAll3s_InRange(FXYCMS,Range,MinL,thresh)
    
    Inds=[];
    LTs=[];
    MMs=[];
    MSs=[];
    for i=1:length(FXYCMS)
        fxyc=FXYCMS{i};
        if fxyc(1,4)==3 && length(fxyc(:,1))>=MinL && max(fxyc(:,6))>=thresh && max(fxyc(:,7))>=thresh && min(ismember(fxyc(:,1),Range))==1
            Inds=[Inds i];
            LTs=[LTs length(fxyc(:,1))];
            MMs=[MMs max(fxyc(:,6))];
            MSs=[MSs max(fxyc(:,7))];
        end
    end