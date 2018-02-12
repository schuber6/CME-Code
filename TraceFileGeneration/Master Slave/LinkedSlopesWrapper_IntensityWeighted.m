function LinkedSlopesWrapper_IntensityWeighted(NSTA)

[Zcell,INTcell]=MakeCellsFromNSTA(NSTA);
slopesINT = slope_finding(INTcell,3,0);
slopesZ = slope_finding_NoNorm(Zcell,3,0);
ListLinkedSlopes;
BinZIslopes_IntensityWeighted;
PlotLinkedSlopes_BZslopes;