function [xL,xR]=FindFWeMBoundaries(Ys,norm,varargin)


if nargin==2
    value=exp(-1);
else
    value=varargin{1};
end
if norm
    Ys=(Ys-min(Ys))/(max(Ys)-min(Ys));
end
xq=1:.01:length(Ys);
yq=interp1(1:length(Ys),Ys,xq);
iL=find(yq>=value,1,'first');
iR=find(yq>=value,1,'last');
xL=xq(iL);
xR=xq(iR);

