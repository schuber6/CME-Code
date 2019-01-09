function [MSDwt,SSDwt,MSDsi,SSDsi,slopeWT,slopeSI]=JoshSlopeHists_SIRNA_NoPlot(fileswt,filessi)

Cs=[1 2 3 5 6];

figure
i=1;
load(fileswt{i})
[IntCellM,IntCellS]=FXYCMS2IntCells(FXYCMS,Cs);
[slopesM] = my_slope_finding(IntCellM,2,400);
[slopesS] = my_slope_finding(IntCellS,2,400);


Rmin=.000001;

[slopeM,slopeS]=UnpackJoshSlopes(slopesM,slopesS,Rmin);

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

MSDsi(i)=sqrt(var(slopeM));
SSDsi(i)=sqrt(var(slopeS));
