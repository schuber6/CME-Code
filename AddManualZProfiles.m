function NSTA=AddManualZProfiles(NSTA,frames,movie)

used=find([NSTA.class]==0);
events=[];
for i=1:length(used)
    for i2=1:length(frames)
        events=[events;[frames(i2) NSTA(used(i)).xpos(1) NSTA(used(i)).ypos(1)]];
    end
end
[Is,Bs]=ManualFitEvents_BackR(events,movie,3);
ind=1;
for i=1:length(used)
    Profile=[];
    for i2=1:length(frames)
        Profile=[Profile Is(ind)];
        ind=ind+1;
    end
    [A,x0,s]=FitGaussian(frames,Profile);
    NSTA(used(i)).Profile=Profile;
    NSTA(used(i)).ZGaussA=A;
    NSTA(used(i)).ZGaussX0=x0;
    NSTA(used(i)).ZGaussSD=s;
end
