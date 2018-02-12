function First100Frames(movie,new)
%Splits 2 channel movies into an odd channel and an even channel
for i=1:100
    A=imread(movie,'Index',i);
    
        imwrite(A,new,'Writemode','append','Compression','none')
    
end