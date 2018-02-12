function XYA=XYAfromRepeatFXYC(fxyc)

[~,~,A]=size(fxyc);
XYA=zeros(A,3);
for i=1:A
    XYA(i,:)=[round(fxyc(1,2,i)) round(fxyc(1,3,i)) fxyc(1,5,i)];
end