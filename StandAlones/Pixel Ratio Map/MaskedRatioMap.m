function RM=MaskedRatioMap(IM1,IM2,thresh)
%make map of IM1/IM2, only considering pixels where IM2>thresh

mask=IM2>thresh;
[a,b]=size(IM1);
RM=zeros(a,b);
for ix=1:a
    for iy=1:b
        if mask(ix,iy)~=0
            RM(ix,iy)=IM1(ix,iy)/IM2(ix,iy);
        end
    end
end