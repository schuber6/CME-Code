function [Int,AvInt,AllInt]=MaxIntVFrame(TraceINT,FrameGap,first,last)

[a,b]=size(TraceINT);
count=zeros(1,b);
sum=zeros(1,b);
AllInt=zeros(1,a);
Int=zeros(1,b);
for i=1:a
    frames=find(TraceINT(i,:));
    slife=max(TraceINT(i,:));
    if length(frames)>0 && frames(1)>first
        for j=1:length(frames)
            count(frames(j))=count(frames(j))+1;
            sum(frames(j))=sum(frames(j))+slife;
        end
    end
    AllInt(i)=slife;
end
for i=1:b
    if sum(i)~=0
        Int(i)=sum(i)/count(i);
    else
        Int(i)=0;
    end
end
AvInt=mean(AllInt);