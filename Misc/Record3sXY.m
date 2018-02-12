function [TraceX,TraceY]=Record3sXY(Threshfxyc)

used3=find(Threshfxyc(1,4,:)==3);
for i=1:length(used3)
    usedf=find(Threshfxyc(:,1,used3(i)));
    for i2=1:length(usedf)
        frame=Threshfxyc(usedf(i2),1,used3(i));
        TraceX(i,frame)=Threshfxyc(usedf(i2),2,used3(i));
        TraceY(i,frame)=Threshfxyc(usedf(i2),3,used3(i));
    end
end