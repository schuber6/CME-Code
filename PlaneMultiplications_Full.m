function [H,W]=PlaneMultiplications_Full(file,frame) %Lists the division of the intensity of the pixel in plane i+1 divided by the pixel in plane i

A=imread(file,'Index',1);
[a,b]=size(A);
H=zeros(a*b,1);


i=frame;
    H=zeros(a*b,1);
    W=zeros(a*b,1);
    
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
    
    

    

