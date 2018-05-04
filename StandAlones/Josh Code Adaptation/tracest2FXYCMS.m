clear movieRed movieGreen
i0=2;
file{1}='E:\CME Superfolder\CME Data\180412_SUM_CALM_AP2_GoodData\RedTraces\AP2 CALM\nosirna_tracest_manual.mat';
file{2}='E:\CME Superfolder\CME Data\180412_SUM_CALM_AP2_GoodData\RedTraces\AP2 CALM\sirna_tracest_manual.mat';
file{3}='E:\CME Superfolder\CME Data\180412_SUM_CALM_AP2_GoodData\RedTraces\AP2 CALM\sirna_tracest_Green_manual.mat';
load(file{i0})
Templatefxyc=[];
for i=1:length(tracest)
    for i2=1:length(tracest(i).frame)
        Templatefxyc(i2,1,i)=tracest(i).frame(i2);
        Templatefxyc(i2,2,i)=tracest(i).xpos(i2);
        Templatefxyc(i2,3,i)=tracest(i).ypos(i2);
        Templatefxyc(i2,4,i)=3;
        Templatefxyc(i2,5,i)=tracest(i).int(i2);
    end
end
movieRed{1}='E:\CME Superfolder\CME Data\180409_SUM_CALM_AP2_Osmoshock\Isolated Cells\Split Channels\170409_osmo85p_2dt_009_BS_Cell1_Red.tif';
movieGreen{1}='E:\CME Superfolder\CME Data\180409_SUM_CALM_AP2_Osmoshock\Isolated Cells\Split Channels\170409_osmo85p_2dt_009_BS_Cell1_Green.tif';

movieRed{2}='E:\CME Superfolder\CME Data\180329_SUM_CALM_AP2orCLCa_SIRNA\Isolated Cells\Split Channels\ap2_sirna_osmo85p_2dt_50pred_005_BS_Cell1_Red.tif';
movieGreen{2}='E:\CME Superfolder\CME Data\180329_SUM_CALM_AP2orCLCa_SIRNA\Isolated Cells\Split Channels\ap2_sirna_osmo85p_2dt_50pred_005_BS_Cell1_Green.tif';
[FXYCMS]=GenerateMasterSlaveINTs_PixelSum(Templatefxyc,movieGreen{i0},0,movieRed{i0});
fileMS{1}='E:\CME Superfolder\CME Data\180412_SUM_CALM_AP2_GoodData\RedTraces\AP2 CALM\nosirna_tracest_manual_FXYCMS.mat';
fileMS{2}='E:\CME Superfolder\CME Data\180412_SUM_CALM_AP2_GoodData\RedTraces\AP2 CALM\sirna_tracest_manual_FXYCMS.mat';
fileMS{3}='E:\CME Superfolder\CME Data\180412_SUM_CALM_AP2_GoodData\RedTraces\AP2 CALM\sirna_tracest_manual_Green_FXYCMS.mat';
save(fileMS{i0},'FXYCMS')

%%

figure
for i=1:length(FXYCMS)
    A=FXYCMS{i};
    subplot(2,5,i)
%plot(A(:,5),'b')
%hold on
plot(A(:,6),'r')
hold on
plot(A(:,7),'g')
end