Templatefxyc=[];
for i=1:length(Full)

    I=Kept(Full((i)));
    fxyc=TraceFXY{I};
    for i2=1:length(fxyc(:,1))
        Templatefxyc(i2,1,i)=fxyc(i2,1);
        Templatefxyc(i2,2,i)=fxyc(i2,2);
        Templatefxyc(i2,3,i)=fxyc(i2,3);
        Templatefxyc(i2,4,i)=3;
        Templatefxyc(i2,5,i)=1;
    end
end

movieRed='E:\CME Superfolder\CME Data\180329_SUM_CALM_AP2orCLCa_SIRNA\Isolated Cells\Split Channels\ap2_sirna_osmo85p_2dt_50pred_005_BS_Cell1_Red.tif';
movieGreen='E:\CME Superfolder\CME Data\180329_SUM_CALM_AP2orCLCa_SIRNA\Isolated Cells\Split Channels\ap2_sirna_osmo85p_2dt_50pred_005_BS_Cell1_Green.tif';
[FXYCMS]=GenerateMasterSlaveINTs_PixelSum(Templatefxyc,movieGreen,0,movieRed);