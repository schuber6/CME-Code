function [B,E]=SeparateCategory(C)

[a,b]=size(C);
B=zeros(size(C));
E=zeros(size(C));
for i=1:a
    for i2=1:b
        if C(i,i2)==1
            B(i,i2)=1;
            E(i,i2)=0;
        end
        if C(i,i2)==2
            B(i,i2)=0;
            E(i,i2)=1;
        end
        if C(i,i2)==3
            B(i,i2)=1;
            E(i,i2)=1;
        end
        if C(i,i2)==4
            B(i,i2)=0;
            E(i,i2)=0;
        end
    end
end