clear all
%exp_name='E:\CME Superfolder\CME Data\170905_Analysis\orig_movies';
exp_name='E:\CME Superfolder\CME Data\170518_Analsis_GFP\orig_movies\170519_Data';

omd=fullfile(exp_name);
tmpd = dir(fullfile(omd,'*MS.mat'));
for i=1:length(tmpd)
    movies{i} = fullfile(omd,tmpd(i).name);
    load(movies{i})
    figure
    PlotAverageTraceFXYCMS_BothAligned(fxycMS)
    %title(tmpd(i).name)
end