exp_name='E:\CME Superfolder\CME Data\170518_Analysis';
omd = fullfile(exp_name);
tmpd = dir(fullfile(omd,'*.tif'));
for i=4:8
    oddback=fullfile(omd,tmpd(32).name);
    evenback=fullfile(omd,tmpd(33).name);
    movie = fullfile(omd,tmpd(i).name);
    oddnew=strcat(movie(1:end-4),'GFP_BS.tif');
    evennew=strcat(movie(1:end-4),'RFP_BS.tif');
    SplitChannelsBackgroundSubtract(movie,oddnew,evennew,oddback,evenback)
end
for i=12:19
    oddback=fullfile(omd,tmpd(34).name);
    evenback=fullfile(omd,tmpd(35).name);
    movie = fullfile(omd,tmpd(i).name);
    oddnew=strcat(movie(1:end-4),'GFP_BS.tif');
    evennew=strcat(movie(1:end-4),'RFP_BS.tif');
    SplitChannelsBackgroundSubtract(movie,oddnew,evennew,oddback,evenback)
end
for i=23:31
    oddback=fullfile(omd,tmpd(36).name);
    evenback=fullfile(omd,tmpd(37).name);
    movie = fullfile(omd,tmpd(i).name);
    oddnew=strcat(movie(1:end-4),'GFP_BS.tif');
    evennew=strcat(movie(1:end-4),'RFP_BS.tif');
    SplitChannelsBackgroundSubtract(movie,oddnew,evennew,oddback,evenback)
end