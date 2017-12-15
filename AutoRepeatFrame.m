function AutoRepeatFrame(exp_name,num)

omd = fullfile(exp_name);
tmpd = dir(fullfile(omd,'*.tif'));
for i=1:length(tmpd)
    movies{i} = fullfile(omd,tmpd(i).name);
    newfile=strcat(movies{i}(1:end-4),'Repeat.tif');
    A=imread(movies{i},'Index',1);
    for i2=1:num
    imwrite(A,newfile,'Writemode','append','Compression','none')
    end
end