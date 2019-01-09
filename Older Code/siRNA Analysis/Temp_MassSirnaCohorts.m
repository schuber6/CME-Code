FSFig
for i=1:length(order)
    load(filessi{order(i)})
FXYCMS_Sel=SelectSmallOnes(FXYCMS);
subplot(5,5,i)
TwoColorCohorts_OnePlot(FXYCMS,3,0)

end

folder='E:\CME Superfolder\CME Data\180409_SUM_CALM_AP2_Osmoshock\Isolated Cells\Split Channels';
files=FindFiles(folder,'170409*009*Red_FXYCMS*');
for i=1:length(files)
    load(files{i})
    FXYCMS_Sel=SelectSmallOnes(FXYCMS);
    subplot(5,5,24)
    TwoColorCohorts_OnePlot(FXYCMS,3,0)
end

folder='E:\CME Superfolder\CME Data\180409_SUM_CALM_AP2_Osmoshock\Isolated Cells\Split Channels';
files=FindFiles(folder,'170409*003*Red_FXYCMS*');
for i=1:length(files)
    load(files{i})
    FXYCMS_Sel=SelectSmallOnes(FXYCMS);
    subplot(5,5,25)
    TwoColorCohorts_OnePlot(FXYCMS,3,0)

end