clear all
movieR='Z:\Josh\random_movies_from_other_people\TIRF - SIM data_Betzig and Dong Li\COS7 cells\COS7-clathrin_6sec_cycle_time.tif';
file='Z:\Josh\random_movies_from_other_people\TIRF - SIM data_Betzig and Dong Li\COS7 cells\COS7-6s-donuts.mat';
load(file)
tracest=NSTA2Tracest(nsta);
filetst='DonutTST.mat';
save(filetst,'tracest')
combined_analysis_code(movieR,movieR,filetst);

