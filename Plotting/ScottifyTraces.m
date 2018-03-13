function [SCell,Maxs]=ScottifyTraces(IntCell,Traces,NBins)
    
    SCell=cell(1,NBins);
    NBinsV=1:NBins;
    for i=1:length(Traces)
        trace=IntCell{Traces(i)};
        Maxs(i)=max(trace);
        xq=(NBinsV-1)/(NBins-1)*(length(trace)-1)+1;
        vq=interp1(trace,xq);
        for i2=1:length(vq)
            SCell{i2}=[SCell{i2} vq(i2)];
        end
        
    end