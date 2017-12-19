back='E:\CME Superfolder\CME Data\170613_Deoxy\AVG_background.tif';

back50='E:\CME Superfolder\CME Data\170613_Deoxy\AVG_background_p50.tif';




exp_name='E:\CME Superfolder\CME Data\170613_Deoxy';
omd = fullfile(exp_name);
tmpd = dir(fullfile(omd,'*.tif'));
for i=1:6
    movie = fullfile(omd,tmpd(i).name(1:end-4));
    if i~=2
        BackgroundSubtract(movie,back50);
    else
        BackgroundSubtract(movie,back);
    end
end