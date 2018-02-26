function Decision=DetermineIfFades(Fs,SI,MI,OsmoF)
    
    pre=find(Fs<=OsmoF,6,'last');
    post=find(Fs>OsmoF+9,6,'first');
    if length(pre)<5 || length(post)<5
        Decision=0;
        return
    end
    MeSpr=mean(SI(pre));
    SDSpr=sqrt(var(SI(pre)));
    MeSpo=mean(SI(post));
    SDSpo=sqrt(var(SI(post)));
    
    MeMpr=mean(MI(pre));
    SDMpr=sqrt(var(MI(pre)));
    MeMpo=mean(MI(post));
    SDMpo=sqrt(var(MI(post)));
    
    if MeSpr-SDSpr>MeSpo+SDSpo && MeMpr-MeSpr<=MeMpo+SDMpo
        Decision=1;
    else
        Decision=0;
    end
    