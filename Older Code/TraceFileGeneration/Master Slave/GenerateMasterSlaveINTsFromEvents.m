function [SlaveINT,MasterINT]=GenerateMasterSlaveINTsFromEvents(Threshfxyc,fileSlave,eventsFXYC)
%Takes fxyc data, slave movie, and intensity threshold and generates INT
%cells

GoodT=unique(eventsFXYC(:,4));
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