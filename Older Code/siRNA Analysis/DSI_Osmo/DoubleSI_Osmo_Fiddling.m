%Cell 1 = wt control
%Cell 2 = wt 3m osmo
%Cell 3 = wt 10m osmo
%Cell 4 = si control
%Cell 5 = si 3m osmo
%Cell 6 = si 10m osmo

clear files
load('DSIOsmo_ThreshData.mat')
%AreaC{2}=Area{2}([3 4],1);
AreaC{2}=Area{2}([3 4 6 7],1);
%AreaC{2}=Area{2}([3 4 6 7 1 2 5],1);
%AreaC{3}=Area{3}([1 3],1);
AreaC{3}=Area{3}([1 3 6],1);
%AreaC{5}=Area{5}([1 4],1);
AreaC{5}=Area{5}([1 4 2 6],1);
%AreaC{5}=Area{5}([1 4 2 6 3 5 7],1);
%AreaC{6}=Area{6}([4 5],1);
AreaC{6}=Area{6}([4 5 1],1);
load('DoubleSIRNA_ManualCytosolData.mat')
AreaC{1}=Area_WT(1:5);
AreaC{4}=Area_SI([1 2 4 5]);

% files{1}{1}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\WT_cont\Movies\wt_cont_020_BS_Red_FXYCMS.mat';
% files{1}{2}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\WT_cont\Movies\wt_cont_074_BS_Red_FXYCMS.mat';
files{1}{1}='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath WT\Movies\wt_006_BS_Red_FXYCMS.mat';
files{1}{2}='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath WT\Movies\wt_012_BS_Red_FXYCMS.mat';
files{1}{3}='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath WT\Movies\wt_014_BS_Red_FXYCMS.mat';
files{1}{4}='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath WT\Movies\wt_016_BS_Red_FXYCMS.mat';
files{1}{5}='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath WT\Movies\wt_018_BS_Red_FXYCMS.mat';


files{2}{1}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\WT_osmo_3m\Movies\wt_osmo_3m_016_BS_Red_FXYCMS.mat';
files{2}{2}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\WT_osmo_3m\Movies\wt_osmo_3m_022_BS_Red_FXYCMS.mat';

files{2}{3}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\WT_osmo_3m\Movies\wt_osmo_3m_076_BS_Red_FXYCMS.mat';
files{2}{4}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\WT_osmo_3m\Movies\wt_osmo_3m_082_BS_Red_FXYCMS.mat';

% files{2}{5}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\WT_osmo_3m\Movies\wt_osmo_3m_004_BS_Red_FXYCMS.mat';
% files{2}{6}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\WT_osmo_3m\Movies\wt_osmo_3m_010_BS_Red_FXYCMS.mat';
% files{2}{7}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\WT_osmo_3m\Movies\wt_osmo_3m_070_BS_Red_FXYCMS.mat';


files{3}{1}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\WT_osmo_10m\Movies\wt_osmo_10m_006_BS_Red_FXYCMS.mat';
files{3}{2}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\WT_osmo_10m\Movies\wt_osmo_10m_018_BS_Red_FXYCMS.mat';

files{3}{3}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\WT_osmo_10m\Movies\wt_osmo_10m_078_BS_Red_FXYCMS.mat';

%No control siRNA movies with very good red signal, so these are from a
%week ago with the same conditions
files{4}{1}='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath SI\Movies\si_024_BS_Red_FXYCMS.mat';
files{4}{2}='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath SI\Movies\si_026_BS_Red_FXYCMS.mat';

files{4}{3}='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath SI\Movies\si_098_BS_Red_FXYCMS.mat';
files{4}{4}='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath SI\Movies\si_102_BS_Red_FXYCMS.mat';

files{5}{1}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\SI_osmo_3m\Movies\si_osmo_3m_028_BS_Red_FXYCMS.mat';
files{5}{2}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\SI_osmo_3m\Movies\si_osmo_3m_046_BS_Red_FXYCMS.mat';

files{5}{3}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\SI_osmo_3m\Movies\si_osmo_3m_034_BS_Red_FXYCMS.mat';
files{5}{4}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\SI_osmo_3m\Movies\si_osmo_3m_058_BS_Red_FXYCMS.mat';

