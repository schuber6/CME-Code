exp_name='E:\CME Superfolder\CME Data\170831_Analysis\orig_movies';
tmpd = dir(fullfile(exp_name,'*.mat'));
fg=1;
for i0=1:length(tmpd)

    movies{i0} = fullfile(exp_name,tmpd(i0).name);
    
    load(movies{i0});
    [SD(i0),M(i0)]=LifetimeStatistics(Threshfxyc,fg);
end
% exp_name='E:\CME Superfolder\CME Data\170831_Analysis';
% tmpd = dir(fullfile(exp_name,'*.mat'));
% fg=1;
% for i0=1:length(tmpd)
% 
%     movies{i0} = fullfile(exp_name,tmpd(i0).name);
%     
%     load(movies{i0});
%     [SD(i0),M(i0)]=LifetimeStatistics(fxyc,fg);
% end

exp_name='E:\CME Superfolder\CME Data\170301_Data_Analysis\orig_movies';
tmpd = dir(fullfile(exp_name,'*.mat'));
fg=3;
for i0=15:27

    movies{i0} = fullfile(exp_name,tmpd(i0).name);
    
    load(movies{i0});
    [SDc(i0),Mc(i0)]=LifetimeStatistics(Threshfxyc,fg);
end