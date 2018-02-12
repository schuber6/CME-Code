function c=FitSlave5_faster_med(f,xs,ys,file)
%Get gaussian fit parameters from area around (y,x) in frame f of file
% c(1) = 5x5 sum
% c(2) = outside ring of 7x7 sum (background)
% c(3) = (1)/25-(2)/(49-25)
%c(4)= 7x7 sum

IM=imread(file,'Index',f);
for i0=1:length(xs)
    x=xs(i0);
    y=ys(i0);
Window=5;
[Y,X]=size(IM);
clear IMc
for i=1:Window
    for i2=1:Window
        if y+i-ceil(Window/2)>0 && y+i-ceil(Window/2)<=Y && x+i2-ceil(Window/2)>0 && x+i2-ceil(Window/2)<=X
            IMc(i,i2)=IM(y+i-(ceil(Window/2)),x+i2-(ceil(Window/2)));
        end
    end
end
c(i0,1)=sum(sum(double(IMc)));

Window=7;
clear IMc
for i=1:Window
    for i2=1:Window
        if y+i-ceil(Window/2)>0 && y+i-ceil(Window/2)<=Y && x+i2-ceil(Window/2)>0 && x+i2-ceil(Window/2)<=X
            if i==1 || i==Window || i2==1 || i2==Window
            IMc(i,i2)=IM(y+i-(ceil(Window/2)),x+i2-(ceil(Window/2)));
            else
                IMc(i,i2)=69;
            end
        end
    end
end
IMv=reshape(IMc,[Window^2 1]);
used=find(IMv~=69);
c(i0,2)=median(IMv(used));
%c(i0,4)=sum(sum(double(IMc)));

%c(i0,2)=c(i0,4)-c(i0,1);
c(i0,3)=c(i0,1)/25-c(i0,2);
end