function [xs,ys]=RadialDistancePlot(IMG,nbins)
%Plots average intensity a certain distance from the image's maximum

[a,b]=size(IMG);
[ma,mb]=find(IMG==max(max(IMG)));
Ds=zeros(1,a*b);
Is=zeros(1,a*b);
ind=1;
for ix=1:a
    for iy=1:b
        Is(ind)=IMG(ix,iy);
        Ds(ind)=norm([ix-ma iy-mb]);
        ind=ind+1;
    end
end
MD=max(Ds);
%binEdges=0:MD/nbins:MD;
binEdges=0:min([20 max(Ds)]);
for i=1:length(binEdges)-1
    used=find(Ds>=binEdges(i) & Ds<binEdges(i+1));
    %xs(i)=mean([binEdges(i) binEdges(i+1)]);
    xs(i)=median(Ds(used));
    ys(i)=median(Is(used));
end