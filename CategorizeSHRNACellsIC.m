RedSH=[];
RednSH=[];
BlackSH=[];
BlacknSH=[];
for i=1:length(Waters)
    if Reds(i)==1 && SHs(i)==1
        RedSH=[RedSH ;[Waters(i) Parts(i) PreInitDs(i) PostInitDs(i) PreConcDs(i) PostConcDs(i) PreAreas(i) PostAreas(i)]];
    end
    if Reds(i)==1 && SHs(i)==0
        RednSH=[RednSH ;[Waters(i) Parts(i) PreInitDs(i) PostInitDs(i) PreConcDs(i) PostConcDs(i) PreAreas(i) PostAreas(i)]];
    end
    if Reds(i)==0 && SHs(i)==1
        BlackSH=[BlackSH ;[Waters(i) Parts(i) PreInitDs(i) PostInitDs(i) PreConcDs(i) PostConcDs(i) PreAreas(i) PostAreas(i)]];
    end
    if Reds(i)==0 && SHs(i)==0
        BlacknSH=[BlacknSH ;[Waters(i) Parts(i) PreInitDs(i) PostInitDs(i) PreConcDs(i) PostConcDs(i) PreAreas(i) PostAreas(i)]];
    end
    
end
SH=[RedSH ; BlackSH];
nSH=[RednSH ; BlacknSH];
All=[SH ; nSH];
