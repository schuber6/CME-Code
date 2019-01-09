function FXYCMS=AddMSJoshSlopes(FXYCMS,FrameGap)

Cs=[1 2 3 5 6];
[IntCellM,IntCellS,Is]=FXYCMS2IntCells(FXYCMS,Cs);
[slopesM] = my_slope_finding(IntCellM,FrameGap,400);
[slopesS] = my_slope_finding(IntCellS,FrameGap,400);
[FXYCMS]=RepackJoshSlopes(slopesM,slopesS,Is,FXYCMS);