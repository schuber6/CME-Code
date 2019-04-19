%path='E:\CME Superfolder\CME Data\190111_Analysis\100ms\TestMovie3';
path='E:\CME Superfolder\CME Data\comb_run_Test';
files=FindFiles(strcat(path,'\orig_movies'),'*.tif');
fg=[1 3 6 1 3 6 1 3 6];
thresh=20;
sectionsize=100;
comb_run_2019(path,fg,thresh,sectionsize);

%%

path='E:\CME Superfolder\CME Data\comb_run_Test';
files=FindFiles(strcat(path,'\orig_movies'),'*.tif');
fg=[1 3 6 1 3 6 1 3 6];
thresh=20;
sectionsize=100;
comb_run_2019(path,fg,thresh,sectionsize);

%%

path='E:\CME Superfolder\CME Data\comb_run_Test\SingleTest';
fg=6;
thresh=20;
sectionsize=200;
comb_run_2019(path,fg,thresh,sectionsize);