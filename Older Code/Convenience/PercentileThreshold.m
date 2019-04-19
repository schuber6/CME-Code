function IM=PercentileThreshold(IM,p)

[a,b]=size(IM);
thresh=prctile(IM(:),p);
for ix=1:a
    for iy=1:b
        if IM(ix,iy)<thresh
            IM(ix,iy)=0;
        end
    end
end
            