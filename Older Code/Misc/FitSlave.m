function c=FitSlave(f,x,y,file)
%Get gaussian fit parameters from area around (y,x) in frame f of file

Window=8;
IM=imread(file,'Index',f);
[Y,X]=size(IM);
for i=1:Window
    for i2=1:Window
        if y+i-ceil(Window/2)>0 && y+i-ceil(Window/2)<=Y && x+i2-ceil(Window/2)>0 && x+i2-ceil(Window/2)<=X
            IMc(i,i2)=IM(y+i-(ceil(Window/2)),x+i2-(ceil(Window/2)));
        end
    end
end
c = twoDgaussianFittingUnConstrained(IMc);