function [Err,ErrV]=FullErrorRate(preB,preE,D)

Dp=zeros(size(D));
for i=1:length(preB)
    if preB(i)==1 && preE(i)==1
        Dp(i)=3;
    end
    if preB(i)==1 && preE(i)==0
        Dp(i)=1;
    end
    if preB(i)==0 && preE(i)==1
        Dp(i)=2;
    end
    if preB(i)==0 && preE(i)==0
        Dp(i)=4;
    end
end
Err=sum(double(Dp~=D))/length(D);
ErrV=Dp~=D;