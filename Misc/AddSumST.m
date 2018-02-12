function nstaF=AddSumST(nstaF)

Stacks=length(nstaF(1).BSSumsNoFit(1,:));
for i=1:Stacks
    Weight(i)=i;
    Z(i)=0.001;
end
h=waitbar(0,'Z Localizing');
for i=1:length(nstaF)
    waitbar(i/length(nstaF))
    L=length(nstaF(i).BSSumsNoFit(:,1));
    stsr=zeros(1,L);
    sts=zeros(1,L);
    stsnf=zeros(1,L);
    for i2=1:L
        BSS=max(nstaF(i).BSSums(i2,:),Z);
        BSSNF=max(nstaF(i).BSSumsNoFit(i2,:),Z);
        BSSR=max(nstaF(i).RawSums(i2,:),Z);
        sts(i2)=sum(BSS.*Weight)/sum(BSS);
        stsnf(i2)=sum(BSSNF.*Weight)/sum(BSSNF);
        stsr(i2)=sum(BSSR.*Weight)/sum(BSSR);
    end
    nstaF(i).stSum=sts;
    nstaF(i).stSumNF=stsnf;
    nstaF(i).stRaw=stsr;
end
close(h)