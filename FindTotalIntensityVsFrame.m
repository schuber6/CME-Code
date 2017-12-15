function FI=FindTotalIntensityVsFrame(file)

frames=length(imfinfo(file));
FI=zeros(1,frames);
for i=1:frames
    IM=imread(file,'Index',i);
    FI(i)=sum(sum(IM));
end