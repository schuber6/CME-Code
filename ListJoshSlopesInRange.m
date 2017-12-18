function [SD,Slopes]=ListJoshSlopesInRange(fxycS,start,finish)

Slopes=[];
for i=1:length(fxycS)
    if fxycS(i).class~=4 && fxycS(i).class~=7
        used=find(fxycS(i).frame>=start & fxycS(i).frame<finish);
        Slopes=[Slopes ; nonzeros(fxycS(i).sl(used))];
    end
end
SD=sqrt(var(Slopes));