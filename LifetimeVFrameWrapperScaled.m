first=1;
last=max(max(Threshfxyc(:,1,:)));
FrameGap=3;
TraceINT=Record3s(Threshfxyc);
[life]=LifetimeVFrame(TraceINT,FrameGap,first,last);
clear time
for i=1:last
    time(i)=FrameGap*i-FrameGap;
end

preUl=find(time>60);
preUu=find(time<240);
preU=intersect(preUl,preUu);
postUl=find(time>360);
postUu=find(time<600);
postU=intersect(postUl,postUu);
post=mean(life(postU));
pre=mean(life(preU));
LF=pre/post;


% plot(time,life/pre)
% xlabel('Time (s)')
% ylabel('Average Lifetime (s)')
% line([60*5 60*5],ylim,'Color','g');
%save 170221_Control_004.mat

