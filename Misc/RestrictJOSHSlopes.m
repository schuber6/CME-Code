function JOSHs=RestrictJOSHSlopes(JOSH,JOSHF,start,finish)
%Gives only the JOSH slopes between start and finish (inclusive)

higher=find(JOSHF>=start);
lower=find(JOSHF<=finish);
good=intersect(higher,lower);
JOSHs=zeros(1,length(good));
for i=1:length(good)
    JOSHs(i)=JOSH(good(i));
end
