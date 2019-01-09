function DZ=QuantifyAdaptorDelay(SI,MI)
    
    SI=SI/max(SI); %Normalize units (doesn't affect zscores)
    MI=MI/max(MI);
    
    pre=find(MI,4,'first');
    MaxI=find(MI==max(MI));
    maxs=MaxI(1)-2:MaxI(1)+1;
    if min(maxs)<1 || max(maxs)>length(MI)
        DZ=0;
        return
    end
    ACpr=log(MI(pre)./SI(pre));
    ACpo=log(MI(maxs)./SI(maxs));
    Mepr=mean(ACpr);
    Mepo=mean(ACpo);
    Varpr=var(ACpr);
    Varpo=var(ACpo);
    Npr=length(pre);
    Npo=length(maxs);
    DZ=(Mepo-Mepr)/sqrt(Varpr/Npr+Varpo/Npo);