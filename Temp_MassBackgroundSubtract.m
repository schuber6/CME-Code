
omd = fullfile(exp_name,'orig_movies');
tmpd = dir(fullfile(omd,'*.tif'));

for i=1:length(tmpd)
    movies{i} = fullfile(omd,tmpd(i).name);
    
end
for i=1:length(movies)
    BackgroundSubtract(movies{i}(1:end-4),back);
end