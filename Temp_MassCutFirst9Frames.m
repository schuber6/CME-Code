fol='E:\CME Superfolder\CME Data\170424_SUM_Osmoshock80';
omd = fullfile(exp_name,'orig_movies');
tmpd = dir(fullfile(omd,'*.tif'));
for i=1:length(tmpd)
    movies{i} = fullfile(omd,tmpd(i).name);
    First9Frames(movies{i});
    
end