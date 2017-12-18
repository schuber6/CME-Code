function [LsZL,xbins]=LinkedSlopesWrapper_Range_NoPlot(NSTA,beg,fin,fg)


[Zcell,INTcell,inds]=MakeCellsFromNSTA(NSTA);
slopesINT = slope_finding(INTcell,fg,0);
slopesZ = slope_finding_NoNorm(Zcell,fg,0);
ListLinkedSlopes_Range;
BinZIslopes;
