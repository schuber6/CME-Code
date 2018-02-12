load('E:\CME Superfolder\CME Data\170906_Analysis\orig_movies\005_GFP_BS_fxycMS_prev_medB.mat')
CutoffR=.6;
[GoodData1,BadData1]=PullTraceData_BestCorr(fxycMS,CutoffR,0);
load('E:\CME Superfolder\CME Data\170906_Analysis\orig_movies\005_osmo_GFP_BS_fxycMS_prev_medB.mat')
[GoodData2,BadData2]=PullTraceData_BestCorr(fxycMS,CutoffR,1);
GoodData=[GoodData1 ; GoodData2];
BadData=[BadData1 ; BadData2];
BestCorr_VarNames;
GoodCors=AssembleCorrStruct(GoodData,names);
BadCors=AssembleCorrStruct(BadData,names);