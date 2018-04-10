function STrace=ScottifyTrace(trace,NBins)
    
    SCell=cell(1,NBins);
    NBinsV=1:NBins;
    xq=(NBinsV-1)/(NBins-1)*(length(trace)-1)+1;
    vq=interp1(trace,xq);
    STrace=vq;
        