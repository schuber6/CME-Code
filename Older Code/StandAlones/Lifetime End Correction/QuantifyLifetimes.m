function LTs=QuantifyLifetimes(FXYCMS,FrameGap)

LTs=[];
for i=1:length(FXYCMS)
    fxyc=FXYCMS{i};
    if fxyc(1,4)==3
        LTs=[LTs FrameGap*length(fxyc(:,1))];
    end
end