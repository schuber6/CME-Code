function c=FitSlave5_fast(f,x,y,file)
%Get gaussian fit parameters from area around (y,x) in frame f of file
% c(1) = 5x5 sum
% c(2) = outside ring of 7x7 sum (background)
% c(3) = (1)/25-(2)/(49-25)
%c(4)= 7x7 sum

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
c(1)=sum(sum(double(IMc)));

Window=7;
clear IMc
for i=1:Window
    for i2=1:Window
        if y+i-ceil(Window/2)>0 && y+i-ceil(Window/2)<=Y && x+i2-ceil(Window/2)>0 && x+i2-ceil(Window/2)<=X
            IMc(i,i2)=IM(y+i-(ceil(Window/2)),x+i2-(ceil(Window/2)));
        end
    end
end
c(4)=sum(sum(double(IMc)));
c(2)=c(4)-c(1);
c(3)=c(1)/25-c(2)/(49-25);
