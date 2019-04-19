function [Match,Lag,MSQE]=FindBestExtrapolation(INT,fxycS,varargin)

if length(varargin)==0
    AllowIncrease=1;
else
    AllowIncrease=varargin{1};
end
for i=1:length(fxycS)
    L(i)=length(fxycS(i).Splits);
end
unsplit=find(L<=1 & [fxycS.class]==3);
SQEs=zeros(1,length(unsplit))+inf;
Lags=zeros(1,length(unsplit))-1;
Decreasing=zeros(1,length(unsplit));
for i=1:length(unsplit)
    if length(fxycS(unsplit(i)).int)>=length(INT)
        INT2=fxycS(unsplit(i)).int;
        [Lags(i),SQEs(i)]=AlignTraces(INT2,INT);
        Before=INT2(1:Lags(i)-1);
        After=INT2(Lags(i)+length(INT)+1:end);
        if (isempty(Before) || max(Before)<=INT(1)) ...
                && (isempty(After) || max(After)<=INT(end))
            Decreasing(i)=1;
        end
    end
end
if AllowIncrease
    [S,ind]=min(SQEs);
    if S==inf
        Match=[];
        Lag=-1;
        MSQE=inf;
        return
    end
else
    used=find(Decreasing==1);
    if isempty(used) || min(SQEs(used))==inf
        Match=[];
        Lag=-1;
        MSQE=inf;
        return
    end
    S=min(SQEs(used));
    ind=find(SQEs==S & Decreasing==1);
    ind=ind(1);
end
Match=fxycS(unsplit(ind)).int;
Lag=Lags(ind);
MSQE=S;
