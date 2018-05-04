folder='E:\CME Superfolder\CME Data\180412_SUM_CALM_AP2_GoodData\RedTraces\AP2 CALM';
files=FindFiles(folder,'*.mat').';
for i0=1:1
load(files{1});

Before=1:120;
Dividers=[1 61];
NumCohorts=5;
FrameGap=3;
CohortEdges=30:(90/NumCohorts):120;
CohortEdgesF=CohortEdges/FrameGap;
xbinsAC=-2:.25:4;
Nbins=20;

BM=cell(1,NumCohorts);
BS=cell(1,NumCohorts);
BAC=cell(1,NumCohorts);

MF=MaxFrameFXYCMS(FXYCMS);
[Mints,Sints]=SeparateTracesByCohort_FXYCMS(FXYCMS,CohortEdgesF,1,[3],0,MF);

figure
for i=1:length(Mints)
    subplot(1,2,1)
    MMIs=StatCell(Mints{i},'median');
    t=(1:length(MMIs))*FrameGap;
    plot(t,MMIs)
    hold on
    title('Average AP2 Traces')
    xlabel('Time (s)')
    subplot(1,2,2)
    MSIs=StatCell(Sints{i},'median');
    plot(t,MSIs)
    hold on
    title('Average CALM Traces')
    xlabel('Time (s)')
    L{i}=strcat(num2str(CohortEdges(i)),'-',num2str(CohortEdges(i+1)),'s Cohort: N=',num2str(length(Mints{i}{1})));
end
subplot(1,2,1)
legend(L)
subplot(1,2,2)
legend(L)
end
% for i=Before
%     for i2=1:length(LTs{i})
%         for i3=1:NumCohorts
%             if LTs{i}(i2)*FrameGap>=CohortEdges(i3) && LTs{i}(i2)*FrameGap<CohortEdges(i3+1)
%                 BM{i3}=[BM{i3} MIs{i}(i2)];
%                 BS{i3}=[BS{i3} SIs{i}(i2)];
%                 BAC{i3}=[BAC{i3} log(MIs{i}(i2)/SIs{i}(i2))];
%             end
%         end
%     end
% end
% 
% for i=1:NumCohorts
%     Stacked1(i,:)=[3 NumCohorts i+2*NumCohorts];
%     Stacked2(i,:)=[3 NumCohorts i+1*NumCohorts];
%     Stacked3(i,:)=[3 NumCohorts i];
% end
% [ArObj,xbinsM]=DrawHistCohortAreas(BM,Nbins,Stacked1,1,1);
% [ArObj,xbinsS]=DrawHistCohortAreas(BS,Nbins,Stacked2,1,1);
% [ArObj]=DrawHistCohortAreas(BAC,xbinsAC,Stacked3,1,1);