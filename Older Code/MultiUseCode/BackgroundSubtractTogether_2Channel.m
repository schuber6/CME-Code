function BackgroundSubtractTogether_2Channel(movie,new,oddback,evenback)
%Splits 2 channel movies into an odd channel and an even channel and
%subtracts out a background image
EB=imread(evenback);
OB=imread(oddback);
for i=1:length(imfinfo(movie))
    A=imread(movie,'Index',i);
    if ceil(i/2)==i/2
        A=A-EB;
        imwrite(A,new,'Writemode','append','Compression','none')
    else
        A=A-OB;
        imwrite(A,new,'Writemode','append','Compression','none')
    end
end