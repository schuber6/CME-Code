function [SCell,Maxs]=ScottifyTraces(IntCell,Traces,NBins,varargin)
    
    if nargin==3
        Norm='none';
    else
        Norm=varargin{1};
    end
    SCell=cell(1,NBins);
    NBinsV=1:NBins;
    for i=1:length(Traces)
        if strcmp(Norm,'none')
            trace=IntCell{Traces(i)};
        end
        if strcmp(Norm,'mean')
            trace=IntCell{Traces(i)}/mean(IntCell{Traces(i)});
        end
        if strcmp(Norm,'max')
            trace=IntCell{Traces(i)}/max(IntCell{Traces(i)});
        end
        Maxs(i)=max(trace);
        xq=(NBinsV-1)/(NBins-1)*(length(trace)-1)+1;
        vq=interp1(trace,xq);
        for i2=1:length(vq)
            SCell{i2}=[SCell{i2} vq(i2)];
        end
        
    end