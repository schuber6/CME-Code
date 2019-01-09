function [Upper,Lower,Drop,t]=FindBiggestDrop(Is)

for i=2:length(Is)-1
    U(i)=mean(Is(1:i-1));
    L(i)=mean(Is(i+1:end));
    Drops(i)=U(i)-L(i);
end
best=find(Drops==max(Drops));
if ~isempty(best)
    Upper=U(best(1));
    Lower=L(best(1));
    Drop=Drops(best(1));
    t=best(1);
else
    Upper=0;
    Lower=0;
    Drop=0;
    t=0;
end