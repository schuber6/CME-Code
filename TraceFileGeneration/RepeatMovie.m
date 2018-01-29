function RepeatMovie(file)
%Add N repeats of the movie at file to the end of file

N=4;
L=length(imfinfo(file));
for i0=1:N
for i=1:L
    A=imread(file,'Index',i);
    imwrite(A,file,'Writemode','append','Compression','none')
end
end