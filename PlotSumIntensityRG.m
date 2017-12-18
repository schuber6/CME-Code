function PlotSumIntensityRG(movieM,movieS,exposure)

F=length(imfinfo(movieM));
for i=1:F
    IM=imread(movieM,'Index',i);
    INT(i)=sum(sum(IM));
    EX(i)=i*exposure;
end
subplot(1,2,1)
plot(EX,INT/max(INT),'g')
hold on
F=length(imfinfo(movieS));
for i=1:F
    IM=imread(movieS,'Index',i);
    INT(i)=sum(sum(IM));
    EX(i)=i*exposure;
end
subplot(1,2,2)
plot(EX,INT/max(INT),'r')
hold on