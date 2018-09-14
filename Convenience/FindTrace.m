function [Fi,Ti]=FindTrace(FXYC,F,X,Y)

for i=1:length(FXYC)
    fxyc=FXYC{i};
    used=find(fxyc(:,1)==F & fxyc(:,2)==X & fxyc(:,3)==Y);
    if ~isempty(used)
        Fi=i;
        Ti=used(1);
        return
    end
end
    