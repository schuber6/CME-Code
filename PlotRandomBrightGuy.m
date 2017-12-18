function PlotRandomBrightGuy(fxyc)

ints=ListIntensities(fxyc);
bright=prctile(ints,50);
Bu=find(fxyc(1,5,:)>=bright);
for i=1:9
    subplot(3,3,i)
    T=Bu(ceil(rand*length(Bu)));
    used=find(fxyc(:,1,T));
    plot(fxyc(used,5,T))
end