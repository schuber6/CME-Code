RedSH=[];
RednSH=[];
BlackSH=[];
BlacknSH=[];
for i=1:length(Waters)
    if Reds(i)==1 && SHs(i)==1
        RedSH=[RedSH ;[Waters(i) Parts(i) LFs(i) PreLTs(i) PostLTs(i) PreMaxInts(i) PostMaxInts(i) TotalMaxInts(i) MaxIntFs(i)]];
    end
    if Reds(i)==1 && SHs(i)==0
        RednSH=[RednSH ;[Waters(i) Parts(i) LFs(i) PreLTs(i) PostLTs(i) PreMaxInts(i) PostMaxInts(i) TotalMaxInts(i) MaxIntFs(i)]];
    end
    if Reds(i)==0 && SHs(i)==1
        BlackSH=[BlackSH ;[Waters(i) Parts(i) LFs(i) PreLTs(i) PostLTs(i) PreMaxInts(i) PostMaxInts(i) TotalMaxInts(i) MaxIntFs(i)]];
    end
    if Reds(i)==0 && SHs(i)==0
        BlacknSH=[BlacknSH ;[Waters(i) Parts(i) LFs(i) PreLTs(i) PostLTs(i) PreMaxInts(i) PostMaxInts(i) TotalMaxInts(i) MaxIntFs(i)]];
    end
end

    