function fxycS=fxyc2fxycStruct(fxyc)

[a,b,N]=size(fxyc);
fxycS(N)=struct();
for i0=1:N
    U=find(fxyc(:,1,i0));
    L=length(U);
    fxycS(i0).frame=zeros(1,L);
    fxycS(i0).int=zeros(1,L);
    fxycS(i0).xpos=zeros(1,L);
    fxycS(i0).ypos=zeros(1,L);
    fxycS(i0).class=fxyc(1,4,i0);
    fxycS(i0).lt=U(end)-U(1);
    ind=1;
    for i00=1:length(U)
        i=U(i00);
        fxycS(i0).frame(ind)=fxyc(i,1,i0);
        fxycS(i0).int(ind)=fxyc(i,5,i0);
        fxycS(i0).xpos(ind)=fxyc(i,2,i0);
        fxycS(i0).ypos(ind)=fxyc(i,3,i0);
        ind=ind+1;
    end
    fxycS(i0).frame=single(fxycS(i0).frame);
    fxycS(i0).int=single(fxycS(i0).int);
    fxycS(i0).xpos=single(fxycS(i0).xpos);
    fxycS(i0).ypos=single(fxycS(i0).ypos);
end