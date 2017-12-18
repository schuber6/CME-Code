function [M]=LinkedSlopesWrapper_OutlierRemoval(NSTA)

[Zcell,INTcell]=MakeCellsFromNSTA(NSTA);
slopesINT = slope_finding(INTcell,3,0);
slopesZ = slope_finding_NoNorm(Zcell,3,0);
ListLinkedSlopes;
BinZIslopes_OutlierRemoval;
PlotLinkedSlopes;