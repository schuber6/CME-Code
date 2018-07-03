function [shift_x,shift_y,DM,SIM1,SIM2]=AlignAndMaxXCorr(IM1,IM2,centered)

if ~centered
    dx=2:.1:5; %Shifts to try
    dy=-7:.1:-4;
else
    dx=-2:.1:2;
    dy=-2:.1:2;
end
D=zeros(length(dx),length(dy));

V1=IM1(:);
V2=IM2(:);
m1=mean(V1);
m2=mean(V2);
sd1=sqrt(var(V1));
sd2=sqrt(var(V2));
IM1=(IM1-m1)/sd1;
IM2=(IM2-m2)/sd2;

%h=waitbar(0,'Aligning');
for x=1:length(dx)
    %waitbar(x/length(dx))
    for y=1:length(dy)
        tempIM2 = imtranslate(IM2,[dx(x),dy(y)],'outputview','same');
        R = corrcoef(IM1,tempIM2);
        D(x,y) = R(1,2);
    end
end
%close(h)
[shift_x,shift_y] = find(D==max(max(D)));
shift_x=dx(shift_x);
shift_y=dy(shift_y);
DM=max(max(D));

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