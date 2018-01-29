function List=FindFiles(folder,reg)

exp_name=folder;
tmpd = dir(fullfile(exp_name,reg));
for i=1:length(tmpd)
    List{i} = fullfile(exp_name,tmpd(i).name);
end