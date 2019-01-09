Good{1}=[7691 7183 7186 1276 1115 7068 6629 7932 1210 1225];
Good{2}=[929 720 6736 5097 5991 6860 6614 6057 653 7149 5892];
movie{1}='E:\CME Superfolder\CME Data\180409_SUM_CALM_AP2_Osmoshock\Isolated Cells\Split Channels\170409_osmo85p_2dt_009_BS_Cell1_Red.tif';
movie{2}='E:\CME Superfolder\CME Data\180329_SUM_CALM_AP2orCLCa_SIRNA\Isolated Cells\Split Channels\ap2_sirna_osmo85p_2dt_50pred_005_BS_Cell1_Red.tif';
newmovie{1}='E:\CME Superfolder\CME Data\180412_SUM_CALM_AP2_GoodData\RedTraces\AP2 CALM\Nosirna_Good10.tif';
newmovie{2}='E:\CME Superfolder\CME Data\180412_SUM_CALM_AP2_GoodData\RedTraces\AP2 CALM\sirna_Good10.tif';

folder='E:\CME Superfolder\CME Data\180412_SUM_CALM_AP2_GoodData\RedTraces\AP2 CALM';
files=FindFiles(folder,'*.mat').';
for i=1:2
    load(files{i});
    events=[];
    G=Good{i};
    for i2=1:length(G)
        fxyc=FXYCMS{G(i2)};
        for i3=1:length(fxyc(:,1))
            events=[events ; [fxyc(i3,1) fxyc(i3,2) fxyc(i3,3)]];
        end
    end
    BoxEvents(movie{i},newmovie{i},events);
end
