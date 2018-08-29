function [slopeM,slopeS]=JoshSlopes_FXYCMS(FXYCMS)

Cs=[1 2 3 5 6];

[IntCellM,IntCellS]=FXYCMS2IntCells(FXYCMS,Cs);
[slopesM] = my_slope_finding(IntCellM,2,400);
[slopesS] = my_slope_finding(IntCellS,2,400);


Rmin=.000001;

[slopeM,slopeS]=UnpackJoshSlopes(slopesM,slopesS,Rmin);