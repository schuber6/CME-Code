function events=FindDNRDisappearancesFXYC(fxyc)
%Finds points in the DNR intensity trace where DNR goes from significantly
%above the threshold to below in a few frames (<=6)
%Also intensity must be in above/below category for >1 frame
Thresh=500;
BrightThresh=1000;
events=[];
h=waitbar(0,'Finding DNR Disappearances');
for i=1:length(fxyc(1,1,:))
    waitbar(i/length(fxyc(1,1,:)))
    L=length(find(fxyc(:,1,i)));
    Minievents=[];
    for i2=1:L
        if fxyc(i2,5,i)>=BrightThresh && i2+1<=L && fxyc(i2+1,5,i)>=BrightThresh
            for i3=1:min(6,L-(i2+2))
                if fxyc(i2+1+i3,5,i)<=Thresh && fxyc(i2+2+i3,5,i)<=Thresh
                    Minievents=[Minievents;[fxyc(i2+1,1,i) fxyc(i2+1,2,i) fxyc(i2+1,3,i) fxyc(i2+1,5,i)-fxyc(i2+1+i3,5,i) i3 i]];
                end
            end
        end
    end
    LimitedMinievents=TrimEvents(Minievents);
    events=[events;LimitedMinievents];
end
close(h)