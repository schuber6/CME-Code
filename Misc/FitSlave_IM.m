function c=FitSlave_IM(x,y,IM)
%Get gaussian fit parameters from area around (y,x) in frame f of file

Window=8;

[Y,X]=size(IM);
for i=1:Window
    for i2=1:Window
        if y+i-floor(Window/2)>0 && y+i-floor(Window/2)<=Y && x+i2-floor(Window/2)>0 && x+i2-floor(Window/2)<=X
            IMc(i,i2)=IM(y+i-floor(Window/2),x+i2-floor(Window/2));
        end
    end
end
c = twoDgaussianFittingUnConstrained(IMc);