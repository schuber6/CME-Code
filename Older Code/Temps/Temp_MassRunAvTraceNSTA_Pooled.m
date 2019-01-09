Cut=10;

folder='E:\CME Superfolder\CME Data\180110_AP2CLCa_Day2';
reg='*fast*3dt*pre*ZGauss*';
files=FindFiles(folder,reg);
BegMI=cell(1,Cut);
FinMI=cell(1,Cut);
BegMZ=cell(1,Cut);
FinMZ=cell(1,Cut);
BegSI=cell(1,Cut);
FinSI=cell(1,Cut);
BegSZ=cell(1,Cut);
FinSZ=cell(1,Cut);
BegAC=cell(1,Cut);
FinAC=cell(1,Cut);
for i=1:length(files)
    load(files{i})
    disp=0;
    if i==length(files)
        disp=1;
    end
    [Sample,BegMI,FinMI,BegMZ,FinMZ,BegSI,FinSI,BegSZ,FinSZ,BegAC,FinAC]=AverageTraceNSTAms_ZGauss_Add_MedMaxNorm(NSTAms,BegMI,FinMI,BegMZ,FinMZ,BegSI,FinSI,BegSZ,FinSZ,BegAC,FinAC,disp,[0 1 0]);
end

folder='E:\CME Superfolder\CME Data\180110_AP2CLCa_Day2';
reg='*fast*3dt*post*ZGauss*';
files=FindFiles(folder,reg);
BegMI=cell(1,Cut);
FinMI=cell(1,Cut);
BegMZ=cell(1,Cut);
FinMZ=cell(1,Cut);
BegSI=cell(1,Cut);
FinSI=cell(1,Cut);
BegSZ=cell(1,Cut);
FinSZ=cell(1,Cut);
BegAC=cell(1,Cut);
FinAC=cell(1,Cut);
for i=[1 2 6 8 9] %eliminate slightly sketchy movies
    load(files{i})
    disp=0;
    if i==length(files)
        disp=1;
    end
    [Sample,BegMI,FinMI,BegMZ,FinMZ,BegSI,FinSI,BegSZ,FinSZ,BegAC,FinAC]=AverageTraceNSTAms_ZGauss_Add_MedMaxNorm(NSTAms,BegMI,FinMI,BegMZ,FinMZ,BegSI,FinSI,BegSZ,FinSZ,BegAC,FinAC,disp,[1 0 0]);
end