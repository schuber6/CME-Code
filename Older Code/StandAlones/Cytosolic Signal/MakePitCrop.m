function IM_crop=MakePitCrop(IMfile,Matfile)
    
    Dist=20;
    Width=Dist*2+1;
    IM_crop=zeros(Width,Width);
    IM=imread(IMfile,'Index',1);
    load(Matfile,'FXYCMS');
    for i=1:length(FXYCMS)
        fxyc=FXYCMS{i};
        if fxyc(1,1)==1 && fxyc(1,6)>=2500 && fxyc(1,7)>=2500
            I=i;
            break
        end
    end
    X=round(fxyc(1,2));
    Y=round(fxyc(1,3));
    [A,B]=size(IM);
    for ix=-Dist:Dist
        for iy=-Dist:Dist
            x=X+ix;
            y=Y+iy;
            if x>0 && x<=B && y>0 && y<=A
                IM_crop(iy+Dist+1,ix+Dist+1)=IM(y,x);
            end
        end
    end
    IM_crop=uint16(IM_crop);
    
    