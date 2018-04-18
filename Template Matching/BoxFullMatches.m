Bad=find(Dist100V>=Cutoff | Dist100V==0);
NumBad=length(Bad);
Kept=find(Dist100V<Cutoff & Dist100V>0);
NumKept=length(Kept);
Full=find(ML(Kept)-TL(Kept)<=TL(Kept)*.3);
NumFull=length(Full);
Partial=find(ML(Kept)-TL(Kept)>TL(Kept)*.3);
NumPartial=length(Partial);


movie{1}='E:\CME Superfolder\CME Data\180409_SUM_CALM_AP2_Osmoshock\Isolated Cells\Split Channels\170409_osmo85p_2dt_009_BS_Cell1_Red.tif';
movie{2}='E:\CME Superfolder\CME Data\180329_SUM_CALM_AP2orCLCa_SIRNA\Isolated Cells\Split Channels\ap2_sirna_osmo85p_2dt_50pred_005_BS_Cell1_Red.tif';
newmovie{1}='E:\CME Superfolder\CME Data\180412_SUM_CALM_AP2_GoodData\RedTraces\AP2 CALM\Nosirna_GoodTemps.tif';
newmovie{2}='E:\CME Superfolder\CME Data\180412_SUM_CALM_AP2_GoodData\RedTraces\AP2 CALM\sirna_GoodTemps.tif';

events=[];
for i=1:length(Full)

    I=Kept(Full((i)));
    fxyc=TraceFXY{I};
    for i=1:length(fxyc(:,1))
        events=[events ; [fxyc(:,1) fxyc(:,2) fxyc(:,3)]];
    end
end

BoxEvents(movie{2},newmovie{2},events);
