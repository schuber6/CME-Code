function Fade=QuantifyConclusionFades(I)
    %Assigns a number to mid-osmo traces quantifying how much more clathrin
    %fades than the adaptor
    %'ACzsco' seems to perform the best
    
    I=I/max(I); %Normalize units (doesn't affect zscores)

    
    pre=find(I,6,'first');
    post=find(I,2,'last');


    Npr=length(pre);

    Npo=length(post);
    
    
    MeMpr=mean(I(pre));
    VarMpr=var(I(pre));
    MeMpo=mean(I(post));
    VarMpo=var(I(post));
    

        MZ=(MeMpo-MeMpr)/sqrt(VarMpr/Npr+VarMpo/Npo); %Calculate master z-score
        Fade=MZ;


    
    