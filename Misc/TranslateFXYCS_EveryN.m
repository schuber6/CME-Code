function [C,L,T]=TranslateFXYCS_EveryN(fxycS,N)

ind=1;
C=[];
L=[];
T=[];
for i=1:length(fxycS)
    
    %lif=length(fxycS(i).frame);
    lif=fxycS(i).lt;
    c=fxycS(i).class;
    for i2=1:length(fxycS(i).frame)
        if (fxycS(i).frame(i2)-1)/N==ceil((fxycS(i).frame(i2)-1)/N) || i2==1
        C(ind)=c;
        L(ind)=lif;
        T(ind)=fxycS(i).frame(i2);
        ind=ind+1;
        end
    end
end