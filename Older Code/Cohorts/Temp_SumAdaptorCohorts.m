folder='E:\CME Superfolder\CME Data\180412_SUM_CALM_AP2_GoodData\RedTraces\AP2 CALM';
files=FindFiles(folder,'*Red_FXYCMS.mat').';
for i=[1 2 4 5 6 7 8]
    load(files{i})
    TwoColorCohorts_WithSum(FXYCMS,3);
end