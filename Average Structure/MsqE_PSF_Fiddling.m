clear all
load('DataWT_SI.mat')
CalculatePSF;
r=3;
for i=1:1
fileG=DataSI(i).movieG;
fileR=DataSI(i).movieR;
file=DataSI(i).file;
load(file)
MsqE_si{i}=CalculatePSFmeansquarederror(fileR,FXYCMS,sr,r,1);
end
for i=2:2
fileG=DataWT(i).movieG;
fileR=DataWT(i).movieR;
file=DataWT(i).file;
load(file)
MsqE_wt{i}=CalculatePSFmeansquarederror(fileR,FXYCMS,sr,r,1);
end

figure

[Hwt{2},xbins]=hist(MsqE_wt{2},25);
for i=2:2
plot(xbins,Hwt{i}/sum(Hwt{i}),'g')
hold on
end
for i=1:1
[Hsi{i}]=hist(MsqE_si{i},xbins);
plot(xbins,Hsi{i}/sum(Hsi{i}),'r')
end

