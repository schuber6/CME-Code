function [inds,Ms,Mm]=FindDimmestSlaves(FXYCMS,Num)
    
    for i=1:length(FXYCMS)
        fxyc=FXYCMS{i};
        M(i)=max(fxyc(:,7));
        t(i)=find(fxyc(:,7)==M(i),1,'last');
        Mmast(i)=fxyc(t(i),6);
    end
    sm=sort(M);
    for i=1:Num
        inds(i)=find(M==sm(i),1,'first');
        Ms(i)=sm(i);
        Mm(i)=Mmast(inds(i));
    end