for i=1:length(tracks)
    NF(i)=length(tracks(i).f);
    MA(i)=max(tracks(i).A);
end
% figure
% hist(NF,100)
Full=find(NF>50 & MA>4000);
% FSFig
% for i=1:25
%     subplot(5,5,i)
%     R=ceil(rand*length(Full));
%     I=Full(R);
%     plot(tracks(I).A)
% end
Threshfxyc=[];
for i=1:length(Full)
    F=tracks(Full(i)).f;
    X=tracks(Full(i)).x;
    Y=tracks(Full(i)).y;
    C=zeros(1,NF(Full(i)))+3;
    A=tracks(Full(i)).A;
    for i2=1:length(F)
    Threshfxyc(i2,1,i)=F(i2);
    Threshfxyc(i2,2,i)=X(i2);
    Threshfxyc(i2,3,i)=Y(i2);
    Threshfxyc(i2,4,i)=C(i2);
    Threshfxyc(i2,5,i)=A(i2);
    end
end
