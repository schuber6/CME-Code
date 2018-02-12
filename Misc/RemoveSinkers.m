function NSTArem=RemoveSinkers(NSTA,Sinkers,inds)

ind=1;
for i=1:length(NSTA)

if ~ismember(i,inds(Sinkers))
    NSTArem(ind)=NSTA(i);
    ind=ind+1;
end
end