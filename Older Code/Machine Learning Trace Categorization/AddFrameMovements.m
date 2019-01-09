function Data=AddFrameMovements(Data,fxyc)

for i=1:length(Data)
    T=Data(i).T;
    F=fxyc(:,:,T);
    used=find(F(:,1));
    F=F(used,:);
    X=F(:,2);
    Y=F(:,3);
    for i2=1:length(X)-1
        Data(i).Dist(i2)=norm([X(i2+1)-X(i2) Y(i2+1)-Y(i2)]);
    end
end