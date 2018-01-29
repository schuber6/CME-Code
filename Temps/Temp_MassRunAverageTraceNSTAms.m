folder='E:\CME Superfolder\CME Data\180110_AP2CLCa_Day2';
regPre='*fast*preosmo*LinkedMS.mat';
files=FindFiles(folder,regPre);
Cut=10;
BegMI=cell(1,Cut);
FinMI=cell(1,Cut);
BegMZ=cell(1,Cut);
FinMZ=cell(1,Cut);
BegSI=cell(1,Cut);
FinSI=cell(1,Cut);
BegSZ=cell(1,Cut);
FinSZ=cell(1,Cut);
for i=1:length(files)
    load(files{i})
    %PreSample(i)=AverageTraceNSTAms(NSTAms);
    display=0;
    if i==length(files)
        display=1;
    end
    [Sample,BegMI,FinMI,BegMZ,FinMZ,BegSI,FinSI,BegSZ,FinSZ]=AverageTraceNSTAms_Add(NSTAms,BegMI,FinMI,BegMZ,FinMZ,BegSI,FinSI,BegSZ,FinSZ,display);
end
folder='E:\CME Superfolder\CME Data\180110_AP2CLCa_Day2';
regPre='*fast*postosmo*LinkedMS.mat';
files=FindFiles(folder,regPre);
BegMI=cell(1,Cut);
FinMI=cell(1,Cut);
BegMZ=cell(1,Cut);
FinMZ=cell(1,Cut);
BegSI=cell(1,Cut);
FinSI=cell(1,Cut);
BegSZ=cell(1,Cut);
FinSZ=cell(1,Cut);
for i=1:length(files)
    load(files{i})
    %PreSample(i)=AverageTraceNSTAms(NSTAms);
    display=0;
    if i==length(files)
        display=1;
    end
    [Sample,BegMI,FinMI,BegMZ,FinMZ,BegSI,FinSI,BegSZ,FinSZ]=AverageTraceNSTAms_Add(NSTAms,BegMI,FinMI,BegMZ,FinMZ,BegSI,FinSI,BegSZ,FinSZ,display);
end