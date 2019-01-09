function [MSDwt,SSDwt,MSDsi,SSDsi,slopeWT,slopeSI]=JoshSlopeHists_SIRNA(fileswt,filessi)

Cs=[1 2 3 5 6];

figure
i=1;
load(fileswt{i})
[IntCellM,IntCellS]=FXYCMS2IntCells(FXYCMS,Cs);
[slopesM] = my_slope_finding(IntCellM,2,400);
[slopesS] = my_slope_finding(IntCellS,2,400);


Rmin=.000001;

[slopeM,slopeS]=UnpackJoshSlopes(slopesM,slopesS,Rmin);
%figure
subplot(1,2,1)
[HMwt,Mbins]=hist(slopeM,50);
subplot(1,2,2)
[HSwt,Sbins]=hist(slopeS,50);

FXYCMSwt={};
for i=1:length(fileswt)
    load(fileswt{i})
    FXYCMSwt=CombineCells(FXYCMSwt,FXYCMS);
end

[IntCellM,IntCellS]=FXYCMS2IntCells(FXYCMSwt,Cs);
[slopesM] = my_slope_finding(IntCellM,2,400);
[slopesS] = my_slope_finding(IntCellS,2,400);
[slopeM,slopeS]=UnpackJoshSlopes(slopesM,slopesS,Rmin);
slopeWT=slopeM;
subplot(1,2,1)
[HMwt,Mbins]=hist(slopeM,Mbins);
plot(Mbins,HMwt/sum(HMwt),'g')
hold on
subplot(1,2,2)
[HSwt,Sbins]=hist(slopeS,Sbins);
plot(Sbins,HSwt/sum(HSwt),'r')
hold on
MSDwt(i)=sqrt(var(slopeM));
SSDwt(i)=sqrt(var(slopeS));

FXYCMSsi={};
for i=1:length(filessi)
    load(filessi{i})
    FXYCMSsi=CombineCells(FXYCMSsi,FXYCMS);
end

[IntCellM,IntCellS]=FXYCMS2IntCells(FXYCMSsi,Cs);
[slopesM] = my_slope_finding(IntCellM,2,400);
[slopesS] = my_slope_finding(IntCellS,2,400);



[slopeM,slopeS]=UnpackJoshSlopes(slopesM,slopesS,Rmin);
slopeSI=slopeS;
%figure
subplot(1,2,1)
[HMsi,Mbins]=hist(slopeM,Mbins);
plot(Mbins,HMsi/sum(HMsi),'g--')
hold on
subplot(1,2,2)
[HSsi,Sbins]=hist(slopeS,Sbins);
plot(Sbins,HSsi/sum(HSsi),'r--')
hold on
MSDsi(i)=sqrt(var(slopeM));
SSDsi(i)=sqrt(var(slopeS));
