function LT=AverageLifetime(fxyc,varargin)

if length(varargin)==0
    Stalled=0;
else
    Stalled=varargin{1};
end

if Stalled==0
    used=find(fxyc(1,4,:)==3);
else
    L=zeros(1,length(fxyc(1,1,:)));
    for i=1:length(L)
        L(i)=length(nonzeros(fxyc(:,1,i)));
    end
    a=fxyc(1,4,:)==3;
    used=find(a(:) | L(:)>=100);
end
LTs=zeros(1,length(used));
for i=1:length(used)
    LTs(i)=length(nonzeros(fxyc(:,1,used(i))));
end
LT=mean(LTs);