% files{5}{5}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\SI_osmo_3m\Movies\si_osmo_3m_040_BS_Red_FXYCMS.mat';
% files{5}{6}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\SI_osmo_3m\Movies\si_osmo_3m_052_BS_Red_FXYCMS.mat';
% files{5}{7}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\SI_osmo_3m\Movies\si_osmo_3m_064_BS_Red_FXYCMS.mat';


files{6}{1}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\SI_osmo_10m\Movies\si_osmo_10m_048_BS_Red_FXYCMS.mat';
files{6}{2}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\SI_osmo_10m\Movies\si_osmo_10m_054_BS_Red_FXYCMS.mat';

files{6}{3}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\SI_osmo_10m\Movies\si_osmo_10m_030_BS_Red_FXYCMS.mat';

files{7}{1}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\WT_cont\Movies\wt_cont_020_BS_Red_FXYCMS.mat';
files{7}{2}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\WT_cont\Movies\wt_cont_074_BS_Red_FXYCMS.mat';

files{8}{1}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\SI_cont\Movies\si_cont_026_BS_Red_FXYCMS.mat';
files{8}{2}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\SI_cont\Movies\si_cont_032_BS_Red_FXYCMS.mat';
%files{8}{3}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\SI_cont\Movies\si_cont_038_BS_Red_FXYCMS.mat';
%files{8}{4}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\SI_cont\Movies\si_cont_044_BS_Red_FXYCMS.mat';

%%

StackedBars(files{1},files{4},'WT','SI',1,AreaC{1},AreaC{4});
title('Control')
StackedBars(files{2},files{5},'WT','SI',2,AreaC{2},AreaC{5});
title('3 Minutes After Osmotic Shock')
StackedBars(files{3},files{6},'WT','SI',3,AreaC{3},AreaC{6});
title('10 Minutes After Osmotic Shock')

%%
figure
subplot(1,3,1)
InitiationConclusionPlot(files{1},files{4},AreaC{1},AreaC{4});
title('Control')
subplot(1,3,2)
InitiationConclusionPlot(files{2},files{5},AreaC{2},AreaC{5});
title('3 Minutes After Osmotic Shock')
subplot(1,3,3)
InitiationConclusionPlot(files{3},files{6},AreaC{3},AreaC{6});
title('10 Minutes After Osmotic Shock')

subplot(1,3,2)
ylim([0 .2])
subplot(1,3,3)
ylim([0 .2])

%%

sig=1;
YL=[0 .05];
figure
subplot(1,3,1)
[N{1},N{2}]=ConclusionPlot_BySlope(files{1},files{4},AreaC{1},AreaC{4},1,sig,3000,YL);
title('Control')
subplot(1,3,2)
[N{3},N{4}]=ConclusionPlot_BySlope(files{2},files{5},AreaC{2},AreaC{5},0,sig,900,YL);
title('3 Minutes After Osmotic Shock')
subplot(1,3,3)
[N{5},N{6}]=ConclusionPlot_BySlope(files{3},files{6},AreaC{3},AreaC{6},0,sig,900,YL);
title('10 Minutes After Osmotic Shock')

%%

MGFPINT=18400/80;
[Ncwt,Ncsi]=ConclusionMSPlot_BySlope(files{1},files{4},3000,MGFPINT*999/300);
[Ncwt,Ncsi]=ConclusionMSPlot_BySlope(files{2},files{5},900,MGFPINT);
[Ncwt,Ncsi]=ConclusionMSPlot_BySlope(files{3},files{6},900,MGFPINT);

%%

sig=1;
YL=[0 .05];
figure
subplot(1,3,1)
[N{1},N{2}]=InitiationPlot_BySlope(files{1},files{4},AreaC{1},AreaC{4},1,sig,3000,YL);
title('Control')
subplot(1,3,2)
[N{3},N{4}]=InitiationPlot_BySlope(files{2},files{5},AreaC{2},AreaC{5},0,sig,900,YL);
title('3 Minutes After Osmotic Shock')
subplot(1,3,3)
[N{5},N{6}]=InitiationPlot_BySlope(files{3},files{6},AreaC{3},AreaC{6},0,sig,900,YL);
title('10 Minutes After Osmotic Shock')

