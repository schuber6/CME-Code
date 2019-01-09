function [JF,JR]=CountJoshSlopes(fxyc)

N=5;
Nb=floor(N/2);
Na=ceil(N/2);
vect=(-Nb+1):Na;
JF=[];
JR=[];
num=length(fxyc(1,1,:));
for i=1:length(fxyc(1,1,:))
    waitbar(i/num)
    used=find(fxyc(:,1,i));
    for i2=Nb:length(used)-Na
        ints=fxyc(vect+i2,5,i);
        [slope, rsq]=LinearSlopeandR2(vect.',ints);
        JF=[JF slope];
        JR=[JR rsq];
    end
end