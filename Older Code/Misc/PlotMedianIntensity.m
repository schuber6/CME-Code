function IMv=PlotMedianIntensity(movie)

F=length(imfinfo(movie));
IM=imread(movie,'Index',1);
[A,B]=size(IM);
for i=1:F
    IM=imread(movie,'Index',i);
    IMv=reshape(IM,[1 A*B]);
    Med(i)=median(IMv);
end
plot(Med);
