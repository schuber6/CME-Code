function PlotSumIntensity(movie,exposure)

F=length(imfinfo(movie));
for i=1:F
    IM=imread(movie,'Index',i);
    INT(i)=sum(sum(IM));
    EX(i)=i*exposure;
end
plot(EX,INT/max(INT))