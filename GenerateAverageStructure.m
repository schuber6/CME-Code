function [AS]=GenerateAverageStructure(NSTA,file,Mp,thresh)
%Makes NxN average image of the area around a localization
Background=0;
N=7;

GoodC=find([NSTA.class]==0);
GoodT=[];
for i=1:length(GoodC)
    if max(NSTA(GoodC(i)).int)>=thresh
        GoodT=[GoodT GoodC(i)];
    end
end
%h=waitbar(0,'Fitting Slave Channel');


for i=1:length(GoodT)
    NSTAgood(i)=NSTA(GoodT(i));
    for i2=1:length(NSTA(GoodT(i)).frame)
        
        xf=NSTA(GoodT(i)).xpos(i2);
        yf=NSTA(GoodT(i)).ypos(i2);
        xs(i,i2)=round(xf);
        ys(i,i2)=round(yf);
        fs(i,i2)=NSTA(GoodT(i)).frame(i2);
        ps(i,i2)=round(NSTA(GoodT(i)).st(i2));
    end
end
AS=zeros(N);
num=0;
for i=1:max(max(fs))
    %waitbar(1/max(max(fs)))
    [usedx,usedy]=find(fs==i);
    if ~isempty(usedx)
        clear subps subxs subys
    for i2=1:length(usedx)
        subps(i2)=ps(usedx(i2),usedy(i2));
        subxs(i2)=xs(usedx(i2),usedy(i2));
        subys(i2)=ys(usedx(i2),usedy(i2));
    end
    
    [ASs,n]=AverageStructure_SingleFrame(i,subps,Mp,subxs,subys,file,N);
    num=num+n;
    AS=AS+ASs;
    
%     for i2=1:length(usedx)
%         NSTAgood(usedx(i2)).Slave5x5(usedy(i2))=cs(i2,1);
%         NSTAgood(usedx(i2)).SlaveRing(usedy(i2))=cs(i2,2);
%         NSTAgood(usedx(i2)).SlaveBS(usedy(i2))=cs(i2,3);
%        NSTAgood(usedx(i2)).Slave7x7(usedy(i2))=cs(i2,4);
%     end
    end
end
AS=AS/num;
        
%         NSTAgood(i).Slave5x5(i2)=c(1);
%         NSTAgood(i).SlaveRing(i2)=c(2);
%         NSTAgood(i).SlaveBS(i2)=c(3);
%         NSTAgood(i).Slave7x7(i2)=c(4);
%         NSTAgood(i).SlaveBack(i2)=c(1);
%         NSTAgood(i).SlaveInt(i2)=c(2);
%         NSTAgood(i).SlaveX(i2)=c(3);
%         NSTAgood(i).SlaveY(i2)=c(4);
%         NSTAgood(i).SlaveSX(i2)=c(5);
%         NSTAgood(i).SlaveSY(i2)=c(6);
%         NSTAgood(i).SlaveTheta(i2)=c(7);
%         NSTAgood(i).SlaveSumInt(i2)=c(8);
        
    
%     NSTAgoodT(i)=NSTAgood(i);
%     clear NSTAgood

%close(h)