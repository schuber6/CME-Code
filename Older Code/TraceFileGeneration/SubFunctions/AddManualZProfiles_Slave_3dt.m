function NSTA=AddManualZProfiles_Slave_3dt(NSTA,planes,movie)

used=find([NSTA.class]==0);
events=[];
Einds=[];
for i=1:length(used)
    usedF=find(NSTA(used(i)).frame);
    Fs=NSTA(used(i)).frame(usedF);
    for i2=1:length(Fs)
        for i3=1:planes
            events=[events;[(Fs(i2)-1)*planes+i3 NSTA(used(i)).xpos(usedF(i2)) NSTA(used(i)).ypos(usedF(i2))]];
            Einds=[Einds ; [i i2]];
        end
    end
end

[Is,Bs]=ManualFitEvents_BackR(events,movie,3);

for i=1:length(used)
    usedF=find(NSTA(used(i)).frame);
    NSTA(used(i)).SProfile=[];
    NSTA(used(i)).SZGaussA=[];
    NSTA(used(i)).SZGaussX0=[];
    NSTA(used(i)).SZGaussSD=[];
    for i0=1:length(usedF)
        Profile=[];
        usedP=find(Einds(:,1)==i & Einds(:,2)==i0);
        for i2=1:length(usedP)
            Profile=[Profile Is(usedP(i2))];
        end
        [A,x0,s]=FitGaussian((1:planes),Profile);
        NSTA(used(i)).SProfile=[NSTA(used(i)).SProfile ; Profile];
        NSTA(used(i)).SZGaussA=[NSTA(used(i)).SZGaussA A];
        NSTA(used(i)).SZGaussX0=[NSTA(used(i)).SZGaussX0 x0];
        NSTA(used(i)).SZGaussSD=[NSTA(used(i)).SZGaussSD s];
    end
end
