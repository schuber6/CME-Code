for i=1:length(usedSI)
    I=usedSI(i);
    DataSI(i).CALMCytosol=Cyt(usedSI(i))-Back(usedSI(i));
    DataSI(i).AP2AverageIntensity=MI(I,1);
    DataSI(i).AP2AverageMaxIntensity=MM(I,1);
    DataSI(i).Area=Area(I);
    DataSI(i).CALMAverageIntensity=SI(I,1);
    DataSI(i).CALMAverageMaxIntensity=MS(I,1);
    DataSI(i).file=filessi{I};
end

%%

for i=1:length(Cyt_WT)
    DataWT(i).CALMCytosol=Cyt_WT(i)-Back_WT(i);
    DataWT(i).Area=Area(i);
    DataWT(i).AP2AverageIntensity=MI(i,1);
    DataWT(i).AP2AverageMaxIntensity=MM(i,1);
    DataWT(i).CALMAverageIntensity=SI(i,1);
    DataWT(i).CALMAverageMaxIntensity=MS(i,1);
    DataWT(i).file=files{i};
end