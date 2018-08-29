function [p,FPp]=PercentMatch(fxyc1,fxyc2)

Correct=0;
for i=1:length(fxyc1(:,1))
    I=find(fxyc2(:,1)==fxyc1(i,1));
    if ~isempty(I)
        D=norm([fxyc1(i,2)-fxyc2(I(1),2) fxyc1(i,3)-fxyc2(I(1),3)]);
        if D<=sqrt(2)
            Correct=Correct+1;
        end
    end
end
p=Correct/length(fxyc1(:,1));
FPp=(length(fxyc2)-Correct)/length(fxyc2);