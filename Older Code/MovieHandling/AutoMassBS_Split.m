exp_name='E:\CME Superfolder\CME Data\170905_CALM_CLCa';
omd = fullfile(exp_name);
tmpd = dir(fullfile(omd,'*.tif'));
oddback=fullfile(omd,tmpd(10).name);
evenback=fullfile(omd,tmpd(11).name);
for i=1:7
    movie_min = fullfile(omd,tmpd(i).name(1:end-4));
    movie = fullfile(omd,tmpd(i).name(1:end));
    oddnew=strcat(movie_min,'_GFP_BS.tif');
    evennew=strcat(movie_min,'_RFP_BS.tif');
    SplitChannelsBackgroundSubtract(movie,oddnew,evennew,oddback,evenback)
end