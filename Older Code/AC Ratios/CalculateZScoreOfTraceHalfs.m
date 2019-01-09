function z=CalculateZScoreOfTraceHalfs(LogRatio)
    
    L=length(LogRatio);
    First=1:ceil(L/2);
    Last=ceil(L/2):L;
    
    MeanF=mean(LogRatio(First));
    VarF=var(LogRatio(First));
    NF=length(First);
    
    MeanL=mean(LogRatio(Last));
    VarL=var(LogRatio(Last));
    NL=length(Last);
    
    z=(MeanL-MeanF)/sqrt(VarF/NF+VarL/NL);
    