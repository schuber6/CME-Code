exp_name='E:\CME Superfolder\CME Data\171010_Calibrated_AP2_DNM';
omd = fullfile(exp_name);
tmpd = dir(fullfile(omd,'*.tif'));
back=fullfile(omd,tmpd(6).name);
for i=1:5
    movie = fullfile(omd,tmpd(i).name(1:end-4));
    BackgroundSubtract(movie,back);
end
back=fullfile(omd,tmpd(7).name);
for i=8:18
    movie = fullfile(omd,tmpd(i).name(1:end-4));
    BackgroundSubtract(movie,back);
end
% back=fullfile(omd,tmpd(17).name);
% for i=4:9
%     movie = fullfile(omd,tmpd(i).name(1:end-4));
%     BackgroundSubtract(movie,back);
% end
% back=fullfile(omd,tmpd(15).name);
% for i=10:14
%     movie = fullfile(omd,tmpd(i).name(1:end-4));
%     BackgroundSubtract(movie,back);
% end