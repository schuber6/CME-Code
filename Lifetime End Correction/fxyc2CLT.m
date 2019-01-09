function [C,L,T]=fxyc2CLT(fxyc)
%Converts traces in fxyc to C, L, T vectors to be used with
%PlotAverageLifetime for lifetime end-correction

C=[];
L=[];
T=[];
[a,b,c]=size(fxyc);
for i=1:c
    Trace=fxyc(:,:,i);
    used=find(Trace(:,1));
    LT=length(used);
    Ctemp=[];
    Ltemp=[];
    Ttemp=[];
    ind=1;
    for i2=1:LT
        Ctemp(ind)=Trace(1,4);
        Ltemp(ind)=LT;
        Ttemp(ind)=Trace(i2,1);
        ind=ind+1;
    end
    C=[C Ctemp];
    L=[L Ltemp];
    T=[T Ttemp];
end