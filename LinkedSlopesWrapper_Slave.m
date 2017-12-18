function [M,SE]=LinkedSlopesWrapper_Slave(NSTA,fg)

CW=[0 0 1];
[Zcell,INTcell,Fcell,inds]=MakeCellsFromNSTA_Slave(NSTA);
[slopesINT,minint] = slope_finding(INTcell,3,0);
slopesZ=Zcell; % = slope_finding_NoNorm(Zcell,fg,0);
ListLinkedSlopes;
BinZIslopesZvalue;
PlotLinkedValue;
% figure
% subplot(1,2,1)
% scatter(LvZ,LsZ)
% subplot(1,2,2)
% scatter(LvI,LsI)