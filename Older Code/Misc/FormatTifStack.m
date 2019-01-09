exp_name='Z:\YelizTugbaSevde\BSC1_Jasp';
tmpd = dir(fullfile(exp_name));
for i=3:length(tmpd)
    tmpd2 = dir(fullfile(strcat(exp_name,'/',tmpd(i).name)));
    for i2=3:length(tmpd2)
        tmpd3 = dir(fullfile(strcat(exp_name,'/',tmpd(i).name,'/',tmpd2(i2).name),'*.tiff'));
        newfile=strcat(exp_name,'/',tmpd(i).name,'/',tmpd2(i2).name,'.tif');
        for i3=1:length(tmpd3)
            filename=strcat(exp_name,'/',tmpd(i).name,'/',tmpd2(i2).name,'/',tmpd3(i3).name);
            S=length(imfinfo(filename));
            for i4=1:S
            A=imread(filename,'index',i4);
            imwrite(A,newfile,'Writemode','append','Compression','none');
            end
        end
    end
    i
end
exp_name='Z:\YelizTugbaSevde\BSC1_QQN';
tmpd = dir(fullfile(exp_name));
for i=3:length(tmpd)
    %tmpd2 = dir(fullfile(strcat(exp_name,'/',tmpd(i).name)));
    %for i2=3:length(tmpd2)
        tmpd3 = dir(fullfile(strcat(exp_name,'/',tmpd(i).name),'*.tiff'));
        newfile=strcat(exp_name,'/',tmpd(i).name,'.tif');
        for i3=1:length(tmpd3)
            filename=strcat(exp_name,'/',tmpd(i).name,'/',tmpd3(i3).name);
            S=length(imfinfo(filename));
            for i4=1:S
            A=imread(filename,'index',i4);
            imwrite(A,newfile,'Writemode','append','Compression','none');
            end
        end
  
    i
end
