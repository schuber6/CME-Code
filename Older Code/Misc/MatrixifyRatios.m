ThreshM=400;
ThreshS=400;
MinR=.5;
for i=1:9
    used=find(XYAmAs{i}(:,3)>ThreshM & (XYAmAs{i}(:,4)>ThreshS) & XYAmAs{i}(:,3)./XYAmAs{i}(:,4)>MinR); 
    for i2=1:length(used)
        M(i2,i)=XYAmAs{i}(used(i2),3)/XYAmAs{i}(used(i2),4);
    end
end
    