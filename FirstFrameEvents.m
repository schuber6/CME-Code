function events=FirstFrameEvents(NSTA)

events=[];
for i=1:length(NSTA)
    used=find(NSTA(i).frame==1);
    if ~isempty(used)
        f=NSTA(i).frame(used(1));
        x=NSTA(i).xpos(used(1));
        y=NSTA(i).ypos(used(1));
        events=[events ; [f x y]];
    end
end