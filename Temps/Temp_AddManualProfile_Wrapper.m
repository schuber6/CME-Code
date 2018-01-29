movie='E:\CME Superfolder\CME Data\170907_CALM_CLCa_1StackOsmo\003_GFP_BS_Stack1.tif';
file='E:\CME Superfolder\CME Data\170907_CALM_CLCa_1StackOsmo\SUM_SingleStacks003_GFP_BS_Stack1.mat';
load(file)
frames=1:7;
NSTA=AddManualZProfiles(NSTA,frames,movie);
PlotRandomZProfiles(NSTA);

