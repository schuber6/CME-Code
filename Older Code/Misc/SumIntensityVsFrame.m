function I=SumIntensityVsFrame(file)

for i=1:length(imfinfo(file))
    A=imread(file,'Index',i);
    I(i)=sum(sum(A));
end