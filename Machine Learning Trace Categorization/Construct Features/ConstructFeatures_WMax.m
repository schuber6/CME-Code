function [X,yBeg,yEnd]=ConstructFeatures_WMax(Data)

NBins=20;
X=zeros(length(Data),NBins+3);
yBeg=zeros(length(Data),1);
yEnd=zeros(length(Data),1);
for i=1:length(Data)
    X(i,1)=1;
    trace=Data(i).A;
    X(i,2)=length(trace);
    X(i,3)=max(trace);
    STrace=ScottifyTrace(trace,NBins);
    X(i,4:end)=STrace;
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
LN=max(X(:,3));
X(:,2)=X(:,3)/LN;
% ID=X(:,3:end);
% M=mean(ID(:));
% X(:,3:end)=X(:,3:end)-M;
AN=max(max(X(:,4:end)));
X(:,4:end)=X(:,4:end)/AN;
