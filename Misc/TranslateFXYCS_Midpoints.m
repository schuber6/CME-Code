function [C,L,T]=TranslateFXYCS_Midpoints(fxycS)

ind=1;
for i=1:length(fxycS)
    
    lif=length(fxycS(i).frame);
    c=fxycS(i).class;
    i2=ceil(lif/2);
        C(ind)=c;
        L(ind)=lif;
        T(ind)=fxycS(i).frame(i2);
        ind=ind+1;
    
end