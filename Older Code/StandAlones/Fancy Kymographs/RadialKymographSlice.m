function [Slice]=RadialKymographSlice(IMG,Radius,X,Y)
%Plots average intensity a certain distance from the image's maximum

ma=Y;
mb=X;
Slice=zeros(1,Radius*2+1);
[a,b]=size(IMG);
% [ma,mb]=find(IMG==max(max(IMG)));
Ds=zeros(1,a*b);
Is=zeros(1,a*b);
Side=zeros(1,a*b);
ind=1;
for ix=1:a
    for iy=1:b
        Is(ind)=IMG(ix,iy);
        Ds(ind)=norm([ix-ma iy-mb]);
        Side(ind)=(sign(ix-X)+3)/2;
        ind=ind+1;
    end
end
MD=max(Ds);
%binEdges=0:MD/nbins:MD;
binEdges=[0 min(Ds):(Radius+min(Ds))];
for i=1:length(binEdges)-1
    for s=1:2
        used=find(Ds>binEdges(i) & Ds<=binEdges(i+1) & Side==s);
        if isempty(used)
            used=find(Ds>binEdges(i) & Ds<=binEdges(i+1));
        end
        %xs(i)=mean([binEdges(i) binEdges(i+1)]);
        xs(i,s)=median(Ds(used));
        ys(i,s)=mean(Is(used));
    end
end
for i=1:length(Slice)
    if i<=Radius
        Slice(i)=ys(end-i+1,1);
    end
    if i>=Radius+1
        Slice(i)=ys(i-Radius,2);
    end
end
