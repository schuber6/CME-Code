function c=FitSlave5(f,x,y,file,back)
%Get gaussian fit parameters from area around (y,x) in frame f of file
% c(1) = background
% c(2) = amplitude
% c(3) = x center
% c(4) = y center
% c(5) = sx
% c(6) = sy
% c(7) = theta
% c(8) = 5 pixel Window sum intensity (minus background)

Window=5;
IM=imread(file,'Index',f);
[Y,X]=size(IM);
for i=1:Window
    for i2=1:Window
        if y+i-ceil(Window/2)>0 && y+i-ceil(Window/2)<=Y && x+i2-ceil(Window/2)>0 && x+i2-ceil(Window/2)<=X
            IMc(i,i2)=IM(y+i-(ceil(Window/2)),x+i2-(ceil(Window/2)));
        end
    end
end
[A,B]=size(IMc);
SUM=sum(sum(IMc))-back*A*B;
c = twoDgaussianFittingUnConstrained(IMc);
c(8)=SUM;