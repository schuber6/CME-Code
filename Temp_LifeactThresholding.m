
exp_name='E:\CME Superfolder\CME Data\170816_LifeactCyclo';
tmpd = dir(fullfile(exp_name,'*Lifeact_BS.tif'));

for i0=2:2 %1:length(tmpd)
movies{i0} = fullfile(exp_name,tmpd(i0).name);
[SA,V] = spread_cell_thresholding_ByStack(movies{i0},7,0);
end