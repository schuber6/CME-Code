exp_name='E:\CME Superfolder\CME Data\170816_LifeactCyclo';
omd = fullfile(exp_name);
tmpd = dir(fullfile(omd,'*.tif'));
oddback=fullfile(omd,tmpd(1).name);
evenback=fullfile(omd,tmpd(1).name);
for i=24:26
    movie = fullfile(omd,tmpd(i).name(1:end));
    oddnew=strcat(movie(1:end-4),'_AP2_BS.tif');
    evennew=strcat(movie(1:end-4),'_Lifeact_BS.tif');
    %BackgroundSubtract(movie,back);
    SplitChannelsBackgroundSubtract(movie,oddnew,evennew,oddback,evenback)
end