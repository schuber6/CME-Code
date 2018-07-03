function [MSD,SSD]=CalculateJoshSlopeSDs_FXYCMS(files)



Rmin=.01;
Cs=[1 2 3];


for i=1:length(files)
    load(files{i})
    [IntCellM,IntCellS]=FXYCMS2IntCells(FXYCMS,Cs);
    [slopesM] = my_slope_finding(IntCellM,2,400);
    [slopesS] = my_slope_finding(IntCellS,2,400);
    [slopeM,slopeS]=UnpackJoshSlopes(slopesM,slopesS,Rmin);
    MSD(i)=sqrt(var(slopeM));
    SSD(i)=sqrt(var(slopeS));
end
