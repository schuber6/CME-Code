function [NormM,NormS]=MedianOfTraceMaxima(NSTAms)
    
    usedC=SelectReasonableZGaussFits(NSTAms);
MMs=[];
MSs=[];
for i=1:length(NSTAms)
    if length(usedC{i})>=floor(30/1.2)
        MM=max(NSTAms(i).ZGaussA(usedC{i}));
        MS=max(NSTAms(i).SZGaussA(usedC{i}));
        MMs=[MMs MM];
        MSs=[MSs MS];
    end
end
NormM=median(MMs);
NormS=median(MSs);