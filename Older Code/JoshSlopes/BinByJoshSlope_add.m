function [JMSlopes,JSSlopes,JMints,JSints,JACs,JMrsq]=BinByJoshSlope_add(NSTA,JMSlopes,JSSlopes,JMints,JSints,JACs,JMrsq)

N=5;

Nb=floor(N/2);
Na=ceil(N/2);
vect=(-Nb+1):Na;
num=length(NSTA);
h=waitbar(0,'Joshing Slopes');
for i=1:length(NSTA)
    waitbar(i/num)
    used=find(NSTA(i).sint);
    for i2=Nb:length(used)-Na
        Mints=NSTA(i).mint(vect+i2);
        MintsN=Mints/max(Mints);
        [slope, rsq]=LinearSlopeandR2(vect,MintsN);
        JMSlopes=[JMSlopes slope];
        JMrsq=[JMrsq rsq];
        
        Sints=NSTA(i).sint(vect+i2);
        SintsN=Sints/max(Sints);
        [slope, rsq]=LinearSlopeandR2(vect,SintsN);
        JSSlopes=[JSSlopes slope];
        
%         JMints=[JMints median(Mints)];
%         JSints=[JSints median(Sints)];
%         JACs=[JACs log(median(Mints)/median(Sints))];
        JMints=[JMints Mints(Nb)];
        JSints=[JSints Sints(Nb)];
        JACs=[JACs log(Mints(Nb)/Sints(Nb))];
    end
end
close(h)