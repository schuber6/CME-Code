clear all
MinLT=10;
MinInt=1000;
folderwt='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath WT\Movies';
foldersi='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath SI\Movies';
folderdsi='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath SI Low CALM\Movies';
fileswt=FindFiles(folderwt,'*Red*.mat');
filessi=FindFiles(foldersi,'*Red*.mat');
filesdsi=FindFiles(folderdsi,'*Red*.mat');

tempsi{1}=filesdsi{5};
tempsi{2}=filesdsi{6};
tempdsi{1}=filessi{5};
filessi{5}=tempsi{1};
filessi{6}=tempsi{2};
filesdsi{5}=tempdsi{1};
inds=[1 2 3 4 5 7];
for i=1:6
    tfilesdsi{i}=filesdsi{inds(i)};
end
filesdsi=tfilesdsi;

for i=1:length(filessi)
    load(filessi{i})
    [FXYCMS_Sel_si{i},LTs_si{i},MMs_si{i},MSs_si{i}]=SelectSmallOnes(FXYCMS,MinLT);
    [MI_si{i},SI_si{i},~]=SelectFirstFrameEvents(FXYCMS,MinInt);
end
for i=1:length(fileswt)
    load(fileswt{i})
    [FXYCMS_Sel_wt{i},LTs_wt{i},MMs_wt{i},MSs_wt{i}]=SelectSmallOnes(FXYCMS,MinLT);
    [MI_wt{i},SI_wt{i},~]=SelectFirstFrameEvents(FXYCMS,MinInt);
end
for i=1:length(filesdsi)
    load(filesdsi{i})
    [FXYCMS_Sel_dsi{i},LTs_dsi{i},MMs_dsi{i},MSs_dsi{i}]=SelectSmallOnes(FXYCMS,MinLT);
    [MI_dsi{i},SI_dsi{i},~]=SelectFirstFrameEvents(FXYCMS,MinInt);
end

[MSDwt,SSDwt]=CalculateJoshSlopeSDs_FXYCMS(fileswt);
[MSDsi,SSDsi]=CalculateJoshSlopeSDs_FXYCMS(filessi);
[MSDdsi,SSDdsi]=CalculateJoshSlopeSDs_FXYCMS(filesdsi);

LTsi=StatCell(LTs_si,'median');
LTwt=StatCell(LTs_wt,'median');
MMsi=StatCell(MMs_si,'median');
MMwt=StatCell(MMs_wt,'median');
MSsi=StatCell(MSs_si,'median');
MSwt=StatCell(MSs_wt,'median');

LTdsi=StatCell(LTs_dsi,'median');
MMdsi=StatCell(MMs_dsi,'median');
MSdsi=StatCell(MSs_dsi,'median');

MIsi=StatCell(MI_si,'median');
MIwt=StatCell(MI_wt,'median');
MIdsi=StatCell(MI_dsi,'median');
SIsi=StatCell(SI_si,'median');
SIwt=StatCell(SI_wt,'median');
SIdsi=StatCell(SI_dsi,'median');

%%
% LTdsi=LTdsi(6:7);
% MMdsi=MMdsi(6:7);
% MSdsi=MSdsi(6:7);
% MSDdsi=MSDdsi(6:7);

%%
FrameRate=2;
figure
subplot(2,2,1)
notBoxPlot([MSwt MSsi MSdsi], [zeros(1,length(MSwt)) zeros(1,length(MSsi))+1 zeros(1,length(MSdsi))+2])
xticklabels({'WT','SI','DSI'})
ylabel('Median CALM Intensity')
subplot(2,2,2)
notBoxPlot([MMwt MMsi MMdsi], [zeros(1,length(MSwt)) zeros(1,length(MSsi))+1 zeros(1,length(MSdsi))+2])
xticklabels({'WT','SI','DSI'})
ylabel('Median Clathrin Intensity')
subplot(2,2,3)
notBoxPlot([LTwt*FrameRate LTsi*FrameRate LTdsi*FrameRate], [zeros(1,length(MSwt)) zeros(1,length(MSsi))+1 zeros(1,length(MSdsi))+2])
xticklabels({'WT','SI','DSI'})
ylabel('Median Lifetime (s)')
subplot(2,2,4)
notBoxPlot([MSDwt MSDsi MSDdsi], [zeros(1,length(MSwt)) zeros(1,length(MSsi))+1 zeros(1,length(MSdsi))+2])
xticklabels({'WT','SI','DSI'})
ylabel('Clathrin Slope Standard Deviation')

