function XY=FindPresent356s(fxyc,f)

XY=[];
for i=1:length(fxyc(1,1,:))
    used3=find(fxyc(:,1,i)==f & fxyc(:,4,i)==3);
    
    
    
    for i2=1:length(used3)
         XY=[XY;[round(fxyc(used3(i2),2,i)) round(fxyc(used3(i2),3,i))]];
    end
    used5=find(fxyc(:,1,i)==f & fxyc(:,4,i)==5);
    for i2=1:length(used5)
         XY=[XY;[round(fxyc(used5(i2),2,i)) round(fxyc(used5(i2),3,i))]];
    end
    used6=find(fxyc(:,1,i)==f & fxyc(:,4,i)==6);
    for i2=1:length(used6)
         XY=[XY;[round(fxyc(used6(i2),2,i)) round(fxyc(used6(i2),3,i))]];
    end
end