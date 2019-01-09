function Med=FindMedianMaxMasterIntensity(FXYCMS)

MM=[];
for i=1:length(FXYCMS)
    fxyc=FXYCMS{i};
    if fxyc(:,4)==3
        MM=[MM max(fxyc(:,6))];
    end
end
Med=median(MM);