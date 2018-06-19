function [AC,SmallAC]=Autocorrellation(IM,ROI)


AC=xcorr2(IM-mean(IM(:)));
[a,b]=size(AC);
if ROI>=floor((min(a,b)-1)/2)
    ROI=floor((min(a,b)-1)/2);
end
centery=ceil(a/2);
centerx=ceil(b/2);
SmallAC=AC(centery-ROI:centery+ROI,centerx-ROI:centerx+ROI);
