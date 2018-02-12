function [t,ind]=PickRandomPoint(NSTA)

found=0;
while found==false
    t=ceil(rand*length(NSTA));
    if NSTA(t).class==0 && max(NSTA(t).int)>=1000
        used=find(NSTA(t).int>=1000);
        ind=used(ceil(rand*length(used)));
        found=1;
    end
end