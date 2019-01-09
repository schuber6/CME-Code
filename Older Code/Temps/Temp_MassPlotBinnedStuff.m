folder='E:\CME Superfolder\CME Data\180110_AP2CLCa_Day2';
regPre='*fast*preosmo*ZGauss.mat';
files=FindFiles(folder,regPre);
JMSlopes=[];
JSSlopes=[];
JMints=[];
JSints=[];
JACs=[];
JMrsq=[];
for i=1:length(files)
    load(files{i})
    
    [JMSlopes,JSSlopes,JMints,JSints,JACs,JMrsq]=BinByJoshSlope_add_MedMaxNorm_ZGauss(NSTAms,JMSlopes,JSSlopes,JMints,JSints,JACs,JMrsq);
end
FSFig()
Col=[0 1 0];
BinAndPlotJoshSlopeValues


folder='E:\CME Superfolder\CME Data\180110_AP2CLCa_Day2';
regPre='*fast*postosmo*ZGauss.mat';
files=FindFiles(folder,regPre);
JMSlopes=[];
JSSlopes=[];
JMints=[];
JSints=[];
JACs=[];
JMrsq=[];
for i=1:length(files) %[1 2 6 8 9] %eliminate slightly sketchy movies
    load(files{i})
    [JMSlopes,JSSlopes,JMints,JSints,JACs,JMrsq]=BinByJoshSlope_add_MedMaxNorm_ZGauss(NSTAms,JMSlopes,JSSlopes,JMints,JSints,JACs,JMrsq);
    
end
Col=[1 0 0];
BinAndPlotJoshSlopeValues
legend('Pre Osmo','Post Osmo')