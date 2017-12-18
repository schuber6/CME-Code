function [List,FracAbove]=HistSlave5x5s(N)

num=0;
for i=1:length(N)
    num=num+length(N(i).Slave5x5);
end
List=zeros(1,num);
num2=0;
for i=1:length(N)
    for i2=1:length(N(i).Slave5x5)
        num2=num2+1;
        List(num2)=N(i).Slave5x5(i2);
    end
end
used=find(List>5000);
FracAbove=length(used)/length(List);
xbins=1:1000;
xbins=xbins/1000*100000;
figure
H=hist(List,xbins);
plot(xbins(1:end-1),H(1:end-1))
xlim([0 100000])