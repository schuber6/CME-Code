first=1;
last=max(max(Threshfxyc(:,1,:)));
FrameGap=3;

[Init,Conc]=ICvsFrame(Threshfxyc);
A=ConvexHullAreas356(Threshfxyc);

SmoothingFrames=5;
clear InitS ConcS
for i=1:length(Init)-SmoothingFrames
    TabI=zeros(1,SmoothingFrames);
    TabC=zeros(1,SmoothingFrames);
    for i2=1:SmoothingFrames
    TabI(i2)=Init(i+i2-1);
    TabC(i2)=Conc(i+i2-1);
    end
    InitS(i)=mean(TabI);
    ConcS(i)=mean(TabC);
end
for i=length(Init)-SmoothingFrames+1:length(Init)
    TabI=zeros(1,SmoothingFrames);
    TabC=zeros(1,SmoothingFrames);
    for i2=1:SmoothingFrames
    TabI(i2)=Init(i-i2+1);
    TabC(i2)=Conc(i-i2+1);
    end
    InitS(i)=mean(TabI);
    ConcS(i)=mean(TabC);
end

clear time
for i=1:last
    time(i)=FrameGap*i-FrameGap;
end
% plot(time,InitS./A,'b')
% hold on
% plot(time,ConcS./A,'r')
% xlabel('Time (s)')
% ylabel('Initiation/Conclusion Density (#/pixel)')
% line([60*5 60*5],ylim,'Color','g');
%save 170221_Control_004.mat
startB=OsmoT/FrameGap/5;
finishB=startB*4;

startA=startB*6;
finishA=startB*9;

preUl=find(time>startB);
preUu=find(time<finishB);
preU=intersect(preUl,preUu);
postUl=find(time>startA);
postUu=find(time<finishA);
postU=intersect(postUl,postUu);
PostInitD=mean(Init(postU)./A(postU));
PreInitD=mean(Init(preU)./A(preU));

PostConcD=mean(Conc(postU)./A(postU));
PreConcD=mean(Conc(preU)./A(preU));
PreArea=mean(A(preU));
PostArea=mean(A(postU));