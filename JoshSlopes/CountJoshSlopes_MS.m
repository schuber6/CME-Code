function [JFm,JRm,JFs,JRs]=CountJoshSlopes_MS(fxyc)

N=5;
Nb=floor(N/2);
Na=ceil(N/2);
vect=(-Nb+1):Na;
JFm=[];
JRm=[];
JFs=[];
JRs=[];
num=length(fxyc(1,1,:));
h=waitbar(0,'Joshing Slopes');
for i=1:length(fxyc(1,1,:))
    waitbar(i/num)
    used=find(fxyc(:,1,i));
    for i2=Nb:length(used)-Na
        Mints=fxyc(vect+i2,9,i);
        [slope, rsq]=LinearSlopeandR2(vect.',Mints);
        JFm=[JFm slope];
        JRm=[JRm rsq];
        Sints=fxyc(vect+i2,6,i);
        [slope, rsq]=LinearSlopeandR2(vect.',Sints);
        JFs=[JFs slope];
        JRs=[JRs rsq];
    end
end
close(h)