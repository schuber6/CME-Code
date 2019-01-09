% Simple example movie

load('Z:\Useful Code\point_and_click_trace_analysis\Example Data (Start here)\d1_2dt_control001_BS_Cell1_AP2.mat')
tracest=fxyc2Tracest(Threshfxyc);
movie='Z:\Useful Code\point_and_click_trace_analysis\Example Data (Start here)\d1_2dt_control001_BS_Cell1_AP2.tif';
filetst='Test_d1.mat';
save(filetst,'tracest')
combined_analysis_code(movie,movie,filetst);

%% Example 2-color movie

clear all
file='Z:\Useful Code\point_and_click_trace_analysis\Example Data\control_001_BS_Cell1_Red_FXYCMS.mat';
movieR='Z:\Useful Code\point_and_click_trace_analysis\Example Data\control_001_BS_Cell1_Red.tif';
movieG='Z:\Useful Code\point_and_click_trace_analysis\Example Data\control_001_BS_Cell1_Green.tif';
load(file)
filetst='Z:\Useful Code\point_and_click_trace_analysis\Example Data\MS_tst.mat';
%tracest=EmptyTracest();
tracest=FXYCMS2Tracest(FXYCMS);
save(filetst,'tracest')
combined_analysis_code(movieR,movieG,filetst);

%% Example TIRF-SIM movie

clear all
movieR='Z:\Josh\random_movies_from_other_people\TIRF - SIM data_Betzig and Dong Li\COS7 cells\COS7-clathrin_6sec_cycle_time.tif';
file='Z:\Josh\random_movies_from_other_people\TIRF - SIM data_Betzig and Dong Li\COS7 cells\COS7-6s-donuts.mat';
load(file)
tracest=NSTA2Tracest(nsta);
filetst='DonutTST.mat';
save(filetst,'tracest')
combined_analysis_code(movieR,movieR,filetst);


