function crop=PitAtMax(fxyc,movie)

ind=find(fxyc(:,7)==max(fxyc(:,7)));
f=fxyc(ind(1),1);
x=fxyc(ind(1),2);
y=fxyc(ind(1),3);
IM=imread(movie,'Index',f);
crop=CropEvent(round(x),round(y),IM,5);