function [inds,Ms]=FindDimmestMasters(FXYCMS,Num)
    
    for i=1:length(FXYCMS)
        fxyc=FXYCMS{i};
        M(i)=max(fxyc(:,6));
    end
    sm=sort(M);
    for i=1:Num
        inds(i)=find(M==sm(i),1,'first');
        Ms(i)=sm(i);
    end