function Drops=TabulateManualFitChanges_Neighbors(events,Is)

Drops=[];
offset=2;
for i=1:length(events(:,1))-offset
    Xi=events(i,2);
    Yi=events(i,3);
    
    
    missed=0;
    
    
        if i+offset<=length(events(:,1))
            Xf=events(i+offset,2);
            Yf=events(i+offset,3);
            D=norm([Xi-Xf Yi-Yf]);
            if D<=3
                Drops=[Drops Is(i)-Is(i+offset)];
            
            end
            
        else
            break
        end
    
end