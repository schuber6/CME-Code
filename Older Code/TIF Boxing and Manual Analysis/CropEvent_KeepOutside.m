function crop=CropEvent_KeepOutside(x,y,IM,r)
    
    [A,B]=size(IM);
    crop=single(zeros(size(IM)));
    for ix=1:B
        for iy=1:A
            if abs(y-iy)<=r && abs(x-ix)<=r
                crop(iy,ix)=IM(iy,ix);
            end
        end
    end