function [fxyc,ind]=FindClosestTrace(fxy,FXYCMS)

minD=3;
fxyc=[];
ind=0;
for i=1:length(FXYCMS)
    t=FXYCMS{i};
    I=find(t(:,1)==fxy(1));
    if ~isempty(I)
        D=norm([t(I(1),2)-fxy(2) t(I(1),3)-fxy(3)]);
        if D<minD
            minD=D;
            fxyc=t;
            ind=i;
        end
    end
end