function INT=CreateIntensityCellAll(fxyc)

good=find(fxyc(1,4,:)~=4 & fxyc(1,4,:)~=7);
INT=cell(1,length(good));
for i=1:length(good)
    used=find(fxyc(:,1,good(i)));
    INT{i}=fxyc(used,5,good(i));
end