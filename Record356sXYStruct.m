function [TraceX,TraceY]=Record356sXYStruct(fxycS)

% used3=find(Threshfxyc(1,4,:)==3);
% used5=find(Threshfxyc(1,4,:)==5);
% used6=find(Threshfxyc(1,4,:)==6);
% used3=union(used3,union(used5,used6));
used3=[];
for i=1:length(fxycS)
    if fxycS(i).class==3 || fxycS(i).class==5 || fxycS(i).class==6
        used3=[used3 i];
    end
end
for i=1:length(used3)
    usedf=find(fxycS(used3(i)).frame);
    for i2=1:length(usedf)
        frame=fxycS(used3(i)).frame(usedf(i2));
        TraceX(i,frame)=fxycS(used3(i)).xpos(usedf(i2));
        TraceY(i,frame)=fxycS(used3(i)).ypos(usedf(i2));
    end
end