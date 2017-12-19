exp_name='E:\CME Superfolder\CME Data\170520_ZstackAnalysis';

omd = fullfile(exp_name);
tmpd = dir(fullfile(omd,'*.tif'));
oddback='E:\CME Superfolder\CME Data\170518_Analysis\AVG_170520_background_GFP.tif';
evenback='E:\CME Superfolder\CME Data\170518_Analysis\AVG_170520_background_RFP.tif';
for i=1:length(tmpd)
    movie = fullfile(omd,tmpd(i).name);
    oddnew = strcat(movie(1:end-4),'_GFP_BS_10X.tif');
    evennew = strcat(movie(1:end-4),'_RFP_BS_10X.tif');
    for i2=1:10
    SplitChannelsBackgroundSubtract(movie,oddnew,evennew,oddback,evenback)
    end
end