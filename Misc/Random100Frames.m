function Random100Frames(movie,new)
%Splits 2 channel movies into an odd channel and an even channel
L=length(imfinfo(movie));
for i=1:100
    A=imread(movie,'Index',ceil(rand*L));
    
        imwrite(A,new,'Writemode','append','Compression','none')
    
end