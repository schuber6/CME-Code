function [MedCyt,MedBack]=SpreadCell_CytosolMedian(file)
    
[masks_Cell, Thresh] = spread_cell_thresholding_FirstFrame(file);
[masks_Pits, Thresh] = spread_cell_thresholding_FirstFrame(file);

Cytosol_mask=masks_Cell-masks_Pits;
Cytosol_maskbool=Cytosol_mask>0;
IM=imread(file,'Index',1);
Masked=double(IM).*Cytosol_maskbool(:,:,1);
[a,b]=size(Masked);
MedCyt=median(nonzeros(reshape(Masked,[1 a*b])));

BackMask=~(masks_Cell(:,:,1)>0);
Masked=double(IM).*BackMask;
[a,b]=size(Masked);
MedBack=median(nonzeros(reshape(Masked,[1 a*b])));
