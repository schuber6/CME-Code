function NSTA=AddManualZProfiles_Slave(NSTA,frames,movie)

used=find([NSTA.class]==0);
events=[];
for i=1:length(used)
    for i2=1:length(frames)
        events=[events;[frames(i2) NSTA(used(i)).sx NSTA(used(i)).sy]];
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
    NSTA(used(i)).SProfile=Profile;
    NSTA(used(i)).SZGaussA=A;
    NSTA(used(i)).SZGaussX0=x0;
    NSTA(used(i)).SZGaussSD=s;
end
