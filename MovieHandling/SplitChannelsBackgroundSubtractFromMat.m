function SplitChannelsBackgroundSubtractFromMat(movie,oddnew,evennew,AV)
%Splits 2 channel movies into an odd channel and an even channel and
%subtracts out a background image
EB=uint16(AV{2});
OB=uint16(AV{1});
for i=1:length(imfinfo(movie))
    A=imread(movie,'Index',i);
    if ceil(i/2)==i/2
        A=A-EB;
        imwrite(A,evennew,'Writemode','append','Compression','none')
    else
        A=A-OB;
        imwrite(A,oddnew,'Writemode','append','Compression','none')
    end
end