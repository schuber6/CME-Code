function crop=CropEvent(x,y,IM,r)
    
    crop=zeros(2*r+1);
    for ix=-r:r
        for iy=-r:r
            crop(iy+r+1,ix+r+1)=IM(y+iy,x+ix);
        end
    end