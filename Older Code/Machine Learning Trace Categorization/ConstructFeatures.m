function [X,yBeg,yEnd,varargout]=ConstructFeatures(Data,NBins,varargin)

%NBins=100;
X=zeros(length(Data),NBins+2);
yBeg=zeros(length(Data),1);
yEnd=zeros(length(Data),1);
for i=1:length(Data)
    X(i,1)=1;
    trace=Data(i).A;
    X(i,2)=length(trace);
    STrace=ScottifyTrace(trace,NBins);
    X(i,3:end)=STrace;
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
if length(varargin)==0
    LN=max(X(:,2));
    AN=max(max(X(:,3:end)));
else
    LN=varargin{1};
    AN=varargin{2};
end
X(:,2)=X(:,2)/LN;
X(:,3:end)=X(:,3:end)/AN;
varargout{1}=LN;
varargout{2}=AN;
