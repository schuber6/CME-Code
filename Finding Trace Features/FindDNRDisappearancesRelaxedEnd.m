function events=FindDNRDisappearancesRelaxedEnd(MSD)
%Finds points in the DNR intensity trace where DNR goes from significantly
%above the threshold to below in a few frames (<=6)
%Also intensity must be in above category for >1 frame
Thresh=500;
BrightThresh=1000;
events=[];
h=waitbar(0,'Finding DNR Disappearances');
for i=1:length(MSD)
    waitbar(i/length(MSD))
    L=length(MSD{i}(:,1));
    Minievents=[];
    for i2=1:L
        if MSD{i}(i2,4)>=BrightThresh && i2+1<=L && MSD{i}(i2+1,4)>=BrightThresh
            for i3=1:min(6,L-(i2+1))
                if MSD{i}(i2+1+i3,4)<=Thresh
                    Minievents=[Minievents;[MSD{i}(i2+1,1) MSD{i}(i2+1,2) MSD{i}(i2+1,3) MSD{i}(i2+1,4)-MSD{i}(i2+1+i3,4) i3 i]];
                end
            end
        end
    end
    LimitedMinievents=TrimEvents(Minievents);
    events=[events;LimitedMinievents];
end
close(h)