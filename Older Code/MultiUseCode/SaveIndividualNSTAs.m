%omd = fullfile(exp_name,'movies');
omd=exp_name;
tmpd = dir(fullfile(omd,'*.tif'));
for i=1:length(tmpd)
    
    filename = fullfile(omd,tmpd(i).name(1:end-4));
    filename=strcat(filename,'_NSTA.mat');
    NSTA=nsta{i};
    save(filename,'NSTA')
end