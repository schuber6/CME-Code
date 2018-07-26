clear all
file='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath WT\Movies\wt_018_BS_Bright_Traces.mat';
load(file)
[IntCellM,IntCellS]=FXYCMS2IntCells(FXYCMS,3);
[slopesM] = my_slope_finding(IntCellM,2,0);
[slopesS] = my_slope_finding(IntCellS,2,0);
[slopeM,slopeS]=UnpackJoshSlopes(slopesM,slopesS,10^(-3));

[Hm,mbins]=hist(slopeM,100);
[Hs,sbins]=hist(slopeS,mbins);
figure(1)
plot(mbins,Hm/sum(Hm)/(mbins(2)-mbins(1)),'r')
hold on
figure(2)
plot(mbins,Hs/sum(Hs)/(mbins(2)-mbins(1)),'g')
hold on
save TempWTSlopes.mat

%%

clear all
file='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath SI Low CALM\Movies\si_072_BS_Red_Bright_Traces.mat';
load(file)
[IntCellM,IntCellS]=FXYCMS2IntCells(FXYCMS,3);
[slopesM] = my_slope_finding(IntCellM,2,0);
[slopesS] = my_slope_finding(IntCellS,2,0);
[slopeM,slopeS]=UnpackJoshSlopes(slopesM,slopesS,10^(-3));

[Hm,mbins]=hist(slopeM,100);
[Hs,sbins]=hist(slopeS,mbins);
figure(1)
plot(mbins,Hm/sum(Hm)/(mbins(2)-mbins(1)),'r:')
hold on
figure(2)
plot(mbins,Hs/sum(Hs)/(mbins(2)-mbins(1)),'g:')
hold on
save TempDSISlopes.mat

%%

clear all
file='E:\CME Superfolder\CME Data\DoubleSIRNA_Analysis\Clath SI\Movies\si_024_BS_Bright_Traces.mat';
load(file)
[IntCellM,IntCellS]=FXYCMS2IntCells(FXYCMS,3);
[slopesM] = my_slope_finding(IntCellM,2,0);
[slopesS] = my_slope_finding(IntCellS,2,0);
[slopeM,slopeS]=UnpackJoshSlopes(slopesM,slopesS,10^(-3));

[Hm,mbins]=hist(slopeM,100);
[Hs,sbins]=hist(slopeS,mbins);
figure(1)
plot(mbins,Hm/sum(Hm)/(mbins(2)-mbins(1)),'r--')
hold on
figure(2)
plot(mbins,Hs/sum(Hs)/(mbins(2)-mbins(1)),'g--')
hold on
save TempSISlopes.mat