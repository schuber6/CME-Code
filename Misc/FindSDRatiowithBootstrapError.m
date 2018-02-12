function [SDr,Error,SDrCheck]=FindSDRatiowithBootstrapError(Data1,Data2)

B=1000;
SDB=zeros(1,B);
N1=length(Data1);
N2=length(Data2);
SDr=sqrt(var(Data1))/sqrt(var(Data2));
h=waitbar(0,'Bootstrapping Error');
for i=1:B
    waitbar(i/B)
    BData1=zeros(1,N1);
    for i2=1:N1
        BData1(i2)=Data1(ceil(rand*N1));
    end
    BData2=zeros(1,N2);
    for i2=1:N2
        BData2(i2)=Data2(ceil(rand*N2));
    end
    SDrB(i)=sqrt(var(BData1))/sqrt(var(BData2));
end
Error=sqrt(var(SDrB));
SDrCheck=mean(SDrB);
close(h)