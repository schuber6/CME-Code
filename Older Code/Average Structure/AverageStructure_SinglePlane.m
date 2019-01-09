function [AS,num]=AverageStructure_SinglePlane(f,xs,ys,file,N)
%Get gaussian fit parameters from area around (y,x) in frame f of file
% c(1) = 5x5 sum
% c(2) = outside ring of 7x7 sum (background)
% c(3) = (1)/25-(2)/(49-25)
%c(4)= 7x7 sum

IM=imread(file,'Index',f);
AS=zeros(N);
num=0;
for i0=1:length(xs)
    x=xs(i0);
    y=ys(i0);
Window=N;
[Y,X]=size(IM);
clear IMc
Edge=false;
for i=1:Window
    for i2=1:Window
        if y+i-ceil(Window/2)>0 && y+i-ceil(Window/2)<=Y && x+i2-ceil(Window/2)>0 && x+i2-ceil(Window/2)<=X
            IMc(i,i2)=IM(y+i-(ceil(Window/2)),x+i2-(ceil(Window/2)));
        else
            Edge=true;
        end
    end
end
if ~Edge
AS=AS+double(IMc);
num=num+1;
end


end