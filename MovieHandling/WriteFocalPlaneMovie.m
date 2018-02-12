function WriteFocalPlaneMovie(file)
    %Takes only first 5 3rd planes of 5 plane movie and writes them to a file with
    %"FocalPlane" suffix
    
    newfile=strcat(file(1:end-4),'_FocalPlane.tif');
    for i=1:5
        IM=imread(file,'Index',3+(i-1)*5);
        imwrite(IM,newfile,'Writemode','append','Compression','none')
    end