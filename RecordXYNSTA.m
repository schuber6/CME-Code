function [TraceX,TraceY]=RecordXYNSTA(NSTA)

ind=1;
for i=1:length(NSTA)
    if NSTA(i).class~=4
        frames=NSTA(i).frame;
        TraceX(ind,frames)=NSTA(i).xpos;
        TraceY(ind,frames)=NSTA(i).ypos;
        ind=ind+1;
    end
end