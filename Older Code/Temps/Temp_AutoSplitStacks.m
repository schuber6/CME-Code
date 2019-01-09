exp_name='E:\CME Superfolder\CME Data\171010_Calibrated_AP2_DNM';
omd = fullfile(exp_name);
tmpd = dir(fullfile(omd,'*.tif'));
for i=[26]
    movie = fullfile(omd,tmpd(i).name(1:end-4));
    SplitStacks(movie,3);
end