%%

figure
subplot(1,3,1)
ConclusionVFramePlot_BySlope(files{1},files{4},AreaC{1},AreaC{4});
title('Control')
subplot(1,3,2)
ConclusionVFramePlot_BySlope(files{2},files{5},AreaC{2},AreaC{5});
title('3 Minutes After Osmotic Shock')
subplot(1,3,3)
ConclusionVFramePlot_BySlope(files{3},files{6},AreaC{3},AreaC{6});
title('10 Minutes After Osmotic Shock')

subplot(1,3,1)
ylim([0 .1])
subplot(1,3,2)
ylim([0 .1])
subplot(1,3,3)
ylim([0 .1])

%%

Ys=ConclusionVFramePlot_Timeline(files,AreaC);

%%

Y=ConclusionVHalfPlot(files,AreaC);

%%
figure
subplot(1,3,1)
SpotsPerAreaPlot(files{1},files{4},AreaC{1},AreaC{4});
title('Control')
subplot(1,3,2)
SpotsPerAreaPlot(files{2},files{5},AreaC{2},AreaC{5});
title('3 Minutes After Osmotic Shock')
subplot(1,3,3)
SpotsPerAreaPlot(files{3},files{6},AreaC{3},AreaC{6});
title('10 Minutes After Osmotic Shock')

subplot(1,3,1)
ylim([0 .1])
subplot(1,3,2)
ylim([0 .1])
subplot(1,3,3)
ylim([0 .1])


%%
clear MSD SSD  
[MSD{1}(:,1),SSD{1}(:,1),MSD{1}(:,2),SSD{1}(:,2),slopes{1},slopes{2}]=JoshSlopeHists_SIRNA(files{1},files{4});
[MSD{2}(:,1),SSD{2}(:,1),MSD{2}(:,2),SSD{2}(:,2),slopes{3},slopes{4}]=JoshSlopeHists_SIRNA(files{2},files{5});
[MSD{3}(:,1),SSD{3}(:,1),MSD{3}(:,2),SSD{3}(:,2),slopes{5},slopes{6}]=JoshSlopeHists_SIRNA(files{3},files{6});

%%
%Plot Josh slope histograms
V=-.08:.002:.08;
used=[2:40 42:80];
%used=[2:75];
figure
for i=1:6
H{i}=hist(slopes{i},V);
H{i}=H{i}/sum(H{i});
end
plot(V(used),H{1}(used),'b')
hold on
plot(V(used),H{2}(used),'r')
hold on
plot(V(used),H{3}(used),'b--')
hold on
plot(V(used),H{4}(used),'r--')
hold on
plot(V(used),H{5}(used),'b:')
hold on
plot(V(used),H{6}(used),'r:')
hold on
L={'WT Cells Before Osmoshock','SI Cells Before Osmoshock','WT Cells 3 minutes post Osmoshock','SI Cells 3 minutes post Osmoshock','WT Cells 10 minutes post Osmoshock','SI Cells 10 minutes post Osmoshock'};
legend(L)
xlabel('Growth Rate')
ylabel('Frequency')
%%
%Plot Josh slope hists in semilog to show negative tails
V=-.08:.002:-.02;
figure
for i=1:6
H{i}=hist(slopes{i},V);
H{i}=H{i}/sum(H{i});
end
semilogy(V(2:end-1),H{1}(2:end-1),'b')
hold on
semilogy(V(2:end-1),H{2}(2:end-1),'r')
hold on
semilogy(V(2:end-1),H{3}(2:end-1),'b--')
hold on
semilogy(V(2:end-1),H{4}(2:end-1),'r--')
hold on
semilogy(V(2:end-1),H{5}(2:end-1),'b:')
hold on
semilogy(V(2:end-1),H{6}(2:end-1),'r:')
hold on
L={'WT Cells Before Osmoshock','SI Cells Before Osmoshock','WT Cells 3 minutes post Osmoshock','SI Cells 3 minutes post Osmoshock','WT Cells 10 minutes post Osmoshock','SI Cells 10 minutes post Osmoshock'};
legend(L)
xlabel('Growth Rate')
ylabel('Frequency')

