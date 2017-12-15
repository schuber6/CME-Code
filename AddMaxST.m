function nstaF=AddMaxST(nstaF)

Stacks=length(nstaF(1).BSSumsNoFit(1,:));
for i=1:Stacks
    Weight(i)=i;
    Z(i)=0.001;
end
h=waitbar(0,'Z Localizing');
for i=1:length(nstaF)
    waitbar(i/length(nstaF))
    L=length(nstaF(i).BSSumsNoFit(:,1));
    M=zeros(1,L);
    M3=zeros(1,L);
    
    for i2=1:L
        BSS=max(nstaF(i).BSSums(i2,:),Z);
        BSSNF=max(nstaF(i).BSSumsNoFit(i2,:),Z);
        BSSR=max(nstaF(i).RawSums(i2,:),Z);
        Mi=find(BSSNF==max(BSSNF),1,'first');
        M(i2)=Mi;
        if Mi~=1 && Mi~=Stacks
            Trip=[BSSNF(Mi-1) BSSNF(Mi) BSSNF(Mi+1)];
            TripW=[Weight(Mi-1) Weight(Mi) Weight(Mi+1)];
            M3(i2)=sum(Trip.*TripW)/sum(Trip);
        else
            M3(i2)=Mi;
        end
        
    end
    nstaF(i).stM=M;
    nstaF(i).stM3=M3;
end
close(h)