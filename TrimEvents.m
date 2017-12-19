function LimitedMinievents=TrimEvents(Minievents)
%Remove Repetive events
%Events must be >=10 frames apart, If multiple events conflict, the one with
%the shortest drop time wins

LimitedMinievents=[];
if isempty(Minievents)
    return
end
for i=1:6
    used=find(Minievents(:,5)==i);
    
    for i2=1:length(used)
        found=0;
        [A,~]=size(LimitedMinievents);
        for i3=1:A
            if abs(LimitedMinievents(i3,1)-Minievents(used(i2),1))<10
                found=1;
            end
        end
        if found==0
            LimitedMinievents=[LimitedMinievents;[Minievents(used(i2),1) Minievents(used(i2),2) Minievents(used(i2),3) Minievents(used(i2),6)]];
        end
    end
end