%%
MasterSlaveDataOverview(files{1},files{4})
MasterSlaveDataOverview(files{2},files{5})
MasterSlaveDataOverview(files{3},files{6})

%%

CohortBoxplots(files{1},files{4})

%%
files{1}{1}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\WT_cont\Movies\wt_cont_020_BS_Red_FXYCMS.mat';
files{1}{2}='E:\CME Superfolder\CME Data\180723_SUM_CALM_Clath_DSIRNA_Osmo\WT_cont\Movies\wt_cont_074_BS_Red_FXYCMS.mat';

for i=1:6
    load(files{i}{1})
    [MI_P{i},MI_S{i},AC_S_rel{i},~,~]=CompareProductiveVsStalled(FXYCMS,2,3,[1 2 3],1);
    load(files{i}{2})
    [B_P,B_S,B_r,B_pa,B_sa]=CompareProductiveVsStalled(FXYCMS,2,3,[4 5 6],0);
    MI_P{i}=[MI_P{i} B_P];
    MI_S{i}=[MI_S{i} B_S];
    AC_S_rel{i}=[AC_S_rel{i} B_r];
end
L={'Pre Osmo','3 Min Post Osmo','10 Min Post Osmo','Pre Osmo','3 Min Post Osmo','10 Min Post Osmo'};
L2={'Pre Osmo','3 Min Post Osmo','10 Min Post Osmo (No Data)','Pre Osmo','3 Min Post Osmo','10 Min Post Osmo (No Data)'};
R=999/300;
C={MI_P{1},MI_P{2},MI_P{3},MI_S{1},MI_S{2},MI_S{3},MI_P{4}/R,MI_P{5},MI_P{6},MI_S{4}/R,MI_S{5},MI_S{6}};
figure
BoxPlotCell(C)

Cs={MI_S{1},MI_S{2},MI_S{3},MI_S{4}/R,MI_S{5},MI_S{6}};
Cp={MI_P{1},MI_P{2},[0],MI_P{4}/R,MI_P{5},[0]};
figure
subplot(1,2,1)
BoxPlotCell(Cs)
xticklabels(L)
xtickangle(30)
title('WT Cells                                           CALM siRNA Cells')
YL=ylim;
line([3.5 3.5],YL);
ylabel('CALM content of stalled pits')
subplot(1,2,2)
BoxPlotCell(Cp)
xticklabels(L2)
xtickangle(30)
title('WT Cells                                           CALM siRNA Cells')
ylim(YL)
YL=ylim;
line([3.5 3.5],YL);
ylabel('CALM content of productive pits')

for i=1:6
C2{i}=AC_S_rel{i};
end
figure

BoxPlotCell(C2)
title('WT Cells                                 CALM siRNA Cells')
xticklabels(L)
xtickangle(30)
ylabel('CALM to clathrin ratio in stalled stuctures (relative to productive structures)')
YL=ylim;
line([3.5 3.5],YL);
for i=1:6
C3{i}=MI_S{i}/median(MI_P{i});
end
figure
BoxPlotCell(C3)
title('WT Cells                                 CALM siRNA Cells')
ylabel('CALM content of stalled stuctures (relative to productive structures)')
xticklabels(L)
xtickangle(30)
YL=ylim;
line([3.5 3.5],YL);

%%
FSFig
for i=1:6
    subplot(2,3,i)
    [CALMperArea{i}]=TotalCALMIntensityPerArea(files{i},AreaC{i});
    if i==1 || i==4
        for i2=1:length(CALMperArea{i})
            CALMperArea{i}{i2}=CALMperArea{i}{i2}/999*300;
        end
    end
    for i2=1:length(CALMperArea{i})
        plot(CALMperArea{i}{i2})
        hold on
    end
end

%%
clear AC SDC Nc
FrameGap=2;
MaxFrame=151;
Tmast=1000;
Tslave=0;
MinLTF=30/FrameGap;

% for i0=1:6
%     figure
%     if i0==1 || i0==4
%         N=999/300;
%     else
%         N=1;
%     end
%     for i=1:length(files{i0})
%         load(files{i0}{i})
%         [AC{i0}(i,:),t]=PlotAverageConclusions(FXYCMS,Tmast,MinLTF,FrameGap);
%         subplot(1,5,i)
%         plot(t(1:9),AC{i0}(i,1:9)/N)
%     end
% end

