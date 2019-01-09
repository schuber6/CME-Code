function BackgroundSubtract(Movie,Background)
%Movie Name should not have .tif at end

Old=strcat(Movie,'.tif');
New=strcat(Movie,'_BS.tif');
frames=length(imfinfo(Old));
Back=imread(Background);
h=waitbar(0,'Background Subtracting');
for i=1:frames
    waitbar(i/frames)
    A=imread(Old,'Index',i);
    A_BS=A-Back;
    imwrite(A_BS,New,'Writemode','append','Compression','none')
end
close(h)