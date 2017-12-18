first=1;
last=max(max(Threshfxyc(:,1,:)));
FrameGap=3;
TraceINT=Record3s(Threshfxyc);
%[life]=LifetimeVFrame(TraceINT,FrameGap,first,last);
[Int,AvInt,AllInt]=MaxIntVFrame(TraceINT,FrameGap,first,last);
clear time
for i=1:last
    time(i)=FrameGap*i-FrameGap;
end
plot(time,Int)
xlabel('Time (s)')
ylabel('Average Max Intensity (AU)')
line([60*5 60*5],ylim,'Color','g');
%save 170221_Control_004.mat

preUl=find(time>60);
preUu=find(time<240);
preU=intersect(preUl,preUu);
postUl=find(time>360);
postUu=find(time<600);
postU=intersect(postUl,postUu);
PostMaxInt=mean(Int(postU));
PreMaxInt=mean(Int(preU));
MaxIntF=PreMaxInt/PostMaxInt;