function [XBeg,XEnd,yBeg,yEnd]=ConstructFeatures_Ends(Data)

NBins=20;
X=zeros(length(Data),NBins+2);
XBeg=X;
XEnd=X;
yBeg=zeros(length(Data),1);
yEnd=zeros(length(Data),1);
for i=1:length(Data)
    XBeg(i,1)=1;
    XEnd(i,1)=1;
    trace=Data(i).A;
    XBeg(i,2)=length(trace);
    XEnd(i,2)=length(trace);
    if length(trace)<NBins
        pad=zeros(1,NBins-length(trace));
        B=length(trace);
        E=1;
    else
        pad=[];
        B=NBins;
        E=length(trace)-NBins+1;
    end
    XBeg(i,3:end)=[trace(1:B) pad];
    XEnd(i,3:end)=[pad trace(E:end)];
    D=Data(i).Decision;
    if D==1
        yBeg(i)=1;
        yEnd(i)=0;
    end
    if D==2
        yBeg(i)=0;
        yEnd(i)=1;
    end
    if D==3
        yBeg(i)=1;
        yEnd(i)=1;
    end
    if D==4
        yBeg(i)=0;
        yEnd(i)=0;
    end
end
LN=max(XBeg(:,2));
XBeg(:,2)=XBeg(:,2)/LN;
AN=max(max(XBeg(:,3:end)));
XBeg(:,3:end)=XBeg(:,3:end)/AN;

LN=max(XEnd(:,2));
XEnd(:,2)=XEnd(:,2)/LN;
AN=max(max(XEnd(:,3:end)));
XEnd(:,3:end)=XEnd(:,3:end)/AN;