L={'Control, Pre-Omso','Control, 3-min Post-Osmo','Control, 10-min Post-Osmo','siRNA, Pre-Omso','siRNA, 3-min Post-Osmo','siRNA, 10-min Post-Osmo'};
figure
%RM=[7 2 3 8 5 6];  %All osmo day data
RM=[1 2 3 4 5 6];   %Control data from control day --better data, but different intensity scaling
for i00=1:6
    subplot(2,3,i00)
    i0=RM(i00);
    if i0==1 || i0==4
        N=999/300;
    else
        N=1;
    end
    for i=1:length(files{i0})
        load(files{i0}{i})
        [AC{i0}(i,:),t,SDC{i0}(i,:),Nc{i0}(i)]=PlotAverageConclusions(FXYCMS,Tmast,MinLTF,FrameGap);
%         figure(i+5)
%         plot(t(1:9),AC{i0}(i,1:9)/N)
    end
%     figure(1)
    Nt=StatCell_Fancy(Nc,@sum);
    mAC{i0}=mean(AC{i0});
    plot(t(1:9),mAC{i0}(1:9)/N)
    title(strcat(L{i00},'. N= ',num2str(Nt(i0))))
end

%%
clear AC SDC Nc TCell TF
FrameGap=2;
MaxFrame=151;
Tmast=1000;
Tslave=0;
MinLTF=30/FrameGap;
AverageZeros=1;  %Whether average trace should average zeros for ended traces

% for i0=1:6
%     figure
%     if i0==1 || i0==4
%         N=999/300;
%     else
%         N=1;
%     end
%     for i=1:length(files{i0})
%         load(files{i0}{i})
%         [AC{i0}(i,:),t]=PlotAverageConclusions(FXYCMS,Tmast,MinLTF,FrameGap);
%         subplot(1,5,i)
%         plot(t(1:9),AC{i0}(i,1:9)/N)
%     end
% end

L={'Control, Pre-Omso','Control, 3-min Post-Osmo','Control, 10-min Post-Osmo','siRNA, Pre-Omso','siRNA, 3-min Post-Osmo','siRNA, 10-min Post-Osmo'};

%RM=[7 2 3 8 5 6];  %All osmo day data
RM=[1 2 3 4 5 6];   %Control data from control day --better data, but different intensity scaling
for i00=1:6

    i0=RM(i00);
    if i0==1 || i0==4 
        N=999/300;
    else
        N=1;
    end
    if isempty(FXYCMS_Good{i0})
        for i=1:length(files{i0})
            load(files{i0}{i})
            [AC{i0}(i,:),t,SDC{i0}(i,:),Nc{i0}(i),TCell{i0}{i},TF{i0}{i}]=PlotAverageConclusion_Traces(FXYCMS,Tmast,MinLTF,FrameGap,AverageZeros);
            %         figure(i+5)
            %         plot(t(1:9),AC{i0}(i,1:9)/N)
        end
    else
        [AC{i0}(1,:),t,SDC{i0}(1,:),Nc{i0}(1),TCell{i0}{1},TF{i0}{1}]=PlotAverageConclusion_Traces(FXYCMS_Good{i0},Tmast,MinLTF,FrameGap,AverageZeros);
    end
%     figure(1)
    Nt=StatCell_Fancy(Nc,@sum);
    mAC{i0}=mean(AC{i0},1);
    figure(1)
    subplot(2,3,i00)
    plot(t,mAC{i0}/N)
    xlim([0 105])
    title(strcat(L{i00},'. N= ',num2str(Nt(i0))))
    if i0~=3 && i0~=6
        figure(2)
        plot(t,mAC{i0}/N)
        hold on
        xlim([0 200])
    end
    
    figure(2+i00)
    PlotCellTraces(TCell{i0},TF{i0},FrameGap)
end
figure(2)
legend('Control Pre-Osmo','Control 3 min Post-Omso','siRNA Pre-Osmo','siRNA 3 min Post-Omso')
