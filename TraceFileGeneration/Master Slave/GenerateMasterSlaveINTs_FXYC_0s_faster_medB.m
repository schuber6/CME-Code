function [fxycMS]=GenerateMasterSlaveINTs_FXYC_0s_faster_medB(fxyc,fileSlave,MasterThresh,fileMaster)
%Takes fxyc data, slave movie, and intensity threshold and generates INT
%cells

Background=0;
GoodC=find([fxyc(1,4,:)]~=4);
GoodT=[];
for i=1:length(GoodC)
    if max(fxyc(:,5,GoodC(i)))>=MasterThresh
        GoodT=[GoodT GoodC(i)];
    end
end
h=waitbar(0,'Fitting Slave Channel');


for i=1:length(GoodT)
    fxycMS(:,:,i)=fxyc(:,:,GoodT(i));
    Frames=find(fxyc(:,1,GoodT(i)));
    for i2=1:length(Frames)
        
        xf=fxyc(Frames(i2),2,GoodT(i));
        yf=fxyc(Frames(i2),3,GoodT(i));
        xs(i,i2)=round(xf);
        ys(i,i2)=round(yf);
        fs(i,i2)=fxyc(Frames(i2),1,GoodT(i));
        
    end
end
for i=1:max(max(fs))
    waitbar(1/max(max(fs)))
    [usedx,usedy]=find(fs==i);
    if ~isempty(usedx)
        clear subps subxs subys
    for i2=1:length(usedx)
        
        subxs(i2)=xs(usedx(i2),usedy(i2));
        subys(i2)=ys(usedx(i2),usedy(i2));
    end
    
    cs=FitSlave5_faster_med(i,subxs,subys,fileSlave);
    for i2=1:length(usedx)
        fxycMS(usedy(i2),7,usedx(i2))=cs(i2,1);
        %NSTAgood(usedx(i2)).SlaveRing(usedy(i2))=cs(i2,2);
        fxycMS(usedy(i2),6,usedx(i2))=cs(i2,3);
        fxycMS(usedy(i2),8,usedx(i2))=cs(i2,2);
    end
    cs=FitSlave5_faster_med(i,subxs,subys,fileMaster);
    for i2=1:length(usedx)
        fxycMS(usedy(i2),10,usedx(i2))=cs(i2,1);
        %NSTAgood(usedx(i2)).SlaveRing(usedy(i2))=cs(i2,2);
        fxycMS(usedy(i2),9,usedx(i2))=cs(i2,3);
        fxycMS(usedy(i2),11,usedx(i2))=cs(i2,2);
    end
    end
end
        
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

close(h)