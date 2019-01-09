function [X,y,varargout]=ConstructFeatures_Trip(Data,NBins,varargin)

%NBins=100;
X=zeros(length(Data),NBins+2);
y=zeros(length(Data),3);
for i=1:length(Data)
    X(i,1)=1;
    trace=Data(i).A;
    X(i,2)=length(trace);
    STrace=ScottifyTrace(trace,NBins);
    X(i,3:end)=STrace;
    D=Data(i).Decision;
    if D<4
    y(i,D)=1;
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
