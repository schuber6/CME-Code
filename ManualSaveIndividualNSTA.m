%omd = fullfile(exp_name,'movies');
movies{1}='170628_001';
movies{2}='170628_002';
movies{3}='170628_003';
movies{4}='170628_004';
movies{5}='170721_Control003';
for i=1:length(nsta)
    
    
    filename=strcat(movies{i},'_NSTA.mat');
    NSTA=nsta{i};
    save(filename,'NSTA')
end