function SplitChannels(movie,oddnew,evennew)
%Splits 2 channel movies into an odd channel and an even channel
for i=1:length(imfinfo(movie))
    A=imread(movie,'Index',i);
    if ceil(i/2)==i/2
        imwrite(A,evennew,'Writemode','append','Compression','none')
    else
        imwrite(A,oddnew,'Writemode','append','Compression','none')
    end
end