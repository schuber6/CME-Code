function [SD,M]=LifetimeStatistics(fxyc,fg)

good=find(fxyc(1,4,:)==3);
List=zeros(1,length(good));
for i=1:length(good)
    frames=find(fxyc(:,1,good(i)));
    List(i)=length(frames)*fg;
end
M=mean(List);
SD=sqrt(var(List));