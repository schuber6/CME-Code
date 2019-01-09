function NSTA=AddManualZProfiles_3dt(NSTA,planes,movie)

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
    NSTA(used(i)).Profile=[];
    NSTA(used(i)).ZGaussA=[];
    NSTA(used(i)).ZGaussX0=[];
    NSTA(used(i)).ZGaussSD=[];
    for i0=1:length(usedF)
        Profile=[];
        usedP=find(Einds(:,1)==i & Einds(:,2)==i0);
        for i2=1:length(usedP)
            Profile=[Profile Is(usedP(i2))];
        end
        [A,x0,s]=FitGaussian((1:planes),Profile);
        NSTA(used(i)).Profile=[NSTA(used(i)).Profile ; Profile];
        NSTA(used(i)).ZGaussA=[NSTA(used(i)).ZGaussA A];
        NSTA(used(i)).ZGaussX0=[NSTA(used(i)).ZGaussX0 x0];
        NSTA(used(i)).ZGaussSD=[NSTA(used(i)).ZGaussSD s];
    end
end
