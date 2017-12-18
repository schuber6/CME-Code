function [me,wme]=HistPlaneMultiplications_BrightWeight(file) %Lists the division of the intensity of the pixel in plane i+1 divided by the pixel in plane i

A=imread(file,'Index',1);
[a,b]=size(A);
H=zeros(a*b,1);
h=waitbar(0,'Dividing Planes');
me=zeros(1,length(imfinfo(file))-1);
for i=1:length(imfinfo(file))-1
    H=zeros(a*b,1);
    W=zeros(a*b,1);
    waitbar(i/length(imfinfo(file)))
    A=imread(file,'Index',i);
    B=imread(file,'Index',i+1);
    ind=1;
    for i2=1:a
        for i3=1:b
            if B(i2,i3)~=0 && A(i2,i3)~=0
            H(ind)=double(B(i2,i3))/double(A(i2,i3));
            W(ind)=B(i2,i3);
            ind=ind+1;
            end
        end
    end
    
    
    xbins=-100:100;
    xbins=xbins/20;
    xbins=2.^(xbins);
    bklj=1:201;
    C=hist(H,xbins);
    C(1)=0;
    C(201)=0;
    me(i)=sum(C.*bklj)/sum(bklj);
    wme(i)=sum(H.*W)/sum(W);
    
end
close(h)