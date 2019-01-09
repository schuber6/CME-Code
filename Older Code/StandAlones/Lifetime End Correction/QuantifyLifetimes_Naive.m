function LTs=QuantifyLifetimes_Naive(FXYCMS,FrameGap)

LTs=[];
MF=MaxFrameFXYCMS(FXYCMS);
for i=1:length(FXYCMS)
    fxyc=FXYCMS{i};
    if fxyc(1,4)==3 || (fxyc(1,4)==5 || (fxyc(1,4)==6 || length(fxyc(:,1))==MF))
        LTs=[LTs FrameGap*length(fxyc(:,1))];
    end
end