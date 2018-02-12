function F=CreateFrameCell(fxyc)

good=find(fxyc(1,4,:)==3);
F=cell(1,length(good));
for i=1:length(good)
    used=find(fxyc(:,1,good(i)));
    F{i}=fxyc(used,1,good(i));
end