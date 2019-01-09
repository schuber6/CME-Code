function [MM,MS]=QuantifyStallIntensities(FXYCMS)

MinLTF=150;
MinI=0;
MM=[];
MS=[];
for i=1:length(FXYCMS)
    fxyc=FXYCMS{i};
    if length(fxyc(:,1))>=MinLTF && length(find(fxyc(:,6)>=MinI))>=MinLTF
        MM=[MM median(fxyc(:,6))];
        MS=[MS median(fxyc(:,7))];
    end
end