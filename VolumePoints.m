function VP=VolumePoints(masks)

VP=zeros(length(find(masks==1)),3);
ind=1;
[a,b,c]=size(masks);
for i=1:a
    for i2=1:b
    for i3=1:c
        if masks(i,i2,i3)==1
        VP(ind,:)=[i i2 i3];
        ind=ind+1;
        end
    end
    end
end