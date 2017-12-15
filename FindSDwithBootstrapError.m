function [SD,Error]=FindSDwithBootstrapError(Data)

B=1000;
SDB=zeros(1,B);
N=length(Data);
SD=sqrt(var(Data));
for i=1:B
    BData=zeros(1,N);
    for i2=1:N
        BData(i2)=Data(ceil(rand*N));
    end
    SDB(i)=sqrt(var(BData));
end
Error=sqrt(var(SDB));