function Pairs=FindPairs(XY1,XY2)
%Find things in XY1 that are <=2px away from things in XY2
Pairs=[];
for i=1:length(XY1(:,1))
    X1=XY1(i,1);
    Y1=XY1(i,2);
    for i2=1:length(XY2(:,1))
        X2=XY2(i2,1);
        Y2=XY2(i2,2);
        D=norm([X1-X2 Y1-Y2]);
        if D<=2
            Pairs=[Pairs ; [i i2]];
        end
    end
end