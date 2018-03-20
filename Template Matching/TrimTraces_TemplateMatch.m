function ManINew=TrimTraces_TemplateMatch(ManI)
    
    SCell=MakeCohortAverageTraceCell(ManI);
    
    Temp_TestSubTraceFinding;
    
    Bad=find(Dist100V>=18 | Dist100V==0);
    NumBad=length(Bad);
    Kept=find(Dist100V<18 & Dist100V>0);
    NumKept=length(Kept);
    Full=find(ML(Kept)-TL(Kept)<=TL(Kept)*.3);
    NumFull=length(Full);
    Partial=find(ML(Kept)-TL(Kept)>TL(Kept)*.3);
    NumPartial=length(Partial);
    
    count=1;
    for i=1:NumKept
        I=Kept(i);
        wind=start(I):finish(I);
        ManINew{i}=ManI{I}(wind);
        count=count+1;
    end