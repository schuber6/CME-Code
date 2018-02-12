function EventLifetimes=FindEventLifetimes(events,MSD)
%Generates EventLifetimes vector where each entry corresponds to the event
%of the same number
%Lifetime is the number of continuous frames (*FrameGap) that the DNR intensity stays
%above LB
LB=500;
FrameGap=1;
for i=1:length(events(:,1))
    INT=MSD{events(i,4)};
    frame=events(i,1);
    Dis=find(MSD{events(i,4)}(:,1)==events(i,1));
    Up=frame;
    Down=frame;
    found=false;
    while ~found
        NUp=find(MSD{events(i,4)}(:,1)==Up+1);
        if ~isempty(NUp) && MSD{events(i,4)}(NUp(1),4)>LB
            Up=Up+1;
        else
            found=true;
        end
    end
    found=false;
    while ~found
        NDown=find(MSD{events(i,4)}(:,1)==Down-1);
        if ~isempty(NDown) && MSD{events(i,4)}(NDown(1),4)>LB
            Down=Down-1;
        else
            found=true;
        end
    end
    EventLifetimes(i)=(Up-Down+1)*FrameGap;
    
end