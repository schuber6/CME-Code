function SDist=ScottifyDist(trace,NBins)
    
    NBinsV=1:NBins*100;
    xq=(NBinsV-1)/(NBins*100-1)*(length(trace)-1)+1;
    vq=interp1(trace,xq);
    for i=1:NBins
        SDist(i)=mean(vq((i-1)*100+1:i*100));
    end
        
