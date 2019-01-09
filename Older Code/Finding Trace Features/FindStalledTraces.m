function FXYC=FindStalledTraces(file)

load(file)
FXYC={};
ind=1;
for i=1:length(FXYCMS)
    fxyc=FXYCMS{i};
    if length(fxyc(:,1))>=75
        FXYC{ind}=fxyc;
        ind=ind+1;
    end
end