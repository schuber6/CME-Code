function ints=ListIntensities(fxyc)

ints=[];
for i=1:length(fxyc(1,1,:))
    used=find(fxyc(:,1,i));
    for i2=1:max(used)
        ints=[ints fxyc(i2,5,i)];
    end
end