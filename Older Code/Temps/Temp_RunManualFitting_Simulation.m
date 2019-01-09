events=[];
for ifr=1:5000
    for ix=[10 29] 
        for iy=13.5:8.5:175
            events=[events ; [ifr iy ix]];
        end
    end
end
fileMaster='E:\CME Superfolder\CME Data\180301_Simulation\sim_1_BackgroundAdd.tif';
[MIs,Bs]=ManualFitEvents_BackR(events,fileMaster,3);

