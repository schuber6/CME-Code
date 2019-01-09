exp_name='E:\CME Superfolder\CME Data\Hydrogel\movies\MaxProj_ForTraCKer';
tmpd = dir(fullfile(exp_name,'*.tif'));
for i=3:length(tmpd)
    i
    movies{i} = fullfile(exp_name,tmpd(i).name);
    TraCKer_2D_subplot(movies{i})
    
end
