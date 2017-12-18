function [SlaveINT,MasterINT]=GenerateMasterSlaveINTs(Threshfxyc,fileSlave,MasterThresh)
%Takes fxyc data, slave movie, and intensity threshold and generates INT
%cells

GoodC=find(Threshfxyc(1,4,:)==3);
GoodT=[];
for i=1:length(GoodC)
    if max(Threshfxyc(:,5,GoodC(i)))>=MasterThresh
        GoodT=[GoodT GoodC(i)];
    end
end
h=waitbar(0,'Fitting Slave Channel');
for i=1:length(GoodT)
    waitbar(i/length(GoodT))
    used=find(Threshfxyc(:,1,GoodT(i)));
    for i2=1:length(used)
        MasterINT{i}(i2)=Threshfxyc(used(i2),5,GoodT(i));
        x=round(Threshfxyc(used(i2),2,GoodT(i)));
        y=round(Threshfxyc(used(i2),3,GoodT(i)));
        f=Threshfxyc(used(i2),1,GoodT(i));
        c=FitSlave(f,x,y,fileSlave);
        SlaveINT{i}(i2,:)=c;
    end
end
close(h)