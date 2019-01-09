function LinkedSlopesWrapper(NSTA,fg,zg)

CW=[0 0 1];
[Zcell,INTcell,Fcell,inds]=MakeCellsFromNSTA(NSTA);
[slopesINT,minint] = slope_finding(INTcell,fg,0);
slopesZ = slope_finding_NoNorm(Zcell,fg,0);
ListLinkedSlopes;
BinZIslopes;
PlotLinkedSlopes;
figure
subplot(1,2,1)
scatter(LvZ,LsZ)
subplot(1,2,2)
scatter(LvI,LsI)