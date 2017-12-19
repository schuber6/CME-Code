function SplitStacks(Movie,n)
%Splits multi stack movie into n movies--1 for each stack

h=waitbar(0,'Splitting Stacks');
Old=strcat(Movie,'.tif');
frames=length(imfinfo(Old));
for i=1:n
    waitbar(i/n)
    
    New=strcat(Movie,'_Stack',num2str(i),'.tif');
    
    
    
    for i2=1:floor((frames-i)/n)+1
        
        A=imread(Old,'Index',(i2-1)*n+i);
        
        imwrite(A,New,'Writemode','append','Compression','none')
    end
    
end
close(h)