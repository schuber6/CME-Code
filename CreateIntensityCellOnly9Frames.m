function INT=CreateIntensityCellOnly9Frames(fxyc)

for i=1:length(fxyc(1,1,:))
    L(i)=length(find(fxyc(:,1,i)));
end
good=find(L==9);
INT=cell(1,length(good));
for i=1:length(good)
    used=find(fxyc(:,1,good(i)));
    INT{i}=fxyc(used,5,good(i));
end