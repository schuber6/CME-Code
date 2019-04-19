function [X,Y]=CenterOfIntensity(IM)

[a,b]=size(IM);
Xsum=0;
Ysum=0;
Total=sum(sum(IM));
for ix=1:a
    for iy=1:b
        Xsum=Xsum+iy*IM(ix,iy);
        Ysum=Ysum+ix*IM(ix,iy);
    end
end
X=Xsum/Total;
Y=Ysum/Total;