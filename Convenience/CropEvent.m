function crop=CropEvent(x,y,IM,r)
    
    [A,B]=size(IM);
    crop=single(zeros(2*r+1));
    for ix=-r:r
        for iy=-r:r
            if y+iy>0 && y+iy<=A && x+ix>0 && x+ix<=B
                crop(iy+r+1,ix+r+1)=IM(y+iy,x+ix);
            end
        end
    end