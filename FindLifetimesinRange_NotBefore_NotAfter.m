function LTs=FindLifetimesinRange_NotBefore_NotAfter(NSTA,Beg,Fin,fg)

LTs=[];
for i=1:length(NSTA)
    if NSTA(i).class<4 && min(NSTA(i).frame)>Beg && max(NSTA(i).frame)<Fin && (mean(NSTA(i).frame)<=Fin && mean(NSTA(i).frame)>=Beg)
        LTs=[LTs NSTA(i).lt*fg];
    end
end