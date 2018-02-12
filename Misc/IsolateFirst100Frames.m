function NSTA=IsolateFirst100Frames(NSTA)

NSTAgood=[];
for i=1:length(NSTA)
    if min(NSTA(i).frame<=100)
        NSTAgood=[NSTAgood NSTA(i)];
    end
end
NSTA=NSTAgood;