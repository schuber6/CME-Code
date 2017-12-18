function NSTArem=SelectLiftersFlat(NSTA,Lifters,Flat,inds)

ind=1;
for i=1:length(Lifters)
    NSTArem(ind)=NSTA(inds(Lifters(i)));
    ind=ind+1;
end
for i=1:length(Flat)
    NSTArem(ind)=NSTA(inds(Flat(i)));
    ind=ind+1;
end