function events=RecordEvents_fromStruct(fxyc_struct,Good)

events=[];
for i=1:length(Good(:,1))
    f=fxyc_struct(Good(i,1)).frame(Good(i,2));
    x=fxyc_struct(Good(i,1)).Mx(Good(i,2));
    y=fxyc_struct(Good(i,1)).My(Good(i,2));
    events=[events ; [f x y]];
end