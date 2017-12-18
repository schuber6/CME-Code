function SplitIntoSingleStackRepeatMovies(Movie,Stacks)

Repeats=5;
F=length(imfinfo(Movie));
for i=1:floor(F/Stacks)
    Name=strcat(Movie(1:end-4),'_Stack',num2str(i),'.tif');
    for i2=1:Repeats
        for i3=1:Stacks
            fi=(i-1)*Stacks+i3;
            IM=imread(Movie,'Index',fi);
            imwrite(IM,Name,'Writemode','append','Compression','none')
        end
    end
end