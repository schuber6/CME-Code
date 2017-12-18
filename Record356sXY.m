function [TraceX,TraceY]=Record356sXY(Threshfxyc)

used3=find(Threshfxyc(1,4,:)==3);
used5=find(Threshfxyc(1,4,:)==5);
used6=find(Threshfxyc(1,4,:)==6);
used3=union(used3,union(used5,used6));
for i=1:length(used3)
    usedf=find(Threshfxyc(:,1,used3(i)));
    for i2=1:length(usedf)
        frame=Threshfxyc(usedf(i2),1,used3(i));
        TraceX(i,frame)=Threshfxyc(usedf(i2),2,used3(i));
        TraceY(i,frame)=Threshfxyc(usedf(i2),3,used3(i));
    end
end