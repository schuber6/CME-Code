folder='E:\CME Superfolder\CME Data\180110_AP2CLCa_Day2';
reg='*fast*3dt*pre*ZGauss*';
files=FindFiles(folder,reg);
for i=1:length(files)
    load(files{i})
    [Sample,BegMI,FinMI,BegMZ,FinMZ,BegSI,FinSI,BegSZ,FinSZ]=AverageTraceNSTAms_ZGauss(NSTAms);
end

folder='E:\CME Superfolder\CME Data\180110_AP2CLCa_Day2';
reg='*fast*3dt*post*ZGauss*';
files=FindFiles(folder,reg);
for i=1:length(files)
    load(files{i})
    [Sample,BegMI,FinMI,BegMZ,FinMZ,BegSI,FinSI,BegSZ,FinSZ]=AverageTraceNSTAms_ZGauss(NSTAms);
end