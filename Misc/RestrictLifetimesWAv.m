function [LTs,Av]=RestrictLifetimesWAv(fxyc,start,finish,FrameGap)
%Gives only the lifetimes of traces that are 3s and exist between start and
%finish frames

LTs=[];
used3=find(fxyc(1,4,:)==3);
for i=1:length(used3)
    usedWin=find(fxyc(:,1,used3(i))>=start & fxyc(:,1,used3(i))<=finish);
    if ~isempty(usedWin)
        LT=length(find(fxyc(:,1,used3(i))))*FrameGap;
        LTs=[LTs LT];
        
    end
end
if ~isempty(LTs)
Av=mean(LTs);
else
    Av=0;
end