function [BlebArea,CellArea,BlebCMEDensity,CellCMEDensity,AVBlebCMEDensity,AVCellCMEDensity]=AnalyzeCMEinBlebs(BlebMask,masks,Threshfxyc)

BlebArea(1)=0; %Bleb mask is off by 1 frame--can't find change in area in first frame
for i=1:length(BlebMask(1,1,:))
    BlebArea(i+1)=sum(sum(BlebMask(:,:,i)));
end
for i=1:length(masks(1,1,:))
    CellArea(i)=sum(sum(masks(:,:,i)));
end
h=waitbar(0,'Looking for Pits in Blebs');
for i=1:length(masks(1,1,:))
    waitbar(i/length((masks(1,1,:))))
    XY=FindPresent356s(Threshfxyc,i);
    if ~isempty(XY)
    CellN=length(XY(:,1));
    else
        CellN=0;
    end
    CellCMEDensity(i)=CellN/CellArea(i);
    if i==1
        BlebCMEDensity(i)=0;
    else
        BlebN=0;
       
        if i~=length(masks(1,1,:))
        for i2=1:CellN
            if BlebMask(XY(i2,2),XY(i2,1),i-1)==1
                BlebN=BlebN+1;
            end
        end
        if BlebArea(i)~=0
        BlebCMEDensity(i)=BlebN/BlebArea(i);
        else
            BlebCMEDensity(i)=0;
        end
        end
    end
end
AVCellCMEDensity=sum(CellCMEDensity.*CellArea)/sum(CellArea);
AVBlebCMEDensity=sum(BlebCMEDensity.*BlebArea)/sum(BlebArea);
close(h)
    

