function [JMSlopes,JSSlopes,JMints,JSints,JACs,JMrsq]=BinByJoshSlope_add_MedMaxNorm_ZGauss(NSTA,JMSlopes,JSSlopes,JMints,JSints,JACs,JMrsq)

N=5;

[NormM,NormS]=MedianOfTraceMaxima(NSTA);
Nb=floor(N/2);
Na=ceil(N/2);
vect=(-Nb+1):Na;
num=length(NSTA);
h=waitbar(0,'Joshing Slopes');
usedC=SelectReasonableZGaussFits(NSTA);
for i=1:length(NSTA)
    waitbar(i/num)

    used=usedC{i};
    for i2=Nb:length(used)-Na
        Mints=NSTA(i).ZGaussA(vect+i2)/NormM;
        MintsN=Mints/max(Mints);
        [slope, rsq]=LinearSlopeandR2(vect,MintsN);
        JMSlopes=[JMSlopes slope];
        JMrsq=[JMrsq rsq];
        
        Sints=NSTA(i).SZGaussA(vect+i2)/NormS;
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