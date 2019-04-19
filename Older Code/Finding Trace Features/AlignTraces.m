function [Lag,SQE]=AlignTraces(trace1,trace2)

L1=length(trace1);
L2=length(trace2);
if L1<L2
    shorter=trace1;
    longer=trace2;
end
if L2<L1
    shorter=trace2;
    longer=trace1;
end
if L1==L2
    Lag=0;
    SQE=norm(trace1-trace2)/L1;
    return
end
SQEs=zeros(1,abs(L2-L1)+1);
for i=0:abs(L2-L1)
    SQEs(i+1)=norm(shorter-longer((1:length(shorter))+i))/length(shorter)/mean(shorter);
end
[SQE,Lag]=min(SQEs);
Lag=Lag-1;