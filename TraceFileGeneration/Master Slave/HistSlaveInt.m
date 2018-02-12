function HistSlaveInt(MSD)

Ints=[];
MInts=[];
for i=1:length(MSD)
    for i2=1:length(MSD{i}(:,1))
        Ints=[Ints MSD{i}(i2,5)];
    end
    MInts=[MInts max(MSD{i}(:,5))];
end
xbins=1:50;
xbins=xbins*50000/50;
figure
hist(MInts,xbins)
xlim([0 max(xbins)])