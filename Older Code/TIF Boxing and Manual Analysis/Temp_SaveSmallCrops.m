movie='E:\CME Superfolder\CME Data\ExposureEnhancementData\c14_300_601_crop.tif';
newmovieg='E:\CME Superfolder\CME Data\ExposureEnhancementData\c14_300_601_Good.tif';
newmovieb='E:\CME Superfolder\CME Data\ExposureEnhancementData\c14_300_601_Bad.tif';
SmallWidth=20;
SmallInds=1:SmallWidth;
NF=length(imfinfo(movie));
IM=imread(movie,'Index',1);
[a,b]=size(IM);
Nx=floor(a/SmallWidth);
Ny=floor(b/SmallWidth);
for i=1:2
    IM=imread(movie,'Index',i);
    Group=mod(i,2);
    for ix=1:Nx
        for iy=1:Ny
            crop=IM(SmallInds+(ix-1)*SmallWidth,SmallInds+(iy-1)*SmallWidth);
            if Group
                imwrite(crop,newmovieg,'Writemode','append','Compression','none')
            else
                imwrite(crop,newmovieb,'Writemode','append','Compression','none')
            end
        end
    end
end
    
