function [X,yBeg,yEnd]=ConstructFeatures_Dist(Data)

NBins=20;
NBinsD=1;
X=zeros(length(Data),NBins+NBinsD+2);
yBeg=zeros(length(Data),1);
yEnd=zeros(length(Data),1);
for i=1:length(Data)
    X(i,1)=1;
    trace=Data(i).A;
    Dist=Data(i).Dist;
    X(i,2)=length(trace);
    STrace=ScottifyTrace(trace,NBins);
    SDist=ScottifyDist(Dist,NBinsD);
    X(i,3:NBins+2)=STrace;
    X(i,NBins+3:end)=SDist;
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
% X(:,2)=X(:,2)-mean(X(:,2));
LN=max(X(:,2));
X(:,2)=X(:,2)/LN;
% ID=X(:,3:end);
% M=mean(ID(:));
% X(:,3:end)=X(:,3:end)-M;
AN=max(max(X(:,3:NBins+2)));
X(:,3:NBins+2)=X(:,3:NBins+2)/AN;
AN=max(max(X(:,NBins+3:end)));
X(:,NBins+3:end)=X(:,NBins+3:end)/AN;
