function AutoAutoMassBS(exp_name,channels)

%Input folder with a background tif and also some experiment tifs
%This will average the different background channels and then split the
%experiments by channel while background subtracting them
%Make sure your background tif has the word background at its end and no
%other movie does

omd = fullfile(exp_name);
tmpd = dir(fullfile(omd,'*.tif'));
tmpdB = dir(fullfile(omd,'*background.tif'));
if channels==2
AV=AverageBackground(exp_name,fullfile(omd,tmpdB(1).name(1:end)),channels);

for i=1:length(tmpd)
    
    k = findstr(tmpdB(1).name, tmpd(i).name);
    if isempty(k)
        movie_min = fullfile(omd,tmpd(i).name(1:end-4));
        movie = fullfile(omd,tmpd(i).name(1:end));
        oddnew=strcat(movie_min,'_GFP_BS.tif');
        evennew=strcat(movie_min,'_RFP_BS.tif');
        SplitChannelsBackgroundSubtractFromMat(movie,oddnew,evennew,AV);
    end
end
end