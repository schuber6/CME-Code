path='E:\CME Superfolder\CME Data\comb_run_Test\comb_run_old';
files=FindFiles(strcat(path,'\orig_movies'),'*.tif');
fg=[1 3 6 1 3 6 1 3 6];
thresh=20;
sectionsize=100;
comb_run(path,fg,thresh,sectionsize);