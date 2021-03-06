function [Titles,LTs,MMs,MSs,MIs,SIs,MSratio,MSratioLog,Mslopes,Sslopes]=siRNA_boxplots_F()

folder='E:\CME Superfolder\CME Data\180329_SUM_CALM_AP2orCLCa_SIRNA\Isolated Cells\Split Channels';
filesAP2_SIRNA=FindFiles(folder,'ap2*2dt*Green_FXYCMS*').';
titleM='CALM Intensity';
titleS='AP2 Intensity';
PreRange=1:100;
PostRange=120:220;
MinL=10;
FG=3;
thresh=2500;
Mode='Threes';

ind=1;
Titles{1}='No siRNA control';
%Titles{2}='siRNA control';
Titles{2}='No siRNA osmoshock';
Titles{3}='siRNA control';
Titles{4}='siRNA osmoshock';
LTs=cell(1,8);
MMs=cell(1,8);
MSs=cell(1,8);
MIs=cell(1,8);
SIs=cell(1,8);
MSratio=cell(1,8);
MSratioLog=cell(1,8);
Mslopes=cell(1,8);
Sslopes=cell(1,8);
for i=1:4
    load(filesAP2_SIRNA{i})
    [MIs{ind},SIs{ind}]=FindAllMasterSlaveIntensities_InRange(FXYCMS,PreRange,thresh);
    [MIs{ind+1},SIs{ind+1}]=FindAllMasterSlaveIntensities_InRange(FXYCMS,PostRange,thresh);
    [IndsB,LTs{ind},MMs{ind},MSs{ind}]=FindAll3s_InRange(FXYCMS,PreRange,MinL,thresh);
    [IndsA,LTs{ind+1},MMs{ind+1},MSs{ind+1}]=FindAll3s_InRange(FXYCMS,PostRange,MinL,thresh);
    [Mslopes{ind},Sslopes{ind}]=FindAllJoshSlopes_InRange(FXYCMS,PreRange,thresh);
    [Mslopes{ind+1},Sslopes{ind+1}]=FindAllJoshSlopes_InRange(FXYCMS,PostRange,thresh);
    LTs{ind}=LTs{ind}*3;
    LTs{ind+1}=LTs{ind+1}*3;
    normS=median(MSs{ind});
    MSs{ind}=MSs{ind}/normS;
    MSs{ind+1}=MSs{ind+1}/normS;
    normSI=median(SIs{ind});
    SIs{ind}=SIs{ind}/normSI;
    SIs{ind+1}=SIs{ind+1}/normSI;
    MSratio{ind}=MMs{ind}./MSs{ind};
    MSratio{ind+1}=MMs{ind+1}./MSs{ind+1};
    MSIratio{ind}=MIs{ind}./SIs{ind};
    MSIratio{ind+1}=MIs{ind+1}./SIs{ind+1};
    normR=median(MSratio{ind});
    MSratio{ind}=MSratio{ind}/normR;
    MSratio{ind+1}=MSratio{ind+1}/normR;
    normRI=median(MSIratio{ind});
    MSIratio{ind}=MSIratio{ind}/normRI;
    MSIratio{ind+1}=MSIratio{ind+1}/normRI;
    MSratioLog{ind}=log(MSratio{ind});
    MSratioLog{ind+1}=log(MSratio{ind+1});
    MSIratioLog{ind}=log(MSIratio{ind});
    MSIratioLog{ind+1}=log(MSIratio{ind+1});
    L{ind}=strcat(Titles{(ind-1)/2+1},' Before Treatment');
    L{ind+1}=strcat(Titles{(ind-1)/2+1},' After Treatment');
    ind=ind+2;

end
FSFig
if strcmp(Mode,'Threes')
    subplot(3,2,1)
    StatCell(MMs,'median_boxplot','orientation','horizontal','FactorDirection','list');
    yticklabels(L)
    title('Max CALM Intensity of Traces')
    subplot(3,2,2)
    StatCell(MSs,'median_boxplot','orientation','horizontal','FactorDirection','list');
    yticklabels(L)
    title('Max AP2 Intensity of Traces')
    subplot(3,2,3)
    StatCell(MSratioLog,'median_boxplot','orientation','horizontal','FactorDirection','list');
    yticklabels(L)
    title('log(CALM:AP2 ratio) at Max Intensity')
end
if strcmp(Mode,'AllSpots')
    subplot(2,2,1)
    StatCell(MIs,'median_boxplot','orientation','horizontal','FactorDirection','list','Symbol','');
    yticklabels(L)
    title('CALM Intensity of Spots')
    xlim([0 20000])
    subplot(2,2,2)
    StatCell(SIs,'median_boxplot','orientation','horizontal','FactorDirection','list','Symbol','');
    yticklabels(L)
    title('AP2 Intensity of Spots')
    xlim([0 3])
    subplot(2,2,3)
    StatCell(MSIratioLog,'median_boxplot','orientation','horizontal','FactorDirection','list','Symbol','');
    yticklabels(L)
    title('log(CALM:AP2 ratio)')
    xlim([-1.5 1.5])
end
subplot(3,2,4)
StatCell(LTs,'median_boxplot','orientation','horizontal','FactorDirection','list');
yticklabels(L)
title('Lifetimes (s)')
subplot(3,2,5)
MSTD=StatCell(Mslopes,'stdev');
scatter(MSTD,fliplr(1:length(MSTD)))
yticks(1:length(MSTD))
yticklabels(fliplr(L))
title('CALM Josh Slope St. Devs.')
subplot(3,2,6)
SSTD=StatCell(Sslopes,'stdev');
scatter(SSTD,fliplr(1:length(SSTD)))
yticks(1:length(SSTD))
yticklabels(fliplr(L))
title('AP2 Josh Slope St. Devs.')