%%
load('DoubleSIRNA_ManualCytosolData.mat')
CBS_DSI=CBS_DSI([1 3 4 5 6 7 8]);
MWT=median(CBS_WT);
figure
subplot(2,2,1)
scatter([CBS_SI CBS_DSI]/MWT,[MSsi MSdsi]/median(MSwt))
%xticklabels({'WT','SI','DSI'})
ylabel('Median CALM Intensity')
subplot(2,2,2)
scatter([CBS_SI CBS_DSI]/MWT,[MMsi MMdsi]/median(MMwt))
ylabel('Median Clathrin Intensity')
subplot(2,2,3)
scatter([CBS_SI CBS_DSI]/MWT,[LTsi LTdsi]/median(LTwt))
ylabel('Median Lifetime')
subplot(2,2,4)
scatter([CBS_SI CBS_DSI]/MWT,[MSDsi MSDdsi]/median(MSDwt))
ylabel('Clathrin Slope Standard Deviation')

%%
load('DoubleSIRNA_ManualCytosolData.mat')
CBS_DSI=CBS_DSI([1 3 4 5 6 7 8]);
MWT=median(CBS_WT);
MIWT=median(MIwt);
figure
subplot(2,2,1)
scatter([MIsi MIdsi]/MIWT,[MSsi MSdsi]/median(MSwt))
%xticklabels({'WT','SI','DSI'})
ylabel('Median CALM Intensity')
subplot(2,2,2)
scatter([MIsi MIdsi]/MIWT,[MMsi MMdsi]/median(MMwt))
ylabel('Median Clathrin Intensity')
subplot(2,2,3)
scatter([MIsi MIdsi]/MIWT,[LTsi LTdsi])
ylabel('Median Lifetime')
subplot(2,2,4)
scatter([MIsi MIdsi]/MIWT,[MSDsi MSDdsi])
ylabel('Clathrin Slope Standard Deviation')

%%

% figure
% subplot(3,2,1)
% notBoxPlot([MIwt MIsi MIdsi], [zeros(1,length(MSwt)) zeros(1,length(MSsi))+1 zeros(1,length(MSdsi))+2])
% xticklabels({'WT','SI','DSI'})
% ylabel('Median Clathrin Intensity')
% subplot(3,2,2)
% notBoxPlot([SIwt SIsi SIdsi], [zeros(1,length(MSwt)) zeros(1,length(MSsi))+1 zeros(1,length(MSdsi))+2])
% xticklabels({'WT','SI','DSI'})
% ylabel('Median CALM Intensity')
% subplot(3,2,3)
% notBoxPlot([MSwt MSsi MSdsi], [zeros(1,length(MSwt)) zeros(1,length(MSsi))+1 zeros(1,length(MSdsi))+2])
% xticklabels({'WT','SI','DSI'})
% ylabel('Median CALM Intensity')
% subplot(3,2,4)
% notBoxPlot([MMwt MMsi MMdsi], [zeros(1,length(MSwt)) zeros(1,length(MSsi))+1 zeros(1,length(MSdsi))+2])
% xticklabels({'WT','SI','DSI'})
% ylabel('Median Clathrin Intensity')
% subplot(3,2,5)
% notBoxPlot([LTwt LTsi LTdsi], [zeros(1,length(MSwt)) zeros(1,length(MSsi))+1 zeros(1,length(MSdsi))+2])
% xticklabels({'WT','SI','DSI'})
% ylabel('Median Lifetime')
% subplot(3,2,6)
% notBoxPlot([MSDwt MSDsi MSDdsi], [zeros(1,length(MSwt)) zeros(1,length(MSsi))+1 zeros(1,length(MSdsi))+2])
% xticklabels({'WT','SI','DSI'})
% ylabel('Clathrin Slope Standard Deviation')