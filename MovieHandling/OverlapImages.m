function [SIM1,SIM2]=OverlapImages(IM1,IM2,shift_x,shift_y)

[a,b]=size(IM1);
if round(shift_y)<=0
    starty=1;
    finishy=a+round(shift_y);
else
    starty=1+round(shift_y);
    finishy=a;
end
if round(shift_x)>=0
    startx=1+round(shift_x);
    finishx=b;
else
    startx=1;
    finishx=b+round(shift_x);
end
% SIM1=IM1(1:end+round(shift_y),round(shift_x):end);
SIM1=IM1(starty:finishy,startx:finishx);
IM3 = imtranslate(IM2,[shift_x,shift_y],'outputview','same');
%SIM2=IM3(1:end+round(shift_y),round(shift_x):end);
SIM2=IM3(starty:finishy,startx:finishx);