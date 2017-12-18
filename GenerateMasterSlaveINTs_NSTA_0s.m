function [NSTAgoodT]=GenerateMasterSlaveINTs_NSTA_0s(NSTA,fileSlave,MasterThresh,Mp)
%Takes fxyc data, slave movie, and intensity threshold and generates INT
%cells
Background=0;
GoodC=find([NSTA.class]==0);
GoodT=[];
for i=1:length(GoodC)
    if max(NSTA(GoodC(i)).int)>=MasterThresh
        GoodT=[GoodT GoodC(i)];
    end
end
h=waitbar(0,'Fitting Slave Channel');


for i=1:length(GoodT)
    waitbar(i/length(GoodT))
    
    NSTAgood(i)=NSTA(GoodT(i));
    for i2=1:length(NSTA(GoodT(i)).frame)
        
        xf=NSTA(GoodT(i)).xpos(i2);
        yf=NSTA(GoodT(i)).ypos(i2);
        x=round(xf);
        y=round(yf);
        f=NSTA(GoodT(i)).frame(i2);
        p=round(NSTA(GoodT(i)).st(i2));
        c=FitSlave5_3d_adj_fast(f,p,Mp,x,y,fileSlave);
        NSTAgood(i).Slave5x5(i2)=c(1);
        NSTAgood(i).SlaveRing(i2)=c(2);
        NSTAgood(i).SlaveBS(i2)=c(3);
        NSTAgood(i).Slave7x7(i2)=c(4);
%         NSTAgood(i).SlaveBack(i2)=c(1);
%         NSTAgood(i).SlaveInt(i2)=c(2);
%         NSTAgood(i).SlaveX(i2)=c(3);
%         NSTAgood(i).SlaveY(i2)=c(4);
%         NSTAgood(i).SlaveSX(i2)=c(5);
%         NSTAgood(i).SlaveSY(i2)=c(6);
%         NSTAgood(i).SlaveTheta(i2)=c(7);
%         NSTAgood(i).SlaveSumInt(i2)=c(8);
        
    end
    NSTAgoodT(i)=NSTAgood(i);
    clear NSTAgood
end
close(h)