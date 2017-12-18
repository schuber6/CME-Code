function LI=HistLastInts(fxyc)

LI=[];
for i=1:length(fxyc(1,1,:))
    used=find(fxyc(:,1,i));
    LI=[LI fxyc(used(end),5,i)];
end
hist(LI,500)