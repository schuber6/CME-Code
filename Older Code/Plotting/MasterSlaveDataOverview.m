function MasterSlaveDataOverview(files1,files2)

MinLT=10;
MinInt=1000;

for i=1:length(files2)
    load(files2{i})
    [FXYCMS_Sel_si{i},LTs_si{i},MMs_si{i},MSs_si{i}]=SelectSmallOnes(FXYCMS,MinLT);
    [MI_si{i},SI_si{i},~]=SelectFirstFrameEvents(FXYCMS,MinInt);
end
for i=1:length(files1)
    load(files1{i})
    [FXYCMS_Sel_wt{i},LTs_wt{i},MMs_wt{i},MSs_wt{i}]=SelectSmallOnes(FXYCMS,MinLT);
    [MI_wt{i},SI_wt{i},~]=SelectFirstFrameEvents(FXYCMS,MinInt);
end


[MSDwt,SSDwt]=CalculateJoshSlopeSDs_FXYCMS(files1);
[MSDsi,SSDsi]=CalculateJoshSlopeSDs_FXYCMS(files2);

LTsi=StatCell(LTs_si,'median');
LTwt=StatCell(LTs_wt,'median');
MMsi=StatCell(MMs_si,'median');
MMwt=StatCell(MMs_wt,'median');
MSsi=StatCell(MSs_si,'median');
MSwt=StatCell(MSs_wt,'median');

MIsi=StatCell(MI_si,'median');
MIwt=StatCell(MI_wt,'median');

SIsi=StatCell(SI_si,'median');
SIwt=StatCell(SI_wt,'median');


FrameRate=2;
figure
subplot(2,2,1)
notBoxPlot([MSwt MSsi], [zeros(1,length(MSwt)) zeros(1,length(MSsi))+1])
xticklabels({'WT','SI'})
ylabel('Median CALM Intensity')
subplot(2,2,2)
notBoxPlot([MMwt MMsi], [zeros(1,length(MSwt)) zeros(1,length(MSsi))+1])
xticklabels({'WT','SI'})
ylabel('Median Clathrin Intensity')
subplot(2,2,3)
notBoxPlot([LTwt*FrameRate LTsi*FrameRate], [zeros(1,length(MSwt)) zeros(1,length(MSsi))+1])
xticklabels({'WT','SI','DSI'})
ylabel('Median Lifetime (s)')
subplot(2,2,4)
notBoxPlot([MSDwt MSDsi], [zeros(1,length(MSwt)) zeros(1,length(MSsi))+1])
xticklabels({'WT','SI'})
ylabel('Clathrin Slope Standard Deviation')