function BI=FindBackground(file)
%Finds total intensity that can be attributed to background by assuming
%100x100 box has no features in it (box set to bottom left)
frames=length(imfinfo(file));
[A,B]=size(imread(file,'Index',1));
BI=zeros(1,frames);
for i=1:frames
    IM=imread(file,'Index',i);
    S=0;
    for i2=1:100
        for i3=1:100
            S=S+double(IM(A-i2+1,i3));
        end
    end
    BI(i)=S*A*B/10000;
end