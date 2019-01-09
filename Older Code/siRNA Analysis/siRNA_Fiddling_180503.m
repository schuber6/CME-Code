folder='E:\CME Superfolder\CME Data\180420_SUM_CALM_AP2_SIRNA\Isolated Cells\Split Channels';
files=FindFiles(folder,'*FXYCMS.mat').';
FSFig
for i0=1:length(files)
    load(files{i0})
    FXYC_Large=SelectLargeOnes(FXYCMS);
    NLarge(i0)=length(FXYC_Large);
    R=ceil(rand*NLarge(i0));
    fxyc=FXYC_Large{R};
    subplot(5,5,i0)
    plot(fxyc(:,6),'r')
    hold on
    plot(fxyc(:,7),'g')
end

%%
clear ACS ACC
folder='E:\CME Superfolder\CME Data\180420_SUM_CALM_AP2_SIRNA\Isolated Cells\Split Channels';
files=FindFiles(folder,'*FXYCMS.mat').';
CohortEdgesF=10:5:40;
for i=1:length(CohortEdgesF)-1
    C=CohortEdgesF;
    L{i}=strcat(num2str(C(i)),'-',num2str(C(i+1)),'s Cohort');
end
L{length(C)}='Stalled Structures';
MeanMast=[];
MeanSlave=[];
for i0=1:length(files)
    load(files{i0})
    FXYC_Large=SelectLargeOnes(FXYCMS);
    FXYC_Small=SelectSmallOnes(FXYCMS);
    [Mints,Sints]=SeparateTracesByCohort_FXYCMS(FXYCMS,CohortEdgesF,1,[3],0,100);
    for i=1:length(FXYC_Large)
        MeanMC(length(C))=[MeanMast mean(FXYC_Large{i}(:,6))];
        MeanSC(length(C))=[MeanSlave mean(FXYC_Large{i}(:,7))];
    end
    for i=1:length(Mints)
        MeanMC(i)=mean(StatCell(Mints{i},'mean'));
        MeanSC(i)=mean(StatCell(Sints{i},'mean'));
    end

ACC(i0,:)=MeanMC./MeanSC;
figure
bar(mean(ACC(i0,:)))
xticklabels(L)
ylabel('Average AP2:CALM Ratio')
end


