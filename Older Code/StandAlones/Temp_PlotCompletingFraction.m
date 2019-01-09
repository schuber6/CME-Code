folder='E:\CME Superfolder\CME Data\180412_SUM_CALM_AP2_GoodData\AP2';
files=FindFiles(folder,'*.mat');
figure
for i=1:length(files)
    load(files{i});

    F=CompletingFraction(FXYCMS);
    plot(F)
    hold on
end