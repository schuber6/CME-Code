function XY=FindPresent3s(fxyc,f)

XY=[];
for i=1:length(fxyc(1,1,:))
    used=find(fxyc(:,1,i)==f & fxyc(:,4,i)==3);
    for i2=1:length(used)
         XY=[XY;[round(fxyc(used(i2),2,i)) round(fxyc(used(i2),3,i))]];
    end
end
    