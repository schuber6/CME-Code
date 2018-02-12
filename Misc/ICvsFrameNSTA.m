function [Init,Conc]=ICvsFrameNSTA(NSTA)

M=maxframeNSTA(NSTA);
Init=zeros(1,M);
Conc=zeros(1,M);
for i=1:length(NSTA)
    if NSTA(i).class~=4
        I=min(NSTA(i).frame);
        C=max(NSTA(i).frame);
        Init(I)=Init(I)+1;
        Conc(C)=Conc(C)+1;
    end
end
Init(1)=0;
Conc(M)=0;