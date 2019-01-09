function [JFm,JRm,JFs,JRs]=CountJoshSlopes_MS_ByTrace(fxyc)

N=5;
Nb=floor(N/2);
Na=ceil(N/2);
vect=(-Nb+1):Na;
ind=0;

num=length(fxyc(1,1,:));
h=waitbar(0,'Joshing Slopes');
for i=1:length(fxyc(1,1,:))
    waitbar(i/num)
    used=find(fxyc(:,1,i));
    JFms=[];
    JRms=[];
    JFss=[];
    JRss=[];
    for i2=Nb:length(used)-Na
        Mints=fxyc(vect+i2,9,i);
        [slope, rsq]=LinearSlopeandR2(vect.',Mints);
        JFms=[JFms slope];
        JRms=[JRms rsq];
        Sints=fxyc(vect+i2,6,i);
        [slope, rsq]=LinearSlopeandR2(vect.',Sints);
        JFss=[JFss slope];
        JRss=[JRss rsq];
    end
    if ~isempty(JFms)
        ind=ind+1;
        JFm{ind}=JFms;
        JRm{ind}=JRms;
        JFs{ind}=JFss;
        JRs{ind}=JRss;
    end
end
close(h)