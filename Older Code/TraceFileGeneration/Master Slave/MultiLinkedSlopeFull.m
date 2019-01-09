%exp_name='E:\CME Superfolder\CME Data\Ylis Movies\InidividualNSTAs';
exp_name='E:\CME Superfolder\CME Data\170512_SUM_JaspOsmo';
tmpd = dir(fullfile(exp_name,'*.mat'));
fg=3;

for i0=1:length(tmpd)
    movies{i0} = fullfile(exp_name,tmpd(i0).name);
    load(movies{i0});
    figure
    
        
        
       
        
        %[M{i0}]=LinkedSlopesWrapper(NSTA);
        [~]=LinkedSlopesWrapper(NSTA,fg);
        
    
end