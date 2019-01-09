function [JFbef,JRbef,JFaft,JRaft]=CountJoshSlopes_Split(fxyc,befs,befe,afts,afte)

N=5;
Nb=floor(N/2);
Na=ceil(N/2);
vect=(-Nb+1):Na;
JFbef=[];
JRbef=[];
JFaft=[];
JRaft=[];
num=length(fxyc(1,1,:));
for i=1:length(fxyc(1,1,:))
    waitbar(i/num)
    used=find(fxyc(:,1,i));
    frames=fxyc(used,1,i);
    for i2=Nb:length(used)-Na
        times=vect+frames(i2);
        if max(times)<=befe && min(times)>=befs
            ints=fxyc(vect+i2,5,i);
            [slope, rsq]=LinearSlopeandR2(vect.',ints);
            JFbef=[JFbef slope];
            JRbef=[JRbef rsq];
        else
            if max(times)<=afte && min(times)>=afts
                ints=fxyc(vect+i2,5,i);
                [slope, rsq]=LinearSlopeandR2(vect.',ints);
                JFaft=[JFaft slope];
                JRaft=[JRaft rsq];
            end
        end
            
    end
end