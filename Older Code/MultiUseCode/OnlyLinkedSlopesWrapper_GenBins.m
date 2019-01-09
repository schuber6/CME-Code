function [LvZ,LsZ,LvI,LsI,LvF,M,SE,LsZL]=OnlyLinkedSlopesWrapper_GenBins(NSTA,fg,zg,C,plo)

Nbins=2;
DistCutoff=2;
[Zcell,INTcell,Fcell,inds]=MakeCellsFromNSTA(NSTA);
[slopesINT,minint] = slope_finding(INTcell,fg,0);
slopesZ = slope_finding_NoNorm(Zcell,fg,0);
ListLinkedSlopes;
BinZIslopes_GenBins;
%figure
PlotOnlyLinkedSlopes;
% figure
% subplot(1,2,1)
% scatter(LvZ,LsZ)
% subplot(1,2,2)
% scatter(LvI,LsI)