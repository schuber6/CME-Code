function [Offset1,Stretch1,bestSS,Worked]=FindBestTransform_OverlapFudge(Y1,Y2)

%Choose Y1 such that it is the one that probably needs stretched

%Finds best offset and stretch, such that Y1((i-Offset)*Stretch) most
%closely matches Y2(i) on Y2's range (measured by sum of squared
%differences--if Y1 does not cover Y2, uses mean of SSs--up to 50% by length)
%searches offsets from -length(Y1) to length(Y1)
%searches stretches from 1 to 4 (not linearly)
nS=100;

bestSS=sum(Y2.^2);
bestO=0;
bestS=0;
Worked=0;
X2=1:length(Y2);
X1i=1:length(Y1);
for Off=-length(Y1):length(Y1)
    for iS=0:nS
        Stretch=2^(iS/nS);
        X1=(X1i-Off)*Stretch;
        overlap=find(X2>=min(X1) & X2<=max(X1));
        if length(overlap)>=.5*length(X2)
            Y1r2=interp1(X1,Y1,X2(overlap));
            SS=0;
            for i=1:length(overlap)
                SS=SS+(Y1r2(i)-Y2(overlap(i)))^2;
            end
            SS=SS/length(overlap)*length(X2);
            if SS<bestSS
                bestSS=SS;
                bestO=Off;
                bestS=Stretch;
                Worked=1;
            end
        end
    end
end
Offset1=bestO;
Stretch1=bestS;