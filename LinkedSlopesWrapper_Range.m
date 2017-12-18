function [DataCK,LsZL,NT]=LinkedSlopesWrapper_Range(NSTA,beg,fin,zg,CW,fg)

[Zcell,INTcell,Fcell,inds]=MakeCellsFromNSTA(NSTA);
slopesINT = slope_finding(INTcell,3,0);
slopesZ = slope_finding_NoNorm(Zcell,3,0);
ListLinkedSlopes_Range;
BinZIslopes;
PlotLinkedSlopes_LineHist;