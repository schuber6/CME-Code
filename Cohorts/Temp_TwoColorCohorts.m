folder='E:\CME Superfolder\CME Data\180412_SUM_CALM_AP2_GoodData\RedTraces';
files=FindFiles(folder,'*.mat');
load(files{2});

Before=1:120;
Dividers=[1 61];
NumCohorts=4;
FrameGap=3;
CohortEdges=30:(120/NumCohorts):150;
xbinsAC=-2:.25:4;
Nbins=20;

BM=cell(1,NumCohorts);
BS=cell(1,NumCohorts);
BAC=cell(1,NumCohorts);

[MIs,SIs,LTs,~,~]=ListAll3sByFrame_MovieSections(FXYCMS,6,Dividers);

figure
for i=1:length(MIs)
    MMIs=StatCell(MIs{i},'median');
    plot(MMIs)
    hold on
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