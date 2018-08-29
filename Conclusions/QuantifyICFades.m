function [FadeI,FadeC]=QuantifyICFades(I)

    
    I=I/max(I); %Normalize units (doesn't affect zscores)

    
    pre=FindPlateau(I,6);
    post=find(I,2,'last');

    Npr=length(pre);
    Npo=length(post);
    MeMpr=mean(I(pre));
    VarMpr=var(I(pre));
    MeMpo=mean(I(post));
    VarMpo=var(I(post));
    MZ=(MeMpo-MeMpr)/sqrt(VarMpr/Npr+VarMpo/Npo); %Calculate master z-score
    FadeC=MZ;
    
    %pre=FindPlateau(I,6);
    post=find(I,2,'first');

    Npr=length(pre);
    Npo=length(post);
    MeMpr=mean(I(pre));
    VarMpr=var(I(pre));
    MeMpo=mean(I(post));
    VarMpo=var(I(post));
    MZ=(MeMpo-MeMpr)/sqrt(VarMpr/Npr+VarMpo/Npo); %Calculate master z-score
    FadeI=MZ;


    
    