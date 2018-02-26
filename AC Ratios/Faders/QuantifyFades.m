function Fade=QuantifyFades(Fs,SI,MI,OsmoF,stat)
    %Assigns a number to mid-osmo traces quantifying how much more clathrin
    %fades than the adaptor
    
    SI=SI/max(SI); %Normalize units (doesn't affect zscores)
    MI=MI/max(MI);
    
    pre=find(Fs<=OsmoF,6,'last');
    post=find(Fs>OsmoF+9,6,'first');
    if length(pre)<5 || length(post)<5
        Fade=0;
        return
    end
    MeSpr=mean(SI(pre));
    VarSpr=var(SI(pre));
    Npr=length(pre);
    MeSpo=mean(SI(post));
    VarSpo=var(SI(post));
    Npo=length(post);
    
    
    MeMpr=mean(MI(pre));
    VarMpr=var(MI(pre));
    MeMpo=mean(MI(post));
    VarMpo=var(MI(post));
    
    if stat=='zscore'
        SZ=(MeSpo-MeSpr)/sqrt(VarSpr/Npr+VarSpo/Npo); %Calculate slave z-score
        MZ=(MeMpo-MeMpr)/sqrt(VarMpr/Npr+VarMpo/Npo); %Calculate master z-score
        Fade=MZ-SZ;
    end
    if stat=='meanch'
        SZ=MeSpo-MeSpr;
        MZ=MeMpo-MeMpr;
        Fade=MZ-SZ;
    end
    if stat=='ACzsco'
        ACpr=log(MI(pre)./SI(pre));
        ACpo=log(MI(post)./SI(post));
        Mepr=mean(ACpr);
        Mepo=mean(ACpo);
        Varpr=var(ACpr);
        Varpo=var(ACpo);
        Fade=(Mepo-Mepr)/sqrt(Varpr/Npr+Varpo/Npo);
    end
    
    
    