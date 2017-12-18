function SS=ShiftStacks(Movie,zstacks)
%Movie Name should not have .tif at end
%Takes first 8 planes for 10 frames then shifts up by 1 plane, then down
%etc.

Old=strcat(Movie,'.tif');
New=strcat(Movie,'_ShiftedN.tif');
frames=length(imfinfo(Old));

h=waitbar(0,'Background Subtracting');
onoff=0;
count=0;
for i=1:frames
    count=count+1;
    if count>10*zstacks
        count=1;
        onoff=~onoff;
    end
    PN=mod(i,zstacks);
    if PN==0
        PN=zstacks;
    end
    waitbar(i/frames)
    if (onoff==0 && PN<=8) || (onoff==1 && PN>1 && PN<=9)
    A=imread(Old,'Index',i);
    
    imwrite(A,New,'Writemode','append','Compression','none')
    SS(i).frame=i;
    SS(i).count=count;
    SS(i).PN=PN;
    SS(i).onoff=onoff;
    end
    
end
close(h)