CBS_WT=Cyt_WT-Back_WT;
CBS_SI=Cyt_SI-Back_SI;
CBS_DSI=Cyt_DSI-Back_DSI;
SI=[CBS_SI(1:4) CBS_DSI(6:7)];
DSI=[CBS_SI(5) CBS_DSI([1 3 4 7 8])];
figure
notBoxPlot([CBS_WT SI DSI], [zeros(1,length(CBS_WT)) zeros(1,length(SI))+1 zeros(1,length(DSI))+2])
xticklabels({'WT','SI','DSI'})
ylabel('Median CALM Intensity')

%%

% CBS_WT=Cyt_WT-Back_WT;
% CBS_SI=Cyt_SI-Back_SI;
% CBS_DSI=Cyt_DSI-Back_DSI;
load('DoubleSI_SumCALMs.mat')
SI=[Sum_SI(1:4) Sum_DSI(5:6)];
DSI=[Sum_SI(5) Sum_DSI([1 2 3 4 7])];
figure
notBoxPlot([Sum_WT SI DSI], [zeros(1,length(Sum_WT)) zeros(1,length(SI))+1 zeros(1,length(DSI))+2])
xticklabels({'WT','SI','DSI'})
ylabel('Median CALM Intensity (Including Spots)')

%%

figure
notBoxPlot([ThreshWT ThreshSI ThreshDSI], [zeros(1,length(ThreshWT)) zeros(1,length(ThreshSI))+1 zeros(1,length(ThreshDSI))+2])
xticklabels({'WT','SI','DSI'})
ylabel('Cytosolic CALM Threshold')
