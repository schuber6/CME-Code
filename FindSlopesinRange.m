function Slopes=FindSlopesinRange(NSTA,Beg,Fin)

Slopes=[];
for i=1:length(NSTA)
    if NSTA(i).class~=4
        for i2=1:length(NSTA(i).frame)
            used=find(NSTA(i).frame>=Beg & NSTA(i).frame<=Fin & NSTA(i).sl~=0);
            Slopes=[Slopes ; NSTA(i).sl(used)];
        end
    end
end