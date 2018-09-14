function [MedM,MedS]=MedianSignal(FXYCMS)

M=[];
S=[];
for i=1:length(FXYCMS)
    fxyc=FXYCMS{i};
    M=[M fxyc(:,6).'];
    S=[S fxyc(:,7).'];
end
MedM=median(M);
MedS=median(S);