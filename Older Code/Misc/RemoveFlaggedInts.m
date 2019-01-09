function FINT=RemoveFlaggedInts(Flags,MSD,trace)

FINT=[];
for i=1:length(MSD{trace}(:,1))
    if Flags(i,7)==0
        FINT=[FINT;[MSD{trace}(i,5) i]];
    else
        FINT=[FINT;[0 i]];
    end
end