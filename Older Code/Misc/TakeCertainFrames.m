function TakeCertainFrames(movie,newmovie,Fs)

for i=1:length(Fs)
    A=imread(movie,'Index',Fs(i));
    imwrite(A,newmovie,'Writemode','append','Compression','none')
end