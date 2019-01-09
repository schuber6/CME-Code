function z=CalculateZScoreOfRandomHalfs(LogRatio)
    
    L=length(LogRatio);
    First=randsample(L,ceil(L/2));
    Last=setdiff(1:L,First);
    
    MeanF=mean(LogRatio(First));
    VarF=var(LogRatio(First));
    NF=length(First);
    
    MeanL=mean(LogRatio(Last));
    VarL=var(LogRatio(Last));
    NL=length(Last);
    
    z=(MeanL-MeanF)/sqrt(VarF/NF+VarL/NL);
    