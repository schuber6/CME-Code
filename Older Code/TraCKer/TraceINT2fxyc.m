function fxyc=TraceINT2fxyc(TraceX,TraceY,TraceINT)

fxyc=[];
for i=1:length(TraceX(:,1))
    Fs=find(TraceX(i,:)~=0);
    Xs=nonzeros(TraceX(i,:));
    Ys=nonzeros(TraceY(i,:));
    INTs=nonzeros(TraceINT(i,:));
    for i2=1:length(Fs)
        fxyc(i2,1,i)=Fs(i2);
        fxyc(i2,2,i)=Xs(i2);
        fxyc(i2,3,i)=Ys(i2);
        fxyc(i2,4,i)=3;
        fxyc(i2,5,i)=INTs(i2);
    end
end