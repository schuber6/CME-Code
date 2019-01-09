function MaxIntsSlave=FindMaxIntSlave(events,MSD)
%Generates Maxints vector where each entry corresponds to the event
%of the same number
%Only looks through section of trace between points below LB in intensity

LB=500;
for i=1:length(events(:,1))
    INT=MSD{events(i,4)};
    frame=events(i,1);
    Dis=find(MSD{events(i,4)}(:,1)==events(i,1));
    Up=frame;
    Down=frame;
    found=false;
    frames=[Dis(1)];
    while ~found
        NUp=find(MSD{events(i,4)}(:,1)==Up+1);
        if ~isempty(NUp) && MSD{events(i,4)}(NUp(1),4)>LB
            Up=Up+1;
            frames=[frames NUp(1)];
        else
            found=true;
        end
    end
    found=false;
    while ~found
        NDown=find(MSD{events(i,4)}(:,1)==Down-1);
        if ~isempty(NDown) && MSD{events(i,4)}(NDown(1),4)>LB
            Down=Down-1;
            frames=[frames NDown(1)];
        else
            found=true;
        end
    end
    INT=MSD{events(i,4)}(frames,5);
    MaxIntsSlave(i)=max(INT);
    
end