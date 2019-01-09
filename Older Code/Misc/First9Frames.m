function First9Frames(movie)

Movie=movie(1:end-4);
Old=strcat(Movie,'.tif');
New=strcat(Movie,'_9Frame.tif');
h=waitbar(0,'Background Subtracting');
for i=1:9
   
    A=imread(Old,'Index',i);
    
    imwrite(A,New,'Writemode','append','Compression','none')
end
close(h)