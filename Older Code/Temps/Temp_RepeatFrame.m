exp_name='E:\CME Superfolder\CME Data\171004_Beads_LinearExposure';

tmpd = dir(fullfile(exp_name,'*.tif'));

for i0=1:length(tmpd)    
    movies{i0} = fullfile(exp_name,tmpd(i0).name);
    IM{i0}=imread(movies{i0});
    for i=1:4
    imwrite(IM{i0},movies{i0},'Writemode','append','Compression','none')
    end
end
