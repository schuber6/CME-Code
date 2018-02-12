function [C,L,T]=TranslateFXYCS(fxycS)

ind=1;
for i=1:length(fxycS)
    
    lif=length(fxycS(i).frame);
    c=fxycS(i).class;
    for i2=1:lif
        C(ind)=c;
        L(ind)=lif;
        T(ind)=fxycS(i).frame(i2);
        ind=ind+1;
    end
end