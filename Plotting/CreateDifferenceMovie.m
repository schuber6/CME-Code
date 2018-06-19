function CreateDifferenceMovie(file,newfile)

Fs=length(imfinfo(file));
for i=1:Fs-1
    IM1=uint8(imread(file,'Index',i));
    IM2=uint8(imread(file,'Index',i+1));
    A(:,:,1)=IM1-IM2;
    A(:,:,2)=IM2-IM1;
    A(:,:,3)=IM1;
    imwrite(A,newfile,'Writemode','append','Compression','none');
end