function [xL,xR]=FindFWHMBoundaries(Ys,norm)

if norm
    Ys=(Ys-min(Ys))/(max(Ys)-min(Ys));
end
xq=1:.01:length(Ys);
yq=interp1(1:length(Ys),Ys,xq);
iL=find(yq>=.5,1,'first');
iR=find(yq>=.5,1,'last');
xL=xq(iL);
xR=xq(iR);

