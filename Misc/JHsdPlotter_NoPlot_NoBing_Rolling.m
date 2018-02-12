FrameGap=3;

%FrameBins=10;

INT=CreateIntensityCell(Threshfxyc);
F=CreateFrameCell(Threshfxyc);
slopes = slope_finding(INT,FrameGap,400);
first=1;
last=max(max(Threshfxyc(:,1,:)));
JOSH=CombineSlopes(slopes);
JOSHF=CombineSlopes(F);

clear f sd

for i=1:last-FrameBins
    start=i;
    finish=i+FrameBins;
    f(i)=start;
    [JOSHs,sd(i)]=RestrictJOSHSlopesWsd(JOSH,JOSHF,start,finish);
end

% plot(f*FrameGap,sd)
% hold on
% yl=ylim;
% line([60*5 60*5],ylim,'Color','g');
% ylim(yl);
% xlabel('Time (s)')
% ylabel('JH standard deviation (AU)')
preUl=find(f*FrameGap>60);
preUu=find(f*FrameGap<240);
preU=intersect(preUl,preUu);
postUl=find(f*FrameGap>360);
postUu=find(f*FrameGap<600);
postU=intersect(postUl,postUu);
post=mean(sd(postU));
pre=mean(sd(preU));
OF=pre/post;