function Drops=TabulateManualFitChanges(events,Is)

Drops=[];
for i=1:length(events(:,1))-1
    Xi=events(i,2);
    Yi=events(i,3);
    
    
    missed=0;
    offset=1;
    while ~missed
        if i+offset<=length(events(:,1))
            Xf=events(i+offset,2);
            Yf=events(i+offset,3);
            D=norm([Xi-Xf Yi-Yf]);
            if D<=3
                Drops=[Drops Is(i)-Is(i+offset)];
            else
                break
            end
            offset=offset+1;
        else
            break
        end
    end
end